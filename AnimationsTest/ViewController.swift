//
//  ViewController.swift
//  AnimationsTest
//
//  Created by Ildar Zalyalov on 28.06.16.
//  Copyright © 2016 com.flatstack. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var variants:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        variants = ["Base animation","Property Animator","Spring Animation","Recurcive Tree"]
        
    }


}

//MARK: - TableView Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.variants?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.variants[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyBoard: UIStoryboard = UIStoryboard(name: "AnimationSB", bundle: nil) else {return}
        var vc: UIViewController
        
        switch indexPath.row {
        case 0: vc = storyBoard.instantiateViewController(withIdentifier: "square")
        case 1: vc = storyBoard.instantiateViewController(withIdentifier: "propertyAnim")
        case 2: vc = storyBoard.instantiateViewController(withIdentifier: "spring")
        case 3: vc = storyBoard.instantiateViewController(withIdentifier: "tree")
        default: return
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
