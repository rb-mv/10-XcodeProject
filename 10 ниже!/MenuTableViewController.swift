//
//  MenuTableViewController.swift
//  10 ниже!
//
//  Created by Раджаб Магомедов on 21.10.2024.
//

import UIKit

class MenuTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playButton", for: indexPath)
        
        if let button = cell.viewWithTag(50) as? UIButton {
            button.addTarget(self, action: #selector(playMenuButtonTapped), for: .touchUpInside)
        }
        return cell
    }
    
    
    @objc func playMenuButtonTapped(_ button: UIButton) {
        
        //Переходим на другую вьюшку
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(withIdentifier: "gameViewController") as? ViewController {
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
