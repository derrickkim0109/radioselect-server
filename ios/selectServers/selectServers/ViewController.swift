//
//  ViewController.swift
//  selectServers
//
//  Created by Derrick kim on 2021/08/16.
//

import UIKit
import DLRadioButton

class ViewController: UIViewController {

    @IBOutlet var myButton : UIButton!
    let customAlert = MyAlert()
    let url = "www.naver.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.backgroundColor = .link
        myButton.setTitleColor(.white, for: .normal)
        myButton.setTitle("Show Alert", for: .normal)
        
    }

    @IBAction func didTabButton(_ sender: UIButton) {
        customAlert.showAlert(with: "서버 선택하기",
                              message: "",
                              on: self)
        
    }
    
    @objc func dismissAlert(){
        customAlert.dismissAlert()
    }
    
    @objc func radioSelect(){
        customAlert.radioSelect(DLRadioButton.init())
    }
    
}

class MyAlert {
    
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.6
        return  backgroundView
    }()
    
    private let alertView : UIView = {
       let alert = UIView()
       alert.backgroundColor = .white
       alert.layer.masksToBounds = true
       alert.layer.cornerRadius = 12
       return alert
    }()
    
    private var mytargetView: UIView?
    
    func showAlert(with title: String,
                          message: String,
                          on viewController: UIViewController) {
        
        guard let targetView = viewController.view else {return}
        
        mytargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        targetView.addSubview(alertView)
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.size.width-80,
                                 height: 300)
        
        let titleLabel = UILabel(frame: CGRect(x: 0,
                                               y: 0,
                                               width: alertView.frame.size.width,
                                               height: 80))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        alertView.addSubview(titleLabel)
        
        let radioBtn1  = DLRadioButton(frame: CGRect(x: 0,
                                               y: 50,
                                               width: alertView.frame.size.width,
                                               height: 100))
        
        
        radioBtn1.setTitle("개발서버", for: .normal)
        radioBtn1.setTitleColor(.link, for: .normal)
        radioBtn1.addTarget(self,
                            action: #selector(radioSelect),
                            for: .touchUpInside)
        
        
        let radioBtn2  = DLRadioButton(frame: CGRect(x: 0,
                                                     y: 100,
                                                     width: alertView.frame.size.width,
                                                     height: 100))
        
        radioBtn2.setTitle("스테이징서버", for: .normal)
        radioBtn2.setTitleColor(.link, for: .normal)
        radioBtn2.addTarget(self,
                            action: #selector(radioSelect),
                            for: .touchUpInside)
        
        let radioBtn3  = DLRadioButton(frame: CGRect(x: 0,
                                                     y: 150,
                                                     width: alertView.frame.size.width,
                                                     height: 100))
        
        radioBtn3.setTitle("실서버", for: .normal)
        radioBtn3.setTitleColor(.link, for: .normal)
        radioBtn3.addTarget(self,
                            action: #selector(radioSelect),
                            for: .touchUpInside)
        
        // 그룹화
        radioBtn1.otherButtons.append(radioBtn2)
        radioBtn1.otherButtons.append(radioBtn3)
        
        alertView.addSubview(radioBtn1)
        alertView.addSubview(radioBtn2)
        alertView.addSubview(radioBtn3)
        
        
        let selectButton = UIButton(frame: CGRect(x: 0,
                                            y: alertView.frame.size.height-50,
                                            width: alertView.frame.size.width,
                                            height: 50))
        selectButton.setTitle("선택하기", for: .normal)
        selectButton.setTitleColor(.link, for: .normal )
        selectButton.addTarget(self,
                         action: #selector(dismissAlert),
                         for: .touchUpInside)
        alertView.addSubview(selectButton)

        UIView.animate(withDuration: 0.25 , animations: {
            
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25,
                               animations: {
                                self.alertView.center = targetView.center
                               })
            }
        
        })
        
    }
    
    @objc func dismissAlert(){
        
        guard let targetView = mytargetView else {return}
        
        UIView.animate(withDuration: 0.25,
                       animations: {
                        self.alertView.frame = CGRect(x: 40,
                                                 y: targetView.frame.size.height,
                                                 width: targetView.frame.size.width-80,
                                                 height: 300)
            
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.25,
                               animations: {
                                
                                self.backgroundView.alpha = 0
                                
                               }, completion: { done in
                                    if done{
                                        self.alertView.removeFromSuperview()
                                        self.backgroundView.removeFromSuperview()
                                    }
                               })
            }
        
        })
    }
    
    @objc func radioSelect(_ sender:DLRadioButton){
        guard let targetView = mytargetView else {return}
        
        let title = sender.currentTitle!
        let url = "www.naver.com"

        switch title {
        case "개발서버":
            print(sender.currentTitle!)
            print(url)
            break
        case "스테이징서버":
            print(sender.currentTitle!)
            print(url)

            break
        case "실서버":
            print(sender.currentTitle!)
            print(url)

            break
        default:
            print(sender.currentTitle!)
            print(url)

            break
        }
        
    }
}
