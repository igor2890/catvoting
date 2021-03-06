//
//  CatTableVC.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 01.10.2021.
//

import UIKit

class CatTableVC: UITableViewController {

    var currentCat: Cat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(
                nibName: "FotoCatCell",
                bundle: nil),
            forCellReuseIdentifier: "fotoCatCell")
        tableView.register(
            UINib(
                nibName: "NameCatCell",
                bundle: nil),
            forCellReuseIdentifier: "nameCatCell")
        tableView.register(
            UINib(
                nibName: "DescriptionCatCell",
                bundle: nil),
            forCellReuseIdentifier: "descriptionCatCell")
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cat = currentCat else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "fotoCatCell", for: indexPath) as? FotoCatCell else { return UITableViewCell() }
            cell.configure(cat: cat)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCatCell", for: indexPath) as? NameCatCell else { return UITableViewCell() }
            cell.configure(cat: cat)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCatCell", for: indexPath) as? DescriptionCatCell else { return UITableViewCell() }
            cell.configure(cat: cat)
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(
                at: indexPath,
                animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.width
        } else if indexPath.row == 1 {
            return 44.0
        } else {
            return 400.0
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
