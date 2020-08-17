//
//  pastWinnersController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 3/1/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class pastWinnersController: UIViewController {
    var pastWinners : [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        var iterator = 0
//        let header = UITextView()
//        header.text = "PAST WINNERS"
//        header.font = UIFont.init(name: (header.font?.fontName)!, size: 40.0)!
//        header.frame = CGRect(x: 50, y: 10 , width: 200, height: 80)
        for team in pastWinners{
            let image = pastWinners[iterator].image
            let teamName = pastWinners[iterator].name
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 40, y: 110+(iterator*90), width: 75, height: 75)
            let textView = UITextView()
            textView.text = teamName
            textView.font = UIFont.init(name: (textView.font?.fontName)!, size: 20.0)!
            textView.frame = CGRect(x: 150, y: 130+(iterator*90), width: 200, height: 50)
            
//            view.addSubview(header)
            view.addSubview(textView)
            view.addSubview(imageView)
            iterator = iterator + 1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
