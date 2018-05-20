//
//  PositiveViewController.swift
//  2017_contest_app
//
//  Created by 杉山航 on 2017/08/05.
//  Copyright © 2017年 杉山航. All rights reserved.
//

import UIKit

class PositiveViewController: UIViewController {

    //問題の画像を格納する配列
    var imageArray: [String] = ["チェックテスト１.jpg","チェックテスト２.jpg","チェックテスト３.jpg"]
    //問題の画像を表示するためのパーツ
    @IBOutlet var quizimage: UIImageView!
    //問題文を表示するラベル
    @IBOutlet var quizlabel: UILabel!
    //クイズの問題数
    var quizcount: Int = 0
    //チェックテストの点数を計る変数
    var quiz_point: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        quizimage.image = UIImage(named:imageArray[0])
        quizlabel.text = "いつもどんな感じですか？"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func choice1() {
        switch quizcount {
        case 0:
            quiz_point = quiz_point + 2
            quizlabel.text = "思いついてから何分で行動しますか？"
            
        case 1:
            quiz_point += 3
            quizlabel.text = "最後に、このチェックテストで変わりましたか？"
        case 2:
            quiz_point += 2
        default:
            break
        }
        quizcount = quizcount + 1
        print("点数\(quiz_point)")
        if quizcount >= 3 {
            let alert:UIAlertController = UIAlertController(title: "チェックテストは終了ですあなたの点数は"+String(quiz_point)+"点です", message: "OKを押すと前画面に戻ります", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.navigationController?.popViewController(animated: true)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        else if quizcount <= 3 {
            quizimage.image = UIImage(named:imageArray[quizcount])
        }
    }
    @IBAction func choice2() {
        switch quizcount {
        case 0:
            quiz_point = quiz_point + 2
            quizlabel.text = "思いついてから何分で行動しますか？"
        case 1:
            quiz_point += 4
            quizlabel.text = "チェックテストはどうでした？"
        case 2:
            quiz_point += 2
        default:
            break
        }
        quizcount = quizcount + 1
        print("点数\(quiz_point)")
        if quizcount >= 3 {
            let alert:UIAlertController = UIAlertController(title: "チェックテストは終了ですあなたの点数は"+String(quiz_point)+"点です", message: "OKを押すと前画面に戻ります", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.navigationController?.popViewController(animated: true)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        else if quizcount <= 3 {
            quizimage.image = UIImage(named:imageArray[quizcount])
        }
    }
    @IBAction func choice3() {
        switch quizcount {
        case 0:
            quiz_point = quiz_point + 4
            quizlabel.text = "思いついてから何分で行動しますか？"
        case 1:
            quiz_point += 2
            quizlabel.text = "最後に、このチェックテストで変わりましたか？"
        case 2:
            quiz_point += 2
        default:
            break
        }
        quizcount = quizcount + 1
        print("点数\(quiz_point)")
        if quizcount >= 3 {
            let alert:UIAlertController = UIAlertController(title: "チェックテストは終了ですあなたの点数は"+String(quiz_point)+"点です", message: "OKを押すと前画面に戻ります", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.navigationController?.popViewController(animated: true)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        else if quizcount <= 3 {
            quizimage.image = UIImage(named:imageArray[quizcount])
        }
        
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
