// JSQMessagesVC: "souped-up" UICollectionViewController customized for chat
// Tutorial Focus: 1) creating message data, 2) creating coloring message bubbles, 3) removing avatar support, 4) changing the text color of a UICollectionViewCell

import UIKit
import Firebase
import JSQMessagesViewController

final class ChatViewController: JSQMessagesViewController {
  
  // MARK: Properties
    var channelRef: DatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
        }
    }
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  // MARK: Collection view data source (and related) methods
  
  
  // MARK: Firebase related methods
  
  
  // MARK: UI and User Interaction

  
  // MARK: UITextViewDelegate methods
  
}
