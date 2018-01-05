//
//  Apolitica Class.swift
//  Singleton
//
//  Created by Abhi Singh on 10/6/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation
import UIKit

// thing our VC will have to conform to, in order to get udpates
protocol ApoliticaDelegate {
    func checkAffiliation() -> PoliticalAffiliation
    func didGetNews(newsHeadline: String)
}


// Singleton
class Apolitica { // delegator
    static let sharedInstance = Apolitica()
    private init(){
    }
    var delegate: ApoliticaDelegate?
    
    func updateNews() {
        // Connect to our news server
        let news = (headline: "This is a Headline", affiliation: PoliticalAffiliation.anarchist) // tuple (holds diff types)
        
        // Download a list of new news articles
        // Check the affiliation of our delegate
        let delegateAffiliation = delegate?.checkAffiliation()
        // Inform the delegate of new news, if they are of the correct affiliation
        if news.affiliation == delegateAffiliation {
            delegate?.didGetNews(newsHeadline: news.headline)
        }
    }
}

enum PoliticalAffiliation: String {
    case republican, democrat, socialist, progressive, anarchist, technocrat, other
}

class ApoliticaViewController: UIViewController, ApoliticaDelegate {
    var myAffilation = PoliticalAffiliation.anarchist
    
    override func viewDidLoad() { // get
        Apolitica.sharedInstance.delegate = self
    }

    func checkAffiliation() -> PoliticalAffiliation {
        return myAffilation
    }
    
    func didGetNews(newsHeadline: String) {
        // Update our news label with the new news
        print(newsHeadline)
    }
    
    
}

// This would be handled by the OS when it launched our app
let myMainViewController = ApoloticaViewController()
Apolitica.sharedInstance.updateNews() 




