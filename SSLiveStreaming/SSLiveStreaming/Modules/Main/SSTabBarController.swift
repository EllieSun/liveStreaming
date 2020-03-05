//
//  ViewController.swift
//  SSLiveStreaming
//
//  Created by Selina on 2020/3/4.
//  Copyright © 2020 Selina. All rights reserved.
//

import UIKit

class SSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        addChildViewController(childController: SSHomeVIewController(),title:"首页",imageName:"tab_icon_choose")
        addChildViewController(childController: SSLiveViewController(),title:"直播",imageName: "tab_icon_discover")
        addChildViewController(childController: SSFollowViewController(),title: "关注",imageName: "tab_icon_ graduate")
        addChildViewController(childController: SSMineViewController(), title: "我的", imageName: "tab_icon_shop")

    }

    func addChildViewController(childController: UIViewController,title:String,imageName:String) {
        
        childController.title = title;
        
        childController.tabBarItem.image = UIImage(named: imageName)
        
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
                
        let nav = UINavigationController()
        
        nav.addChild(childController)
        
        addChild(nav)
        
    }

}

