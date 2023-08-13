//
//  ViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 08/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPress(_ sender: Any) {
        let detailViewController = PromoViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

