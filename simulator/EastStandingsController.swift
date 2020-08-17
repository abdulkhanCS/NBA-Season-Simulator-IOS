//
//  EastStandingsController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/28/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class EastStandingsController: UIViewController {
    var eastTeams : [Team] = []
    var nonPlayoffTeams : [Team] = []
    var sortedTeams : [Team] = []
    var pastWinners : [Team] = []
    var NBAteams : [Team] = []

    //MARK: Outlets
    @IBOutlet weak var firstSeedEast: UILabel!
    @IBOutlet weak var secondSeedEast: UILabel!
    @IBOutlet weak var thirdSeedEast: UILabel!
    @IBOutlet weak var fourthSeedEast: UILabel!
    @IBOutlet weak var fifthSeedEast: UILabel!
    @IBOutlet weak var sixthSeedEast: UILabel!
    @IBOutlet weak var seventhSeedEast: UILabel!
    @IBOutlet weak var eighthSeedEast: UILabel!
    @IBOutlet weak var nonPlayoffEast: UILabel!
    
    @IBOutlet weak var firstSeedEastImage: UIImageView!
    @IBOutlet weak var secondSeedEastImage: UIImageView!
    @IBOutlet weak var thirdSeedEastImage: UIImageView!
    @IBOutlet weak var fourthSeedEastImage: UIImageView!
    @IBOutlet weak var fifthSeedEastImage: UIImageView!
    @IBOutlet weak var sixthSeedEastImage: UIImageView!
    @IBOutlet weak var seventhSeedEastImage: UIImageView!
    @IBOutlet weak var eighthSeedEastImage: UIImageView!
    
    //MARK: Actions
    @IBAction func goToPlayoffs(_ sender: UIBarButtonItem) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "PlayoffsSimulationController") as! PlayoffsSimulationController
        vc.sortedTeams = sortedTeams
        vc.pastWinners = pastWinners
        vc.NBAteams = NBAteams
    self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var seedCounter = 1
        for team in eastTeams{
            team.seed = seedCounter
            seedCounter = seedCounter + 1
        }
        
        firstSeedEast.text = "1. " + toString(obj: eastTeams[0])
        secondSeedEast.text = "2. " + toString(obj: eastTeams[1])
        thirdSeedEast.text = "3. " + toString(obj: eastTeams[2])
        fourthSeedEast.text = "4. " + toString(obj: eastTeams[3])
        fifthSeedEast.text = "5. " + toString(obj: eastTeams[4])
        sixthSeedEast.text = "6. " + toString(obj: eastTeams[5])
        seventhSeedEast.text = "7. " + toString(obj: eastTeams[6])
        eighthSeedEast.text = "8. " + toString(obj: eastTeams[7])
        
        firstSeedEastImage.image = eastTeams[0].image
        secondSeedEastImage.image = eastTeams[1].image
        thirdSeedEastImage.image = eastTeams[2].image
        fourthSeedEastImage.image = eastTeams[3].image
        fifthSeedEastImage.image = eastTeams[4].image
        sixthSeedEastImage.image = eastTeams[5].image
        seventhSeedEastImage.image = eastTeams[6].image
        eighthSeedEastImage.image = eastTeams[7].image

        nonPlayoffEast.text = "9. " + toString(obj: nonPlayoffTeams[0])
            + "10. " + toString(obj: nonPlayoffTeams[1]) + "11. " + toString(obj: nonPlayoffTeams[2]) + "12. " + toString(obj: nonPlayoffTeams[3]) + "13. " + toString(obj: nonPlayoffTeams[4]) + "14. " + toString(obj: nonPlayoffTeams[5]) + "15. " + toString(obj: nonPlayoffTeams[6])
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toString(obj:Team)-> String{
        let losses = 82 - obj.wins
        let wins = obj.wins
        return ((obj.name) + " " + String(wins) + "-" + String(losses) + "  ")
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
