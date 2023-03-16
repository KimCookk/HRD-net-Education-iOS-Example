//
//  TableViewController.swift
//  NetworkJsonMovie
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let networkModel = NetworkModel()
        
        networkModel.delegate = self
        networkModel.downloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! TableViewCell
        
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.mTitle
        cell.scoreLabel.text = movie.mScoreText
        
        let data = try? Data(contentsOf: movie.mImageURL!)
        cell.imgImageView.image = UIImage(data: data!)

        var score = movie.mScore
        cell.firstStartIv.image = UIImage(named: "star.png")
        cell.secondsStartIv.image = UIImage(named: "star.png")
        cell.thirdStartIv.image = UIImage(named: "star.png")
        cell.fourStartIv.image = UIImage(named: "star.png")
        cell.fiveStartIv.image = UIImage(named: "star.png")
        
        cell.firstStartIv.isHidden = true
        cell.secondsStartIv.isHidden = true
        cell.thirdStartIv.isHidden = true
        cell.fourStartIv.isHidden = true
        cell.fiveStartIv.isHidden = true
        
        if (score < 1)
        {
            
        }
        else if(score < 2)
        {
            cell.firstStartIv.isHidden = false
        }
        else if(score < 3)
        {
            cell.firstStartIv.isHidden = false
            cell.secondsStartIv.isHidden = false
        }
        else if(score < 4)
        {
            cell.firstStartIv.isHidden = false
            cell.secondsStartIv.isHidden = false
            cell.thirdStartIv.isHidden = false
        }
        else if(score < 5)
        {
            cell.firstStartIv.isHidden = false
            cell.secondsStartIv.isHidden = false
            cell.thirdStartIv.isHidden = false
            cell.fourStartIv.isHidden = false
        }
        else if(score < 6)
        {
            cell.firstStartIv.isHidden = false
            cell.secondsStartIv.isHidden = false
            cell.thirdStartIv.isHidden = false
            cell.fourStartIv.isHidden = false
            cell.fiveStartIv.isHidden = false
        }
        
        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TableViewController: NetworkModelProtocol
{
    func downloadedData(datas: [Movie]) {
        movies = datas
        listTableView.reloadData()
    }
}
