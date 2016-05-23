//
//  DiscoverHomeController.swift
//  PinGo
//
//  Created by GaoWanli on 16/1/31.
//  Copyright © 2016年 GWL. All rights reserved.
//

import UIKit

class DiscoverHomeController: UIViewController {

    @IBOutlet private weak var discoverContainerView: UIView!
    @IBOutlet private weak var topicContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = topMenu
    }
    
    // MARK: lazy loading
    private lazy var topMenu: TopMenu = {
        let t = TopMenu.loadFromNib()
        t.showText = ("话题", "广场")
        t.delegate = self
        return t
    }()
}

extension DiscoverHomeController: TopMenuDelegate {
    
    func topMenu(topMenu: TopMenu, didClickButton index: Int) {
        discoverContainerView.hidden = (index == 1)
        topicContainerView.hidden = !discoverContainerView.hidden
    }
}// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com