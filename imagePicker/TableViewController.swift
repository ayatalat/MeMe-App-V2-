
import UIKit

class TableViewController: UITableViewController {
    
    var memes : [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func addnewmeme(_ sender: Any) {
        let controller: ImagePickerController
        controller = storyboard?.instantiateViewController(withIdentifier: "ImagePickerController") as! ImagePickerController
        present(controller, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemedImage")!
        let meme = memes[(indexPath as NSIndexPath).row]
                cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = memes[indexPath.row].topText + " " + memes[indexPath.row].bottomText
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier:
            "ShowMemeDetailsController") as!  ShowMemeDetailsController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
