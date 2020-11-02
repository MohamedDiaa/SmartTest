//
//  ScoreViewController.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-02.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol ScoreDisplayLogic: class {
    
}

class ScoreViewController: UIViewController, ScoreDisplayLogic {
    
    var interactor: ScoreBusinessLogic?
    var router: ScoreRoutingLogic?
    
    @IBOutlet weak var guessedWordLabel: UILabel!
    @IBOutlet weak var answerWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
        let view = self
        let interactor = ScoreInteractor()
        let presenter = ScorePresenter()
        let router = ScoreRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = view
        
        router.viewController = view
        router.dataStore = interactor
    }
    
    @IBAction func startAgain() {
        
        navigationController?.popToRootViewController(animated: true)
    }
}
