//
//  ViewController.swift
//  ClockApp
//
//  Created by Alvin Johansson on 2024-03-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    @IBOutlet weak var buttonPlayerOne: UIButton!
    @IBOutlet weak var buttonPlayerTwo: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    let formatter = DateFormatter()
    var timer: Timer?
    var timer2: Timer?
   
    
    var remainingTime: Int = 10
    var remainingTime2: Int = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.timeStyle = .medium
        buttonPlayerOne.isHidden = true
        buttonPlayerTwo.isHidden = true
        timeLabel.text = String(remainingTime)
        timeLabel2.text = String(remainingTime2)
        resetButton.isHidden = true

    }
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateTimeLabel(timer:))
        startButton.isHidden = true
        buttonPlayerOne.isHidden = false
        resetButton.isHidden = false
        
      
    }
    @IBAction func resetButton(_ sender: UIButton) {
        timer?.invalidate()
        timer2?.invalidate()
       remainingTime = 180
       remainingTime2 = 180
        startButton.isHidden = false
        buttonPlayerOne.isHidden = true
        buttonPlayerTwo.isHidden = true
        resetButton.isHidden = true
        timeLabel.text = String(remainingTime)
        timeLabel2.text = String(remainingTime2)
    }
    @IBAction func buttonPlayerTwo(_ sender: UIButton) {
        
        timer2?.invalidate()
        //timer2 = nil
        updateTimeLabel()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateTimeLabel(timer:))
        buttonPlayerOne.isHidden = false
        buttonPlayerTwo.isHidden = true
        if remainingTime == 0 || remainingTime2 == 0 {
            
        }
       
    }
    
    
    @IBAction func buttonPlayerOne(_ sender: UIButton) {
        timer?.invalidate()
        //timer = nil
        updateTimeLabel2()
        timer2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: updateTimeLabel2(timer2:))
        buttonPlayerTwo.isHidden = false
        buttonPlayerOne.isHidden = true
  
    }
    

    func updateTimeLabel(timer : Timer? = nil) {

        remainingTime -= 1
        timeLabel.text = String(remainingTime)
        checkConditions()
        
    }
    func updateTimeLabel2(timer2 : Timer? = nil) {
        remainingTime2 -= 1
        timeLabel2.text = String(remainingTime2)
        checkConditions()
    }
    
    func checkConditions() {
        if remainingTime == 0 || remainingTime2 == 0 {
            timer?.invalidate()
            timer2?.invalidate()
           remainingTime = 180
           remainingTime2 = 180
            startButton.isHidden = false
            buttonPlayerOne.isHidden = true
            buttonPlayerTwo.isHidden = true
            timeLabel.text = String(remainingTime)
            timeLabel2.text = String(remainingTime2)
        }
    }
     

    deinit {
        //timer?.invalidate()
        //timer2?.invalidate()
    }


}

