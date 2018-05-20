//
//  QuizViewController.swift
//  2017_contest_app
//
//  Created by 杉山航 on 2017/08/05.
//  Copyright © 2017年 杉山航. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題の画像を格納する配列
    var imageArray: [String] = ["問題１.jpg","問題２.jpg","問題3.jpg"]
    //正解不正解の配列
    var answer_checkArray: [String] = ["正解.png","不正解.png"]
    //問題の画像を表示するためのパーツ
    @IBOutlet var quizimage: UIImageView!
    //問題文を表示するラベル
    @IBOutlet var quizlabel: UILabel!
    //クイズの問題数
    var quizcount: Int = 0
    //回答した時にばつかまるを表示するimageview
    @IBOutlet var answer_check: UIImageView!
    //ばつかまるの表示時間を計るタイマー
    var count: Float = 0.0
    //
    var timer: Timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        quizimage.image = UIImage(named:imageArray[quizcount])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func choice1() {
        //正解
        switch quizcount {
        case 0:
            quizlabel.text = "精神障がい者はどれ？"
            answer_check.image = UIImage(named:answer_checkArray[0])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
            }
            quizcount = quizcount + 1
        case 1:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        case 2:
            //正解
            answer_check.image = UIImage(named:answer_checkArray[0])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
            }
            quizcount = quizcount + 1
        default:
            break
            
        } //
        if quizcount >= 2 {
            let alert:UIAlertController = UIAlertController(title: "チェックテストは終了です", message: "OKを押すと前画面に戻ります", preferredStyle: .alert)
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
        else if quizcount <= 2 {
            quizimage.image = UIImage(named:imageArray[quizcount])
        }
    }
    @IBAction func choice2() {
        switch quizcount {
        case 0:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        case 1:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        case 2:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        default: break
            
        }
        print(quizcount)
        quizimage.image = UIImage(named:imageArray[quizcount])
    }
    @IBAction func choice3() {
        switch quizcount {
        case 0:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        case 1:
            quizlabel.text = "生涯で精神疾患になる確率は？"
            answer_check.image = UIImage(named:answer_checkArray[0])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
            }
            quizcount = quizcount + 1
        case 2:
            //不正解
            answer_check.image = UIImage(named:answer_checkArray[1])
            answer_check.isHidden = false
            if !timer.isValid {
                //タイマーが動作していなかったら動かす
                timer = Timer.scheduledTimer(
                    timeInterval: 0.5,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: false
                )
                
            }
        default: break
        }
        
        quizimage.image = UIImage(named:imageArray[quizcount])
        print(quizcount)
        
    }
    
    func up() {
        //countを0.01（時間経過分）足す
        count = count + 0.5
        print("up...\(count)")
        if count >= 0.5 {
            if timer.isValid {
                //タイマーが動作していたら停止する
                timer.invalidate()
                count = 0.0
                print(count)
            }
            print(count)
            answer_check.isHidden = true
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
