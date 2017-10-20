//
//  NewsNewsTVController.swift
//  project02
//
//  Created by Abhi Singh on 10/18/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class NewsNewsTVController: UITableViewController, UISearchBarDelegate /*UIViewControllerPreviewingDelegate*/ {

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
        updateNewsNow()

//        // check for 3D haptic availability
//        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
//            // prepare for preview, with delegate
//            registerForPreviewing(with: self, sourceView: self.tableView)
//        } else {
//            print("Isn't Compatible")
//        }

    }

    override func viewWillAppear(_ animated: Bool) {
        if ConnectionCheck.isConnectedToNetwork() {
            print("Network is Reachable :)")
        } else {
            print("Network is NOT Reachable :(")
            let alertController = UIAlertController(title: "issue", message: "shit", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // Search Function
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keywords = searchBarOutlet.text else { return /*alert*/ }
        
        if searchBarOutlet.text!.isEmpty || searchBarOutlet.text!.trimmingCharacters(in: .whitespaces).isEmpty {
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid search query!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            //?: how to resign first responder & drop keyboard
        } else {
            searchUrl = (keywords.replacingOccurrences(of: " ", with: "-"))
            self.view.endEditing(true)
            updateNewsNow()
        }
    }
    

    
    
    // previewing Content
    
    
    
    
    
    var searchUrl = "sports"
    var someNewNews: NewsNews?
  
    func updateNewsNow(){
        let basePathUrl = "http://beta.newsapi.org/v2/everything?sources=bleacher-report&q="
        let apiKeyUrl = "&sortBy=latest&apiKey=129fc856f7454aeca1b6726575bf23c6"
        let requestUrl = URL(string: basePathUrl+searchUrl+apiKeyUrl)
        print(requestUrl)

        /*
        guard requestUrl != nil else {
            requestUrl = URL(string: "https://beta.newsapi.org/v2/top-headlines?sources=bleacher-report&apiKey=129fc856f7454aeca1b6726575bf23c6")
            print(requestUrl)
            return
        }
       */

        
        
        let request = URLRequest(url: requestUrl!)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard error == nil else {
                print("Networking Error: \(String(describing: error))")
                return
            }
            guard let data = data else {
                print("Networking Error: Did Not Receive Data")
                return
            }
            
            do {
                self.someNewNews = try?
                    JSONDecoder().decode(NewsNews.self, from: data)
              print(self.someNewNews)
                
                if self.someNewNews!.articles!.isEmpty{
                    print("this shit is empty")
                    let alertController = UIAlertController(title: "Sorry", message: "No results found.", preferredStyle: .actionSheet)
                    alertController.addAction(UIAlertAction(title:"Return to Home", style: .default, handler: self.updateReturnToHome))
                    alertController.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
            catch {
                print("Error in serializing JSON")
            }
        }
        task.resume()
    }
    
    func updateReturnToHome(alert: UIAlertAction){
        searchBarOutlet.text = "sports"
        updateNewsNow()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (someNewNews?.articles!.count) ?? 0
        
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsNewsCellIdentifier", for: indexPath) as! NewsNewsTVCell
        // SHARE: let row = indexPath.row (also make iboutlet to NewNewsTVCell)
       // cell.shareButton.addTarget(self, action: #selector(btnPress), for: .touchUpInside)
        //cell.shareButton.tag = row

        
        
        //lazy loading
        if let validUrlToImage = someNewNews!.articles![indexPath.row].urlToImage { //checks for valid image url
            cell.newsNewsImage.downloadImageFrom(link: validUrlToImage) // down(lazy)loads image url
        } else {
            cell.newsNewsImage.image = #imageLiteral(resourceName: "noImage") // gives default "image not available" otherwise
        }
            let title = someNewNews?.articles![indexPath.row].title
            cell.newsNewsLabel.text = title
        return cell
    }
 
//    @objc func btnPress(sender: UIButton!) {
//        let activityVC = UIActivityViewController(activityItems: [self.espnNews!.articles![sender.tag].url, self.espnNews!.articles![sender.tag].urlToImage, self.espnNews!.articles![sender.tag].title], applicationActivities: nil)
//        activityVC.popoverPresentationController?.sourceView = self.view
//        self.present(activityVC, animated: true, completion: nil)
//    }
//
    
    //MARK: Passing Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the row from the cell click in the table
        let cellThatWasClicked = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cellThatWasClicked)!
        // Get the relevant data from espnNews
        // let passingPicture = espnNews!.articles![indexPath.row].urlToImage
        // let passingDescription = espnNews!.articles![indexPath.row].description
        
        let passingData = someNewNews!.articles![indexPath.row].url
        let passingTitle = someNewNews!.articles![indexPath.row].title
        
        // Create reference and pass it to appropriate ViewController's empty string var
        let detailViewController = segue.destination as! NewsWebDetailViewController
        //  detailViewController.receivingPicture = passingPicture
        //    detailViewController.receivingDescription = passingDescription
        detailViewController.receivingData = passingData
        detailViewController.receivingTitle = passingTitle
        
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
