//
//  TopicHeaderView.swift
//  PinGo
//
//  Created by GaoWanli on 16/2/2.
//  Copyright © 2016年 GWL. All rights reserved.
//

import UIKit

protocol TopicHeaderViewDelegate: NSObjectProtocol {
    
    /**
     点击了某个按钮
     
     - parameter headerView:   view
     - parameter button: 按钮
     */
    func topicHeaderView(headerView: TopicHeaderView, didClickButton button: UIButton)
}

class TopicHeaderView: UIView {
    
    @IBOutlet private weak var topView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topView.addSubview(imageCarouselView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageCarouselView.frame = topView.bounds
    }
    
    var bannerList: [Banner]? {
        didSet {
            imageCarouselView.bannerList = bannerList
        }
    }
    
    func scrollImage() {
        imageCarouselView.startTimer()
    }
    
    func stopScrollImage() {
        imageCarouselView.stopTimer()
    }
    
    @IBAction func buttonClick(sender: UITapGestureRecognizer) {
        if let view = sender.view {
            print(view.tag)
        }
    }
    
    class func loadFromNib() -> TopicHeaderView {
        return NSBundle.mainBundle().loadNibNamed("TopicHeader", owner: self, options: nil).last as! TopicHeaderView
    }
    
    // MARK: lazy loading
    private lazy var imageCarouselView: ImageCarouselView = {
        let i = ImageCarouselView.loadFromNib()
        return i
    }()
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com