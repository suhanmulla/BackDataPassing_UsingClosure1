//
//  ViewController.swift
//  BackDataPassing_UsingClosure1
//
//  Created by Macintosh on 10/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextBtn(_ sender: UIButton) {
        let secVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // 4th Step --> Call the data & bind the data
        secVC.backDataPassingClosure = {firstName in
            self.nameLbl.text = firstName
        }
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
}

