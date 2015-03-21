import Foundation
import CoreData
import UIKit

class LessonsDetailsViewController: UIViewController {
    @IBOutlet weak var lessonPhrase: UILabel!
    var managedObject: NSManagedObject!
    
    override func viewWillAppear(animated: Bool) {
        println(managedObject)
        lessonPhrase.text = managedObject.valueForKey("phrase") as String!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}