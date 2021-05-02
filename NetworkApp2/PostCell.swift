//
//  PostCell.swift
//  NetworkApp2
//
//  Created by Теона Магай on 02.05.2021.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    func configure(with post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
