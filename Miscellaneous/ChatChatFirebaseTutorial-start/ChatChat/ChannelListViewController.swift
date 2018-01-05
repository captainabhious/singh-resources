// Upon log-in, user navigates to this CLVC, whose job it is to show user a list of current channels and give em option to create new channels. Model this as a table view w/ 2 sections. 1st section provides a form where the user can create a new channel, & 2nd section contains list of all known channels. Learn how to 1) save data to FBDB 2) listen for new data being saved to DB

import UIKit
import Firebase

// enum holds the diff TV sections
enum Section: Int {
    case createNewChannelSection = 0
    case currentChannelsSection
}

class ChannelListViewController: UITableViewController {

    // MARK: Properties
    var senderDisplayName: String? // 1: add simple property to store sender's name
    var newChannelTextField: UITextField? // 2: add text field, which will be used later for adding new Channels
    private var channels: [Channel] = [] // 3: create empty array of Channel objs to store channels. this is a simple model class in the starter proj simply w/ name & id
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // calls new observeChannels() method when view loads
        title = "RW RIC"
        observeChannels()
    }
    // stops observing DB changes when the view controller dies by checking if channelRefHandle is set & then calling removeObserver(withHandle:)
    deinit {
        if let refHandle = channelRefHandle {
            channelRef.removeObserver(withHandle: refHandle)
        }
    }
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        // tester code to add some dummy channels to channelsArray
//        channels.append(Channel(id: "1", name: "Channel1"))
//        channels.append(Channel(id: "2", name: "Channel2"))
//        channels.append(Channel(id: "3", name: "Channel3"))
//        self.tableView.reloadData()
//    }
    
    // channelRef: used to store reference to the list of channels in the DB
    private lazy var channelRef: DatabaseReference = Database.database().reference().child("channels")
    // channelRefHandle: will hold a handle to the reference so you can remove it later on
    private var channelRefHandle: DatabaseHandle?
    
    
    // MARK: Firebase related methods - Need to query FBDB & get list of channels to show in table view
    private func observeChannels() {
        // Use the observe method to listen for new channels being written to the Firebase DB
        // 1: you call observe:with: on your channel reference, storing a handle to the reference. this calls the completion block every time a new channel is added to your DB
        channelRefHandle = channelRef.observe(.childAdded, with: { (snapshot) -> Void in
            // 2: completion receives a datasnapshot (stored in snapshot), which contains the data & other helpful methods
            let channelData = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            // 3: pull the data out of the snapshot and, if successful, create a Channel model & add it to your channels array
            if let name = channelData["name"] as! String!, name.characters.count > 0 {
                self.channels.append(Channel(id: id, name: name))
                self.tableView.reloadData()
            } else {
                print("Error! Could not decode channel data")
            }
        })
    }
    
    
    
    // Next, set up UITableView to render new channel from a list of available channels
    // MARK: UITableViewDataSource
    // 1: set the # of sections. 1st section - form for adding new channels, 2nd section - will show list of channels
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 2: set the # of rows for each section. always 1 for first section & then # of channels for 2nd
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currentSection = Section(rawValue: section) {
            switch currentSection {
            case .createNewChannelSection:
                return 1
            case .currentChannelsSection:
                return channels.count
            }
        } else {
            return 0
        }
    }
    
    // 3: define what goes in each cell. 1st section - store text field from cell in your newChannelTextField property. 2nd section - just set cell’s text label as channel name
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = indexPath.section == Section.createNewChannelSection.rawValue ? "NewChannel" : "ExistingChannel"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if indexPath.section == Section.createNewChannelSection.rawValue {
            if let createNewChannelCell = cell as? CreateChannelCell {
                newChannelTextField = createNewChannelCell.newChannelNameField
            }
        } else if indexPath.section == Section.currentChannelsSection.rawValue {
            cell.textLabel?.text = channels[indexPath.row].name
        }
        return cell
    }
    
    // MARK: Actions - creates the channels
    @IBAction func createChannel(_ sender: AnyObject) {
        // 1: check if you have a channel name in the text field
        if let name = newChannelTextField?.text {
            // 2: create a new channel reference with a unique key using childByAutoId()
            let newChannelRef = channelRef.childByAutoId()
            // 3: create a dict to hold data for this channel. a [String: AnyObject] works as a JSON-like object
            let channelItem = [
                "name": name
            ]
            // 4: Finally, set name on this new channel, which is auto-saved to FB
            newChannelRef.setValue(channelItem) // 4
        }
    }
    
    // MARK: UITableViewDelegate
    // code to visit one of your channels upon tap; triggers ShowChannel segue when user taps channel cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Section.currentChannelsSection.rawValue {
            let channel = channels[(indexPath as NSIndexPath).row]
            self.performSegue(withIdentifier: "ShowChannel", sender: channel)
        }
    }
    
    // MARK: Navigation
    // need to set initial values for senderId and senderDisplayName so the app can uniquely identify the messages' sender — even if it doesn’t know specifically who that person is
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let channel = sender as? Channel {
            let chatVc = segue.destination as! ChatViewController
            
            chatVc.senderDisplayName = senderDisplayName
            chatVc.channel = channel
            chatVc.channelRef = channelRef.child(channel.id)
        }
    }
}
