/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class GroceryListTableViewController: UITableViewController {

  // MARK: Constants
  let listToUsers = "ListToUsers"
  
  // MARK: Properties 
  var items: [GroceryItem] = []
  var user: User!
  var userCountBarButtonItem: UIBarButtonItem!
  
  // creates an instance of FIRDatabaseReference, in order to read/write from database
  let ref = Database.database().reference(withPath: "grocery-items")

  // MARK: UIViewController Lifecycle
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // ref = "/grocery-items"; sort by the "completed" values of the child key - individual items
    // code listens for DataEventType.value, which in turn listens for all types of changes to data in FBDB - add, removed, & changed
    // when change occurs, DB updates app w/ most recent data
    ref.queryOrdered(byChild: "completed").observe(.value, with: { snapshot in
      // app is notified of this change via the closure
      // store latest version of the data in a local var inside listener's closure
      var newItems: [GroceryItem] = []
      // returns snapshot of latest set of data; it contains entire list of grocery items, not just updates
      // using children, iterate thru grocery items
      for item in snapshot.children {
        //D
        let groceryItem = GroceryItem(snapshot: item as! DataSnapshot)
        newItems.append(groceryItem)
      
      }
      
      
      self.items = newItems
      self.tableView.reloadData()
    })
    // 1: Attach a listener to receive updates whenever the grocery-items endpoint is modified.
//    ref.observe(.value, with: { snapshot in
//      // 2: Store the latest version of the data in a local variable inside the listener’s closure.
//      var newItems: [GroceryItem] = []
//
//      // 3: The listener’s closure returns a snapshot of the latest set of data. The snapshot contains the entire list of grocery items, not just the updates. Using children, you loop through the grocery items.
//      for item in snapshot.children {
//        // 4: The GroceryItem struct has an initializer that populates its properties using a FIRDataSnapshot. A snapshot’s value is of type AnyObject, and can be a dictionary, array, number, or string. After creating an instance of GroceryItem, it’s added it to the array that contains the latest version of the data.
//        let groceryItem = GroceryItem(snapshot: item as! DataSnapshot)
//        newItems.append(groceryItem)
//      }
//      // 5: Reassign items to the latest version of the data, then reload the table view so it displays the latest version.
//      self.items = newItems
//      self.tableView.reloadData()
//    })
    
    tableView.allowsMultipleSelectionDuringEditing = false
    
    userCountBarButtonItem = UIBarButtonItem(title: "1",
                                             style: .plain,
                                             target: self,
                                             action: #selector(userCountButtonDidTouch))
    userCountBarButtonItem.tintColor = UIColor.white
    navigationItem.leftBarButtonItem = userCountBarButtonItem
    
    user = User(uid: "FakeId", email: "hungry@person.food")
    
    Auth.auth().addStateDidChangeListener { (auth, user) in
      guard let user = user else { return }
      self.user = User(uid: user.uid, email: user.email!)
    }
    
//  Auth.auth().addStateDidChangeListener { (auth, user) in
//    if Auth.auth().currentUser != nil {
//      // User is signed in.
//      // ...
//    } else {
//      // No user is signed in.
//      // ...
//    }
//    }
    
//
//    Auth.auth().addStateDidChangeListener { auth, user in
//      guard let user = user else { return }
//      self.user = User(authData: user)
//    }
    
  }
  
  // MARK: UITableView Delegate methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
    let groceryItem = items[indexPath.row]
    
    cell.textLabel?.text = groceryItem.name
    cell.detailTextLabel?.text = groceryItem.addedByUser
    
    toggleCellCheckbox(cell, isCompleted: groceryItem.completed)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  // removing items from the table view
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let groceryItem = items[indexPath.row]
      groceryItem.ref?.removeValue()
    }
  }
  
  
  // checking off items
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 1: Find the cell the user tapped using cellForRow(at:).
    guard let cell = tableView.cellForRow(at: indexPath) else { return }
    // 2: Get the corresponding GroceryItem by using the index path’s row.
    let groceryItem = items[indexPath.row]
    // 3: Negate completed on the grocery item to toggle the status.
    let toggledCompletion = !groceryItem.completed
    // 4: Call toggleCellCheckbox(_:isCompleted:) to update the visual properties of the cell.
    toggleCellCheckbox(cell, isCompleted: toggledCompletion)
    // 5: Use updateChildValues(_:), passing a dictionary, to update Firebase. This method is different than setValue(_:) because it only applies updates, whereas setValue(_:) is destructive and replaces the entire value at that reference.
    groceryItem.ref?.updateChildValues([
      "completed": toggledCompletion
      ])
  }
  
  // toggle checkbox if action completed or not
  func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
    if !isCompleted {
      cell.accessoryType = .none
      cell.textLabel?.textColor = UIColor.black
      cell.detailTextLabel?.textColor = UIColor.black
    } else {
      cell.accessoryType = .checkmark
      cell.textLabel?.textColor = UIColor.gray
      cell.detailTextLabel?.textColor = UIColor.gray
    }
  }

  
  // MARK: Add Item
  @IBAction func addButtonDidTouch(_ sender: AnyObject) {
    let alert = UIAlertController(title: "Grocery Item",
                                  message: "Add an Item",
                                  preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
    // 1: Get text field (& its text) from the alert controller
    guard let textField = alert.textFields?.first,
    let text = textField.text else { return }
    // 2: Using current user’s data, create new GroceryItem that is not completed by default (false)
    let groceryItem = GroceryItem(name: text, addedByUser: self.user.email, completed: false)
    // 3: We want to save to database & create a ref to a grocery item. Create a child ref. k/v of this ref is item's name (in lowercase so when users add duplicate items, DB saves only latest entry - even if capitalized)
      // groceryItemRef is a child of ref
      // passes in textField.text
    let groceryItemRef = self.ref.child(text.lowercased())
    // 4: Use setValue to save data to the database. This method expects a Dictionary. GroceryItem has a helper function called toAnyObject() to turn it into a Dictionary.
    groceryItemRef.setValue(groceryItem.toAnyObject())
    }

    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .default)
    // adds editable text field, save/cancel actions to the alert
    alert.addTextField()
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    // modally presents UIAlertController (alert)
    present(alert, animated: true, completion: nil)
  }
  
  // segues to VC with all users
  func userCountButtonDidTouch() {
    performSegue(withIdentifier: listToUsers, sender: nil)
  }
  
}
