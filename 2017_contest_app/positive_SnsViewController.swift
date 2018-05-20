//
//  positive_SnsViewController.swift
//  2017_contest_app
//
//  Created by 杉山航 on 2017/08/15.
//  Copyright © 2017年 杉山航. All rights reserved.
//

import UIKit
import Firebase

class positive_SnsViewController: UIViewController {

    @IBOutlet weak var Post_Field: UITextField!
    @IBOutlet var Everyone_Post1: UILabel!
    @IBOutlet var Everyone_Post2: UILabel!
    @IBOutlet var Everyone_Post3: UILabel!
    @IBOutlet var Everyone_Post4: UILabel!
    @IBOutlet var Everyone_Post5: UILabel!
    @IBOutlet var Everyone_Post6: UILabel!
    @IBOutlet var Everyone_Post7: UILabel!
    @IBOutlet var Everyone_Post8: UILabel!
    
    var PostArray:[String] = ["","","","","","","",""]
    var dataArray:[Any] = []
    var dataCount = 0
    var snap: DataSnapshot!
    var contentArray: [DataSnapshot] = []
    
    private let ref = Database.database().reference().child("idList2")
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        guard let searchID:String = "ID/" else { return }
        if searchID == "" { return }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.read()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(Post_Field.isFirstResponder){
            Post_Field.resignFirstResponder()
        }
    }
    @IBAction private func selectTransmit() {
        guard let id: String = String(self.dataArray.count) , let text: String = Post_Field.text else {return}
        if text == "" { return }
        for i in 0...PostArray.count - 2 {
            PostArray[i] = PostArray[i + 1]
        }
        
        Everyone_Post1.text = PostArray[PostArray.count - 1]
        Everyone_Post2.text = PostArray[PostArray.count - 2]
        Everyone_Post3.text = PostArray[PostArray.count - 3]
        Everyone_Post4.text = PostArray[PostArray.count - 4]
        Everyone_Post5.text = PostArray[PostArray.count - 5]
        Everyone_Post6.text = PostArray[PostArray.count - 6]
        Everyone_Post7.text = PostArray[PostArray.count - 7]
        Everyone_Post8.text = PostArray[PostArray.count - 8]
        
        
        
        ref.child("ID/"+String(id)).childByAutoId().setValue(["text": text])
        //ref.setValue(["ID": [["text": text]]])
        
        for i in 0..<PostArray.count {
            print("for of postarrayi\(PostArray[i])")
        }
        
    }
    
    
    func read() {
        ref.child("ID").child("0").observe(.value, with: {(snapShots) in
            if snapShots.children.allObjects is [DataSnapshot] {
                print("snapShots.children...\(snapShots.childrenCount)")
                
                print("snapShot...\(snapShots)")
                
                self.snap = snapShots
            }
            self.reload(snap: self.snap)
        })
    }
    func reload(snap: DataSnapshot) {
        if snap.exists() {
            print("ただのsnap\(snap)")
            contentArray.removeAll()
            for item in snap.children {
                contentArray.append(item as! DataSnapshot)
            }
            ref.child("ID").child("0").keepSynced(true)
        }
        var format:[Dictionary<String,String>] = []
        for item in contentArray{
            let content = item.value as! Dictionary<String,String>
            format.append(content)
        }
        PostArray = format.map{$0["text"]!}
        print("ただのpostarray\(PostArray)")
        
        Everyone_Post1.text = PostArray[PostArray.count - 1]
        Everyone_Post2.text = PostArray[PostArray.count - 2]
        Everyone_Post3.text = PostArray[PostArray.count - 3]
        Everyone_Post4.text = PostArray[PostArray.count - 4]
        Everyone_Post5.text = PostArray[PostArray.count - 5]
        Everyone_Post6.text = PostArray[PostArray.count - 6]
        Everyone_Post7.text = PostArray[PostArray.count - 7]
        Everyone_Post8.text = PostArray[PostArray.count - 8]
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
