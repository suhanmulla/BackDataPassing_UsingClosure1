//
//  SecondViewController.swift
//  BackDataPassing_UsingClosure1
//
//  Created by Macintosh on 10/01/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    
    var firstName : String?
    
    // 1st Step --> Declaring a Closure
    var backDataPassingClosure : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        guard let passDataClosure = backDataPassingClosure else {
            return
        }
        
        // 2nd Step --> getting data from textField
        firstName = nameText.text
        
        // 3rd Step --> Passing data to Closure
        passDataClosure(firstName!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
