import UIKit

class LessonCell: UITableViewCell {
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var pTranslationLabel: UILabel!
    
    func configureForLesson(lesson: LessonET) {
        if lesson.phrase.isEmpty {
            phraseLabel.text = "(No Lesson Title)"
        } else {
            phraseLabel.text = lesson.phrase
        }
        
        // translation display needs to be done
    }
}