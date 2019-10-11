//
//  TWNavigationController.swift
//  TWWeChatMoments
//
//  Created by 韩继宏 on 2019/10/11.
//  Copyright © 2019 韩继宏. All rights reserved.
//

import UIKit

class TWNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count != 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
