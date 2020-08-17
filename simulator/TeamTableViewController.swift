//
//  TeamTableViewController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/19/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//
import UIKit

class TeamTableViewController: UITableViewController {
    
    var teamsLoaded = [Team]()
    var pastWinners : [Team] = []
    var winner : Team? = nil
    var changedRating = 0
    var changedTeam : Team? = nil
    //MARK: Actions
    @IBAction func simulateSeason(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "SimulationController") as! SimulationController
        vc.NBAteams = teamsLoaded
        vc.pastWinners = pastWinners
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pastWinners(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "pastWinnersController") as! pastWinnersController
        vc.pastWinners = pastWinners
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Private Methods
    
     func loadTeams() -> [Team]{
    
        if(teamsLoaded.count == 0){
        let hawksIMG = UIImage(named: "appLogo")
        let Atlanta = Team(myName:"Atlanta Hawks", myRating:79, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East", myImage:hawksIMG!, mySeed:nil)
        let celticsIMG = UIImage(named: "appLogo")
        let Boston = Team(myName:"Boston Celtics", myRating:96, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East", myImage:celticsIMG!, mySeed:nil)
        let netsIMG = UIImage(named: "appLogo")
        let Brooklyn = Team(myName:"Brooklyn Nets", myRating:85, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East", myImage:netsIMG!, mySeed:nil)
        let hornetsIMG = UIImage(named: "appLogo")
        let Charlotte = Team(myName:"Charlotte Hornets", myRating:82, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: hornetsIMG!, mySeed:nil)
        let bullsIMG = UIImage(named: "appLogo")
        let Chicago = Team(myName:"Chicago Bulls", myRating:81, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East", myImage: bullsIMG!, mySeed:nil)
        let cavsIMG = UIImage(named: "appLogo")
        let Cleveland = Team(myName:"Cleveland Cavaliers", myRating:76, myStrength:"None", myWeakness:"Pace and Space", myConference:"East", myImage:cavsIMG!, mySeed:nil)
        let mavsIMG = UIImage(named: "appLogo")
        let Dallas = Team(myName:"Dallas Mavericks", myRating:93, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West", myImage: mavsIMG!, mySeed:nil)
        let nuggetsIMG = UIImage(named: "appLogo")
        let Denver = Team(myName:"Denver Nuggets", myRating:93, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West", myImage:nuggetsIMG!, mySeed:nil)
        let pistonsIMG = UIImage(named: "appLogo")
        let Detroit = Team(myName:"Detroit Pistons", myRating:81, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: pistonsIMG!, mySeed:nil)
        let warriorsIMG = UIImage(named: "appLogo")
        let GoldenState = Team(myName:"Golden State Warriors", myRating:73, myStrength:"None", myWeakness:"Grit and Grind", myConference:"West", myImage: warriorsIMG!, mySeed:nil)
        let rocketsIMG = UIImage(named: "appLogo")
        let Houston = Team(myName:"Houston Rockets", myRating:95, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: rocketsIMG!, mySeed:nil)
        let pacersIMG = UIImage(named: "appLogo")
        let Indiana = Team(myName:"Indiana Pacers", myRating:91, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: pacersIMG!, mySeed:nil)
        let clippersIMG = UIImage(named: "appLogo")
        let LAC = Team(myName:"L.A. Clippers", myRating:96, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: clippersIMG!, mySeed:nil)
        let lakersIMG = UIImage(named: "appLogo")
        let LAL = Team(myName:"L.A. Lakers", myRating:98, myStrength:"Balanced", myWeakness:"None", myConference:"West", myImage: lakersIMG!, mySeed:nil)
        let grizzliesIMG = UIImage(named: "appLogo")
        let Memphis = Team(myName:"Memphis Grizzlies", myRating:86, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: grizzliesIMG!, mySeed:nil)
        let heatIMG = UIImage(named: "appLogo")
        let Miami = Team(myName:"Miami Heat", myRating:93, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: heatIMG!, mySeed:nil)
        let bucksIMG = UIImage(named: "appLogo")
        let Milwaukee = Team(myName:"Milwaukee Bucks", myRating:99, myStrength:"Pace and Space", myWeakness:"None", myConference:"East", myImage: bucksIMG!, mySeed:nil)
        let wolvesIMG = UIImage(named: "appLogo")
        let Minnesota = Team(myName:"Minnesota Timberwolves", myRating:79, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: wolvesIMG!, mySeed:nil)
        let pelicansIMG = UIImage(named: "appLogo")
        let NewOrleans = Team(myName:"New Orleans Pelicans", myRating:86, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: pelicansIMG!, mySeed:nil)
        let knicksIMG = UIImage(named: "appLogo")
        let NewYork = Team(myName:"New York Knicks", myRating:76, myStrength:"None", myWeakness:"Grit and Grind", myConference:"East", myImage: knicksIMG!, mySeed:nil)
        let thunderIMG = UIImage(named: "appLogo")
        let OklahomaCity = Team(myName:"Oklahoma City Thunder", myRating:90, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West", myImage: thunderIMG!, mySeed:nil)
        let magicIMG = UIImage(named: "appLogo")
        let Orlando = Team(myName:"Orlando Magic", myRating:85, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: magicIMG!, mySeed:nil)
        let phillyIMG = UIImage(named: "appLogo")
        let Philadelphia = Team(myName:"Philadelphia 76ers", myRating:93, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East", myImage: phillyIMG!, mySeed:nil)
        let sunsIMG = UIImage(named: "appLogo")
        let Phoenix = Team(myName:"Phoenix Suns", myRating:82, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West", myImage: sunsIMG!, mySeed:nil)
        let blazersIMG = UIImage(named: "appLogo")
        let Portland = Team(myName:"Portland Trailblazers", myRating:85, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West", myImage: blazersIMG!, mySeed:nil)
        let kingsIMG = UIImage(named: "appLogo")
        let Sacramento = Team(myName:"Sacramento Kings", myRating:84, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West", myImage: kingsIMG!, mySeed:nil)
        let spursIMG = UIImage(named: "appLogo")
        let SanAntonio = Team(myName:"San Antonio Spurs", myRating:83, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West", myImage: spursIMG!, mySeed:nil)
        let raptorsIMG = UIImage(named: "appLogo")
        let Toronto = Team(myName:"Toronto Raptors", myRating:96, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East", myImage: raptorsIMG!, mySeed:nil)
        let jazzIMG = UIImage(named: "appLogo")
        let Utah = Team(myName:"Utah Jazz", myRating:91, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West", myImage: jazzIMG!, mySeed:nil)
        let wizardsIMG = UIImage(named: "appLogo")
        let Washington = Team(myName:"Washington Wizard", myRating:82, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East", myImage: wizardsIMG!, mySeed:nil)
        
        teamsLoaded += [Atlanta, Boston, Brooklyn, Charlotte, Chicago, Cleveland, Dallas, Denver, Detroit, GoldenState, Houston, Indiana, LAC, LAL, Memphis, Miami, Milwaukee, Minnesota, NewOrleans, NewYork, OklahomaCity, Orlando, Philadelphia, Phoenix, Portland, Sacramento, SanAntonio, Toronto, Utah, Washington]
        }
        
        for team in teamsLoaded{
            if (changedTeam?.name == team.name){
                team.rating = changedRating
            }
        }
    
        return teamsLoaded
    }
    
    override func viewDidLoad() {
        changedTeam?.rating = changedRating
        super.viewDidLoad()
        self.tableView.allowsSelection = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        print("LOADED")
        loadTeams()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        

    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        changedTeam?.rating = changedRating
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teamsLoaded.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TeamsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeamsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let team = teamsLoaded[indexPath.row]
        cell.teamName.numberOfLines = 0
        cell.teamConference.numberOfLines = 0
       
        
        cell.teamName.text = team.name
        cell.teamImage.image = team.image
        cell.teamConference.text = team.conference
        cell.teamRating.text = String(team.rating)
        // Configure the cell...
        
        return cell
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Start")
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.image = teamsLoaded[indexPath.row].image
        vc.name = teamsLoaded[indexPath.row].name
        vc.conference = teamsLoaded[indexPath.row].conference
        vc.strength = "Strength: " + teamsLoaded[indexPath.row].strength
        vc.weakness = "Weakness: " + teamsLoaded[indexPath.row].weakness
        vc.rating =  String(teamsLoaded[indexPath.row].rating)
        vc.numberRating = teamsLoaded[indexPath.row].rating
        vc.team = teamsLoaded[indexPath.row]
        vc.NBAteams = teamsLoaded
    
    
    
    self.navigationController?.pushViewController(vc, animated: true)
        print("End")
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
