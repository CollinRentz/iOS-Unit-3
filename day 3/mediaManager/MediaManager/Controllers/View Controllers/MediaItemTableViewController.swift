//
//  MediaItemTableViewController.swift
//  MediaManager
//
//  Created by Collin Rentz 11/23/22.
//

import UIKit

class MediaItemTableViewController: UITableViewController {
    
    var items: [MediaItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaItemCell", for: indexPath)

        let item = items[indexPath.row]

        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = String(item.rating)
        
        return cell
    }
    
    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toMediaItemDetailVC" {
             guard let indexPath = tableView.indexPathForSelectedRow else { return }
             let destination = segue.destination as! MediaItemDetailViewController
             destination.delegate = self
             destination.mediaItem = items[indexPath.row]
         }
     }
}

extension MediaItemTableViewController: DeleteItemDelegate {
    func deleteItem(mediaItem: MediaItem) {
        guard let index = items.firstIndex(of: mediaItem) else { return }
        items.remove(at: index)
        tableView.reloadData()
    }
}
