//
//  NewsNewsTVController.swift
//  project02
//
//  Created by Abhi Singh on 10/18/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class NewsNewsTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNewsNow()
    }

   
    var someNewNews: NewsNews?
    
    var sourcesUrl = "bleacher-report"
    
    func updateNewsNow(){

      
//let basePathUrl = "http://beta.newsapi.org/v2/top-headlines?sources="
        
       // let apiKeyUrl = "&apiKey=129fc856f7454aeca1b6726575bf23c6"
        
        let myUrl = "http://beta.newsapi.org/v2/everything?sources=bleacher-report&q=nba&sortBy=latest&apiKey=129fc856f7454aeca1b6726575bf23c6"
        
        let requestUrl = URL(string: myUrl/*basePathUrl+sourcesUrl+apiKeyUrl*/)
 
   //    print(requestUrl)
      
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
                print("YOoOoooooooooooooooooooof  Networking Error: \(String(describing: error))")
                return
            }
            guard let data = data else {
                print("Networking Error: Did Not Receive Data")
                return
            }
            
            
            
            do {
                print(data)
                self.someNewNews = try?
                    JSONDecoder().decode(NewsNews.self, from: data)
                print(self.someNewNews)
                
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
        
        //pic
        let url = URL(string: (someNewNews?.articles![indexPath.row].urlToImage)!)
        let data = try? Data(contentsOf: url!)
        cell.newsNewsImage.image = UIImage(data: data!)
        
        //title
      //  let title = someNewNews?.articles?[indexPath.row].
        let title = someNewNews?.articles![indexPath.row].title
        cell.newsNewsLabel.text = title


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
