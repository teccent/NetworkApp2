//
//  MainViewController.swift
//  NetworkApp2
//
//  Created by Теона Магай on 02.05.2021.
//

import UIKit

let URLExampl = "https://jsonplaceholder.typicode.com/posts"

class MainViewController: UIViewController {
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showPosts", sender: nil)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPosts" {
            guard let postsVC = segue.destination as? PostsViewController else { return }
            postsVC.fetchPosts()
        }
    }
}
