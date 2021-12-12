//
//  VotingTableCV.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 25.09.2021.
//

import UIKit

class VotingTableCV: UITableViewController, ButtonDelegate {
    
    private var currentCat: Cat?
    var num: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(
            UINib(
                nibName: "TableViewCell",
                bundle: nil),
            forCellReuseIdentifier: "votingCatCell")
        tableView.register(
            UINib(
                nibName: "VotingButtonCell",
                bundle: nil),
            forCellReuseIdentifier: "votingButtonCell")
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cats.count + 1
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == cats.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "votingButtonCell", for: indexPath) as? VotingButtonCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "votingCatCell", for: indexPath) as? VotingCatCell else { return UITableViewCell() }

        cell.configure(cat: cats[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        if indexPath.row >= cats.count {
            return
        }
        currentCat = cats[indexPath.row]
        performSegue(withIdentifier: "showCatFromVote", sender: nil)
    }
    
    func askVoting(){
        let alert = UIAlertController(
            title: "Вы уверены?",
            message: "Изменить выбор будет нельзя",
            preferredStyle: .actionSheet)
        let actionYes = UIAlertAction(
            title: "Уверен",
            style: .cancel,
            handler: {_ in self.endVoting()})
        let actionNo = UIAlertAction(
            title: "Еще подумаю",
            style: .destructive,
            handler: nil)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        present(alert, animated: true, completion: nil)
    }
    
    func onButtonTap(sender: UIButton) {
        catchVoiting()
    }
    
    func catchVoiting(){
        for num in (0..<cats.count) {
            self.num = num
            guard let cell = tableView.cellForRow(at: IndexPath(row: num, section: 0)) as? VotingCatCell else { return }
            if cell.checkBox.isSelected {
                askVoting()
                return
            }
        }
        let alert = UIAlertController(title: "Сделайте выбор!", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .destructive,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func endVoting() {
        election.makeVote(cat: cats[num])
        
        let alert = UIAlertController(title: "Спасибо!", message: "Ваш голос учтен", preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: {_ in self.performSegue(withIdentifier: "unwindToMainVC", sender: nil)})
        alert.addAction(action)
        present(alert, animated: true, completion: {isVoted = true})
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let catVC = segue.destination as? CatTableVC else { return }
        catVC.currentCat = self.currentCat
    }
}
