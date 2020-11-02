//
//  GifTableViewCell.swift
//  SmartTest
//
//  Created by Mohamed Diaa on 2020-11-01.
//  Copyright © 2020 Mohamed Diaa. All rights reserved.
//

import UIKit

class GifTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func load(with urlString: String?) {
        
        gifImageView.image = nil
        
        DispatchQueue.global().async { [weak self] in
            
            guard let string = urlString,
                let url = URL(string: string)
                else { return }
            
            guard let data = try? Data(contentsOf: url)
                else { return }
            
            DispatchQueue.main.async {
                
                self?.gifImageView.image = UIImage.gif(data: data)
            }
        }
    }
}
