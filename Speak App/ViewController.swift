//
//  ViewController.swift
//  Speak App
//
//  Created by Deep Mahajan.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var TableView: UITableView!
    
    //MARK:- properties
    var arrName = [["name":"Arkansas","status":"0"],["name":"California","status":"0"],["name":"Colorado","status":"0"],["name":"Delaware","status":"0"],["name":"Florida","status":"0"],["name":"Kansas","status":"0"],["name":"Massachusetts","status":"0"],["name":"Missouri","status":"0"]]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    
}

//MARK:- Supporting Fucntions and Methods
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let dictName = arrName[indexPath.row]
        let status = dictName["status"]
        cell.lblWord.text = dictName["name"]
        if status == "0"{
            cell.imgViewCheckUnCheck.image = UIImage(named: "UncheckSpeaker")
        }else{
            cell.imgViewCheckUnCheck.image = UIImage(named: "CheckSpeaker")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var dictName = arrName[indexPath.row]
        var status = dictName["status"]
        let name = dictName["name"]!
        SpeakText(strWord: name)
        if status == "0"{
            status = "1"
        }else{
            status = "0"
        }
        dictName["status"] = status
        arrName[indexPath.row] = dictName
        self.TableView.reloadData()
    }
    func SpeakText(strWord:String){
        let string = strWord
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }
}

