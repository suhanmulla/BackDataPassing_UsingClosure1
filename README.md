1. Declaring a Closure in SecondViewController
   
   var backDataPassingClosure: ((String) -> Void)?
   
   Purpose: This closure is used to pass data (a String in this case) back to ViewController.
   Type: The closure takes a String as input and returns nothing (Void).

2. Back Button Action in SecondViewController
   Triggering the Closure
   
   @IBAction func backBtn(_ sender: UIButton) {
    guard let passDataClosure = backDataPassingClosure else {
        return
    }

    firstName = nameText.text
    passDataClosure(firstName!)
    self.navigationController?.popViewController(animated: true)
}

guard Statement: Ensures that the closure is not nil before using it.
nameText.text: Retrieves the user-entered text from the UITextField.
Passing Data: The retrieved text (firstName) is passed to the closure.
Navigating Back: self.navigationController?.popViewController returns to the previous screen (ViewController).

3. Setting Up backDataPassingClosure in ViewController
   Handling the Data
   
   @IBAction func nextBtn(_ sender: UIButton) {
    let secVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    
    secVC.backDataPassingClosure = { firstName in
        self.nameLbl.text = firstName
    }

    self.navigationController?.pushViewController(secVC, animated: true)
}

View Controller Navigation:
nextBtn is triggered when the "Next" button is tapped.
The app navigates to SecondViewController using self.navigationController?.pushViewController.
Setting Up Closure:
The backDataPassingClosure is assigned a closure in which firstName (data passed back) is received.
The received data (firstName) is displayed in the UILabel (nameLbl).

4. Lifecycle: Data Flow
   From ViewController to SecondViewController

When "Next" is tapped, the app navigates to SecondViewController.
From SecondViewController Back to ViewController

The user enters text in nameText and taps the "Back" button.
The text is passed via backDataPassingClosure to ViewController.
ViewController updates the nameLbl with the passed data.

