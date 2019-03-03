
import UIKit

class ShowMemeDetailsController: UIViewController {

    @IBOutlet weak var MemeImageView: UIImageView!
         var meme: Meme!
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.MemeImageView!.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }


}
