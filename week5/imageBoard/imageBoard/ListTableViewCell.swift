//
//  ListTableViewCell.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var titleTextField: UILabel!
    @IBOutlet var listTextField: UILabel!
    @IBOutlet var dateTextField: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func update(with article: Article) {
    
        titleTextField.text = article.image_title
        listTextField.text = article.image_desc
        //dateTextField.text = article.ArticleDate.getDate(from: article)
        
    
    }
 
}
