//
//  DDCCategoryViewDelegate.swift
//  DayDayCook
//
//  Created by ooops on 2019/7/29.
//  Copyright © 2019年 DDC. All rights reserved.
//

import Foundation
import JXPagingView
import JXCategoryView

class DDCCategoryViewDelegate: NSObject, JXCategoryViewDelegate {
    
    private var otherTitleView: JXCategoryTitleView?
    
    init(otherTitleView: JXCategoryTitleView?) {
        super.init()
        self.otherTitleView = otherTitleView
    }
    
    
//    func categoryView(_ categoryView: JXCategoryBaseView!, didSelectedItemAt index: Int) {
//        self.otherTitleView?.selectItem(at: index)
//    }
    
    func categoryView(_ categoryView: JXCategoryBaseView!, didClickSelectedItemAt index: Int) {
        self.otherTitleView?.selectItem(at: index)
    }
    
//    func categoryView(_ categoryView: JXCategoryBaseView!, didScrollSelectedItemAt index: Int) {
//
//        self.otherTitleView?.selectItem(at: index)
//    }
}
