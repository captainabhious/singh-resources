//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var dogBreeds :[String] = [] //= ["Loading..."]
var dogBreed :String = ""



func updateDogBreeds() {
    
    // Setup the URL Request...
    let requestUrl = URL(string:"https://dog.ceo/api/breeds/list/all")
    let request = URLRequest(url:requestUrl!)
    //URL REQUEST - encapsulates info about the communication from the app to the server's api. (Most importantly it specifies the URL for the request)
    
    // Setup the URL Session...(API)
    // a collection of classes that use a request to communicate with the server in a number of ways
    // URLSESSION is responsible for creating tasks that match a given configuration
    let task = URLSession.shared.dataTask(with: request) {
        //URLSessionDataTask is 1 out of 3 kinds of tasks, and it retrieves data (JSON) from the server and returns it as Data from a memory
        // usually called "task" like background task
        // shared = singleton - one and only task object
        (data, response, error) in // URLSession brings this back
        // data = datapackage (list of all dog breeds); response = response w/ status code
        // CH signature: completionHandler: (Data?, URLResponse?, Error?) -> Void
        // CH convenient when app is doing something that might take some time, like making an API call, and you need to do something when that task is done, like updating the UI to show the data
        // URLSessionDataTask 1) makes URL request 2) waits for results 3) checks for errors and stuff
        // CH sits around waiting to be called when dataTask is done
        
        
        // Check response 200.....
//        print
//        if let http
//        if let response
        
        
        // Error Handling
        if error == nil,let usableData = data {
            //usableData = JSONData b/c the Data? is optional
            
            print("JSON Received...File Size: \(usableData) \n")
            //ready for JSONSerialization
            
            do {
                // Serialize....
                let bObject = try JSONSerialization.jsonObject(with: usableData, options: .allowFragments) // instantiate NSObj JSONSerialization
                // JSONSerialization converts JSON to Foundation objs & vice versa
                // .jsonObject returns Foundation object from json data
                
                if let dictionary = bObject as? [String: AnyObject] {
                    // 'as?' type casting from type Any -> [String: AnyObject] - dictionary [k : v]
                    if let dogs = dictionary["message"] as? [String: AnyObject] {
                        // looking up the key value "message" in the dictionary
                        // type cast key "message" -> dict b/c its value is multiple dictionaries (120 dog breeds:[])
                        
                        
                        //                        var dogBreeds :[String] = ["Loading..."]
                        //                        var dogBreed :String = ""
                        
                        for dog in dogs { //for every dog in all dogs
                            dogBreed = dog.key
                            //print(dogBreed)
                            dogBreeds.append(dogBreed)
                            //print(dogBreeds)
                        }
                    }
                }
                // for loop iteration of dogBreeds, which is an array of Strings containing dogBreed, to print out all breeds
                for i in dogBreeds {
                    print("\(i)")
                }
                
                // Else handle JSON Serialization error
            } catch {
                print("Error deserializing JSON")
            }
            
            
            
            // Else take care of Networking error
        } else {
            // Handle Error and Alert User
            print("Networking Error: \(String(describing: error) )")
            
        }
        
    }
    
    // Execute the URL Task
    // in suspended state so need task.resume()
    task.resume()
    
}
