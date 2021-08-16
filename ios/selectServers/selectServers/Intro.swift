//
//  Intro.swift
//  selectServers
//
//  Created by Derrick kim on 2021/08/16.
//

import UIKit
import DLRadioButton

class Intro: UIViewController {
    
    // Custom Alert UI
    let customAlert = MyAlert()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true;
        
        if getAppDelegate().connectedToNetwork() == true {
            #if DEBUG
            debugPrint("DEBUG")
            
            customAlert.showAlert(with: "서버 선택하기",
                                  message: "",
                                  on: self)
            #else
            self.getAppDelegate().setFirebaseRemoteconfig()
            #endif
            
        } else {
            // 네트워크 연결 안됨 팝업
            let alert = UIAlertController(title: "alert_titleError".localized, message: "alert_msg_networkError".localized, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "btn_ok".localized, style: .default, handler: { Void in })
            alert.addAction(okAction)
            getAppDelegate().topViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissAlert(){
        customAlert.dismissAlert()
    }
    
    @objc func radioSelect(){
        customAlert.radioSelect(DLRadioButton.init())
    }
}

