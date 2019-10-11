//
//  TWTabBarController.swift
//  TWWeChatMoments
//
//  Created by 韩继宏 on 2019/10/11.
//  Copyright © 2019 韩继宏. All rights reserved.
//

import UIKit

class TWTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        self.delegate = self
    }
    
    func addChildViewControllers() -> Void {
        /// 初始化子控制器
        let messagesViewController = TWMessagesViewController.init()
        addChildVc(childVc: messagesViewController, title: "微信", image: "tabbar_mainframe", selectedImage: "tabbar_mainframeHL")
        
        let contactsViewController = TWContactsViewController.init()
        addChildVc(childVc: contactsViewController, title: "通讯录", image: "tabbar_contacts", selectedImage: "tabbar_contactsHL")
        
        let discoverViewController = TWDiscoverViewController.init()
        addChildVc(childVc: discoverViewController, title: "发现", image: "tabbar_discover", selectedImage: "tabbar_discoverHL")
        
        let meViewController = TWMeViewController.init()
        addChildVc(childVc: meViewController, title: "我", image: "tabbar_me", selectedImage: "tabbar_meHL")
    }
    
    func addChildVc(childVc: UIViewController, title: String, image: String, selectedImage: String) -> Void {
        
        childVc.view.backgroundColor = .white
        childVc.title = title
        
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        
//        let normalAttr = [
//            NSAttributedString.Key.foregroundColor: .Color929292,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
//        ]
//        let selectedAttr = [
//            NSAttributedString.Key.foregroundColor: .Color09aa07,
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)
//        ]
//        childVc.tabBarItem.setTitleTextAttributes(normalAttr, for: .normal)
//        childVc.tabBarItem.setTitleTextAttributes(selectedAttr, for: .selected)
        
        childVc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        childVc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let nav = TWNavigationController(rootViewController: childVc)
        addChild(nav)
        
    }
    
    /// MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}

