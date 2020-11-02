//
//  GuessGifViewController.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol  GuessGifDisplayLogic: class {
    
    func displayScene(viewModel: GuessGif.FetchScene.ViewModel)
    func displayAnswer(viewModel: GuessGif.SubmitAnswer.ViewModel)
}

class GuessGifViewController: UIViewController, GuessGifDisplayLogic, UITextFieldDelegate {
    
    var interactor: GuessGifBusinessLogic?
    var router: (GuessGifRoutingLogic & GuessGifDataPassing)?
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var gifImageView: UIImageView!
    
    // MARK: - setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        
        let view = self
        let interactor = GuessGifInteractor()
        let presenter = GuessGifPresenter()
        let router = GuessGifRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = view
        
        router.viewController = view
        router.dataStore = interactor
    }
    
    // MARK: - setup UI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadScene()
    }
    
    private func setupUI() {
        
        mainLabel.text = "Guess what the Gif feels in one word"
        textField.delegate = self
    }
    
    private func loadScene() {
        
        let request = GuessGif.FetchScene.Request()
        interactor?.fetchScene(request: request)
    }
    
    // MARK: - display
    
    func displayScene(viewModel: GuessGif.FetchScene.ViewModel) {
        
        load(url:  viewModel.selectURL)
    }
    
    private func load(url: URL?) {
        
        gifImageView.image = nil
        
        DispatchQueue.global().async { [weak self] in
            
            guard let url = url
                else { return }
            
            guard let data = try? Data(contentsOf: url)
                else { return }
            
            DispatchQueue.main.async {
                
                self?.gifImageView.image = UIImage.gif(data: data)
            }
        }
    }
    
    func displayAnswer(viewModel: GuessGif.SubmitAnswer.ViewModel) {
        
        switch viewModel.scene {
        case .score:
            router?.routeToScore()
        default:
            return
        }
    }
    
    // MARK: - delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitAnswer() {
        
        let text = textField.text
        let request = GuessGif.SubmitAnswer.Request(query: text)
        interactor?.submitAnswer(request: request)
    }
}
