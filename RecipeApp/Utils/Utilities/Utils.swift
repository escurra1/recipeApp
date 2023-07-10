//
//  Utils.swift
//  RecipeApp
//
//  Created by Escurra Colquis on 07/07/23.
//

import Foundation
import SwiftMessages

class Utils: NSObject {
    static func showMessageTop(_ isValid: Bool, textBody: String) {
        if isValid == true {
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
            let view: MessageView
            view = try! SwiftMessages.viewFromNib()
            view.configureContent(title: .empty, body: textBody, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: .empty, buttonTapHandler: { _ in
                SwiftMessages.hide()})
            view.accessibilityPrefix = NSLocalizedString("errorTitle", comment: "errorTitle")
            view.configureDropShadow()
            view.button?.isHidden = true
            var config = SwiftMessages.defaultConfig
            config.presentationStyle = .top
            config.presentationContext = .window(windowLevel: .statusBar)
            config.preferredStatusBarStyle = .lightContent
            config.interactiveHide = false
            config.duration = .seconds(seconds: 1.5)
            view.configureTheme(backgroundColor: UIColor.red, foregroundColor: UIColor.white, iconImage: nil, iconText: nil)
            config.dimMode = .gray(interactive: true)
            SwiftMessages.show(config: config, view: view)
        } else {
            SwiftMessages.hide()
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
        }
    }
    
    static func checkInternetConnection() -> Bool{
        var flag = false
        let reachability = Reachability()
        switch reachability?.connection {
        case .wifi, .cellular:
            flag = true
        default:
            flag = false
        }
        return flag
    }
}

extension String {
    static let empty = ""
}
