//
//  DiscoverHeaderView.swift
//  PinGo
//
//  Created by GaoWanli on 16/1/31.
//  Copyright © 2016年 GWL. All rights reserved.
//

import UIKit

protocol DiscoverHeaderViewDelegate: NSObjectProtocol {
    
    /**
     点击了某个按钮
     
     - parameter headerView:   view
     - parameter button: 按钮
     */
    func discoverHeaderView(headerView: DiscoverHeaderView, didClickButton button: UIButton)
}

class DiscoverHeaderView: UIView {
    
    @IBOutlet private weak var topView: UIView!
    
    var bannerList: [Banner]? {
        didSet {
            imageCarouselView.bannerList = bannerList
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topView.addSubview(imageCarouselView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageCarouselView.frame = topView.bounds
    }
    
    func scrollImage() {
        imageCarouselView.startTimer()
    }
    
    func stopScrollImage() {
        imageCarouselView.stopTimer()
    }
    
    @IBAction func buttonClick(sender: AnyObject) {
    }
    
    class func loadFromNib() -> DiscoverHeaderView {
        return NSBundle.mainBundle().loadNibNamed("DiscoverHeader", owner: self, options: nil).last as! DiscoverHeaderView
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