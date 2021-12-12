//
//  ViewController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 23.09.2021.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet var versionLabel: UILabel!
    
    @IBAction func goToVoting(_ sender: Any) {
        if isVoted {
            let alert = UIAlertController(title: "Вы уже голосовали", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(
                title: "OK",
                style: .cancel,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "goToVote", sender: nil)
        }
    }
    
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionLabel.text = "ver. " + (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String)
    }


}

