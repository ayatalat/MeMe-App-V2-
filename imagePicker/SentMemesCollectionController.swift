

import UIKit

class SentMemesCollectionController: UICollectionViewController {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    var memes : [Meme]!{
           return (UIApplication.shared.delegate as! AppDelegate).memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        editFlowLayout()
    }



    func editFlowLayout () {
        let space:CGFloat = 3.0
        let dimensionForWidth = (view.frame.size.width - (2 * space)) / 3.0
        let dimensionForHeight = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionForWidth, height: dimensionForHeight)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sentMemesCollectionViewCell", for: indexPath) as! sentMemesCollectionViewCell
        let meme = memes[indexPath.row]
        
        cell.memeView?.image = meme.memedImage
        //cell.memeLabel?.text = memes[indexPath.row].topText + "..." + memes[indexPath.row].bottomText
        
        return cell
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView!.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier:
            "ShowMemeDetailsController") as! ShowMemeDetailsController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }

    
    
    @IBAction func addNewMeme(_ sender: Any) {
        let controller: ImagePickerController
        controller = storyboard?.instantiateViewController(withIdentifier: "ImagePickerController") as! ImagePickerController
        present(controller, animated: true, completion: nil)
    }

}
