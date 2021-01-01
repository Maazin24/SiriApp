//
//  ViewController.swift
//  SiriSpeak
//
//  Created by Maazin Ahmad on 11/7/20.
//  Copyright © 2020 Maazin Ahmad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var USSpeech: UITextField!
  @IBOutlet weak var UKSpeech: UITextField!
  @IBOutlet weak var INDSpeech: UITextField!
  @IBOutlet weak var AUSSpeech: UITextField!
  
  @IBOutlet weak var ScrollView: UIScrollView!
  
  func HideKeyboard() {
    let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
    
    view.addGestureRecognizer(Tap)
  }
  
  @objc func DismissKeyboard() {
    
    view.endEditing(true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

  let toolBar = UIToolbar()
    toolBar.sizeToFit()
    
  let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
  
  let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))

  toolBar.setItems([flexibleSpace, doneButton], animated: false)
  
  USSpeech.inputAccessoryView = toolBar
  UKSpeech.inputAccessoryView = toolBar
  INDSpeech.inputAccessoryView = toolBar
  AUSSpeech.inputAccessoryView = toolBar
    

}
  
  @objc func doneClicked() {
    view.endEditing(true)
  }
  
  @IBAction func US(_ sender: UIButton) {

     let speechSynthesizer = AVSpeechSynthesizer()
     let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: USSpeech.text!)
     speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
     speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
     speechSynthesizer.speak(speechUtterance)
  }
  
  @IBAction func UK(_ sender: UIButton) {
    
     let speechSynthesizer = AVSpeechSynthesizer()
     let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: UKSpeech.text!)
     speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
     speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-UK")
     speechSynthesizer.speak(speechUtterance)
  }
  
  @IBAction func IND(_ sender: UIButton) {
    
     let speechSynthesizer = AVSpeechSynthesizer()
     let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: INDSpeech.text!)
     speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
     speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-IN")
     speechSynthesizer.speak(speechUtterance)
  }
  
  @IBAction func AUS(_ sender: UIButton) {
    
     let speechSynthesizer = AVSpeechSynthesizer()
     let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: AUSSpeech.text!)
     speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
     speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-AU")
     speechSynthesizer.speak(speechUtterance)
  }
}

/*
 
 
 NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
 
 NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisAppear), name: UIResponder.keyboardWillHideNotification, object: nil)
 
 var isExpand : Bool = false
   @objc func keyboardAppear() {
     if !isExpand {
       self.ScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.ScrollView.frame.height + 250)
       isExpand = true
     }
   }
   
   @objc func keyboardDisAppear() {
     self.ScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.ScrollView.frame.height + 250)
     self.isExpand = false
   }
 


  
 self.HideKeyboard()
 
 func Keyboard(notification: Notification) {
   
   let userInfo = notification.userInfo!
   
   let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
   let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
   
   if notification.name == Notification.Name.UIResponder.keyboardWillHideNotification {
     ScrollView.contentInset = UIEdgeInsets.zero
   } else {
     ScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
   }
   
   ScrollView.scrollIndicatorInsets = ScrollView.contentInset
 }
 
 
 NotificationCenter.default.addObserver(self, selector: #selector(Keyboard), name: Notification.Name.UIResponder.keyboardWillHideNotification, object: nil)
 
 NotificationCenter.default.addObserver(self, selector: #selector(Keyboard), name: Notification.Name.UIKeyboardWillChange, object: nil)
 
 
 */
