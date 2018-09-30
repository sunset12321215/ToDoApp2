

import UIKit

var PassData = ""

class Custom_Cell: UITableViewCell {

    @IBOutlet weak var lbl_Text: UILabel!
    

    @IBOutlet weak var btn_Tick: UIButton!
    
    @IBAction func btn_Tick(_ sender: UIButton)
    {
        if sender.isSelected == false
        {
            sender.isSelected = true;       PassData = "tick_done"
        }
        else
        {
            sender.isSelected = false;       PassData = "tick_notdone"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btn_Tick.setImage(#imageLiteral(resourceName: "tick_notdone"), for: .normal)
        btn_Tick.setImage(#imageLiteral(resourceName: "tick_done"), for: .selected)
        
       
    }
}
