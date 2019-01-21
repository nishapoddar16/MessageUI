//
//  ViewController.swift
//  MailCheck
//
//  Created by Tejaswi Tipparti on 21/01/19.
//  Copyright © 2019 Tejaswi Tipparti. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var textfield : UITextField!
    @IBOutlet weak var subjectTextfield : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func sendMail(_ sender : UIButton){
        let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([])
        mailComposeVC.setSubject("subject for your e-mail")
        mailComposeVC.setMessageBody("Write in your body for the e-mail", isHTML: false)
        return mailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}

