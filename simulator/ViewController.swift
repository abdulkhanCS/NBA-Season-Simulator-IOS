//
//  ViewController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/19/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var changedRating = 0
    var NBAteams = [Team]()
    //MARK: Properites
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailConference: UILabel!
    @IBOutlet weak var detailStrength: UILabel!
    @IBOutlet weak var detailWeakness: UILabel!
    @IBOutlet weak var detailRating: UILabel!
    
    
    @IBOutlet weak var saveReference: UIButton!
    @IBAction func saveChanges(_ sender: UIButton) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "TeamTableViewController") as! TeamTableViewController
        vc.changedRating = changedRating
        vc.changedTeam = team!
        vc.teamsLoaded = NBAteams
        self.navigationController?.pushViewController(vc, animated: true)
        saveReference.isEnabled = false
    }
    @IBAction func stepper(_ sender: UIStepper) {
//        saveReference.setTitleColor(UIColor.blue, for: .normal)
        saveReference.isEnabled = true
        saveReference.isHidden = false
        changedRating = numberRating + Int(sender.value)
        detailRating.text = "Rating: " + String(changedRating)
        
    }
    
    var team : Team? = nil
    var image = UIImage()
    var name = ""
    var conference = ""
    var strength = ""
    var weakness = ""
    var rating = ""
    var numberRating = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        saveReference.setTitleColor(UIColor.gray, for: .disabled)
        saveReference.isHidden = true
        detailName.text = name
        detailImage.image = image
        detailConference.text = conference
        detailStrength.text = strength
        detailWeakness.text = weakness
        detailRating.text = "Rating: " + rating
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

