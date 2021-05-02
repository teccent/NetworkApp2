//
//  PostsViewController.swift
//  NetworkApp2
//
//  Created by Теона Магай on 02.05.2021.
//

import UIKit

class PostsViewController: UITableViewController {
    
    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 250
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }

}

// MARK: - Networking
extension PostsViewController {
    func fetchPosts() {
        guard let url = URL(string: URLExampl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
