//
//  EspnTVController.swift
//  project02
//
//  Created by Abhi Singh on 10/15/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit




class EspnTVController: UITableViewController, UIViewControllerPreviewingDelegate {
    
    // shows preview
//    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        let previewView = storyboard?.instantiateViewController(withIdentifier: "preview")
//        return previewView
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEspnNow()
        // check for 3D haptic availability
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            // prepare for preview, with delegate
            registerForPreviewing(with: self, sourceView: self.tableView)
        } else {
            print("Isn't Compatible")
        }
    }
    
    // peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        let thing = espnNews
        guard let indexPath = tableView.indexPathForRow(at: location), let cell = tableView.cellForRow(at: indexPath) as? EspnTVCell
            else {
                return nil
                
            }

        guard let thisView = storyboard?.instantiateViewController(withIdentifier: "preview") as? EspnWDPreViewController else {
        return nil
        }
        
        thisView.receivingDescription = espnNews?.articles![indexPath.row].description
        thisView.receivingPicture = espnNews?.articles![indexPath.row].urlToImage
        
        
//        thisView.espnNews?.articles![indexPath.row].description = cell.espnTitle.text!
//        previewingContext.sourceRect = cell.frame
       // thisView.
        
       // thisView.espnNews?.articles![indexPath.row].url = cell.espnImage
        
        return thisView
    }
    
    // pop: enable user to go from preview2 to WebDetailVC/finalView
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalView = storyboard?.instantiateViewController(withIdentifier: "webdetail")
   //     let finalView = storyboard?.instantiateViewController(withIdentifier: EspnWDPreViewController)
        
        
        //setup your final view here
        
        show(finalView!, sender: self)
        
    }
 
    
    
    var espnNews: News?
    
    func updateEspnNow(){
        let requestUrl = URL(string: "https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=129fc856f7454aeca1b6726575bf23c6")
        // http://beta.newsapi.org/v2/top-headlines?sources=espn,bleacher-report&apiKey=129fc856f7454aeca1b6726575bf23c6
        // https://beta.newsapi.org/v2/top-headlines?sources=espn&apiKey=129fc856f7454aeca1b6726575bf23c6"
        
        
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
                self.espnNews = try
                    JSONDecoder().decode(News.self, from: data)

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
    
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return espnNews?.articles?.count ?? 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "espnCellIdentifier", for: indexPath) as! EspnTVCell
        
        // Espn Picture
        let url = URL(string: (espnNews?.articles![indexPath.row].urlToImage)!)
        let data = try? Data(contentsOf: url!)
        cell.espnImage.image = UIImage(data: data!)
       
        // Espn Title
        let title = espnNews?.articles![indexPath.row].title
        cell.espnTitle.text = title
//        cell.espnTitle.text = UILabel
//            UILabel(title: title!)
        
     
     return cell
     }
    
    //MARK: Passing Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       // Get the row from the cell click in the table
        let cellThatWasClicked = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cellThatWasClicked)!
       // Get the relevant data from espnNews
       // let passingPicture = espnNews!.articles![indexPath.row].urlToImage
       // let passingDescription = espnNews!.articles![indexPath.row].description
        
        let passingData = espnNews!.articles![indexPath.row].url
        let passingTitle = espnNews!.articles![indexPath.row].title
        
      // Create reference and pass it to appropriate ViewController's empty string var
        let detailViewController = segue.destination as! WebDetailViewController //EspnWDPreViewController
     //  detailViewController.receivingPicture = passingPicture
    //    detailViewController.receivingDescription = passingDescription
        detailViewController.receivingData = passingData
        detailViewController.receivingTitle = passingTitle

    }



   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the row from the cell click in the table
        let cellThatWasClicked = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cellThatWasClicked)!
        // Get the relevant data from espnNews
        let passingData = espnNews!.articles![indexPath.row].url
        // Create reference and pass it to appropriate ViewController's empty string var
        let detailViewController = segue.destination as! WebDetailViewController
        detailViewController.receivingData = passingData
    }
     */
    
    
    
    

    //MARK: ScrollView Hiding
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
       // navigationController?.barHideOnTapGestureRecognizer
        
        if(velocity.y>0) {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
             //   self.tabBarController?.hidesBottomBarWhenPushed
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: nil)
        }
    }

    
 

}




