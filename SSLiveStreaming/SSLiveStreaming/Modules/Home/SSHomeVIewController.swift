//
//  SSHomeVIewController.swift
//  SSLiveStreaming
//
//  Created by Selina on 2020/3/4.
//  Copyright © 2020 Selina. All rights reserved.
//

import UIKit
import JXPagingView
import JXCategoryView
import SnapKit

class SSHomeVIewController: UIViewController {
    
    private var cache: [JXPagingViewListViewDelegate]? = nil
    /// paddingForDraft
    private let heightForDraftHeader: Int = 44
    /// titleViewHeight
    private let heightForPinSectionHeader: Int = 30

    override func viewDidLoad() {
        self.initializeUI()
        self.setup()
    }
    
    private lazy var indicatoryView: JXCategoryIndicatorLineView = {
        let indicatory: JXCategoryIndicatorLineView = JXCategoryIndicatorLineView()
        indicatory.indicatorColor = UIColor.red
        indicatory.indicatorWidth = 20
        indicatory.indicatorHeight = 4
        indicatory.indicatorCornerRadius = 0
        indicatory.verticalMargin = -1
        return indicatory
    }()
    
    private lazy var navIndicatoryView: JXCategoryIndicatorLineView = {
        let indicatory: JXCategoryIndicatorLineView = JXCategoryIndicatorLineView()
        indicatory.indicatorColor = UIColor.red
        indicatory.indicatorWidth = 20
        indicatory.indicatorHeight = 4
        indicatory.indicatorCornerRadius = 0
        indicatory.verticalMargin = 5
        return indicatory
    }()

    
    lazy var pagerView: JXPagingView = {
        let pager: JXPagingView = JXPagingView(delegate: self)
        /// 子类想推出屏幕外. 减去子类header 的高度即可
        let topPadding: Int = 40
        return pager
    }()
    
    lazy var categoryView: JXCategoryTitleView = {
        let titleView: JXCategoryTitleView = JXCategoryTitleView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: CGFloat(heightForPinSectionHeader)))
        titleView.titles = self.titles
        titleView.delegate = self as? JXCategoryViewDelegate
        titleView.indicators = [self.indicatoryView]
//        titleView.titleSelectedFont = UIFont.pingFangSCFont(ofSize: 16, weight: .medium)
//        titleView.titleSelectedColor = UIColor(hexString: "1A1A1A")
//        titleView.titleFont = UIFont.pingFangSCFont(ofSize: 14, weight: .regular)
//        titleView.titleColor = UIColor(hexString: "1A1A1A")
        titleView.isAverageCellSpacingEnabled = false
        titleView.isContentScrollViewClickTransitionAnimationEnabled = false
        titleView.cellSpacing = 30
        return titleView
    }()
    
    lazy var navCategoryView: JXCategoryTitleView = {
        let titleView: JXCategoryTitleView = JXCategoryTitleView(frame: CGRect(x: 0, y: 0, width: ScreenWidth - 200, height: CGFloat(heightForPinSectionHeader)))
        titleView.titles = self.titles
        titleView.delegate = self.navCategoryDelegate
        titleView.indicators = [self.navIndicatoryView]
//        titleView.titleSelectedFont = UIFont.pingFangSCFont(ofSize: 16, weight: .medium)
//        titleView.titleSelectedColor = UIColor(hexString: "1A1A1A")
//        titleView.titleFont = UIFont.pingFangSCFont(ofSize: 14, weight: .regular)
//        titleView.titleColor = UIColor(hexString: "1A1A1A")
        titleView.cellSpacing = 30
        titleView.alpha = 0
        return titleView
    }()

    private var titles: [String] = [NSLocalizedString("食谱", comment: ""), NSLocalizedString("作品", comment: ""), NSLocalizedString("收藏", comment: "")]
    
    lazy var navCategoryDelegate: DDCCategoryViewDelegate = {
        let delegate: DDCCategoryViewDelegate = DDCCategoryViewDelegate(otherTitleView: self.categoryView)
        return delegate
    }()
    
}

// MARK: ------------------------ 初始化 ------------------------
extension SSHomeVIewController {
    
    private func setup() {
        self.navigationItem.title = NSLocalizedString("", comment: "")
        
        /// navigation controller right bar button
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "tab_icon_ graduate_selected")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(scan))
        self.navigationItem.leftBarButtonItem = leftBarButton
        
//        /// navigation controller right bar button
//        let button = UIButton()
//        button.setTitleColor(UIColor(hexString: "ff4f58"), for: .normal)
//        button.setTitleColor(UIColor(hexString: "a5a4a4"), for: .disabled)
//        button.titleLabel?.font = UIFont.pingFangSCFont(ofSize: 16, weight: .medium)
//        button.addTarget(self, action: #selector(standardRecipeController(didClickRightBarButton:)), for: .touchUpInside)
//        let rightBarButton = UIBarButtonItem(customView: button)
//        rightBarButton.isEnabled = isReediting ? true : (isDraftEditing ? (titleModel?.coverImage != nil && (titleModel?.title != nil && titleModel?.title != "")) : false)
//        self.rightBarButtonView = button
//        self.rightBarButton = rightBarButton
//        self.navigationItem.rightBarButtonItem = rightBarButton
//

    }
    
    private func initializeUI() {
        self.view.backgroundColor = .white
        view.addSubview(self.pagerView)
        
        self.pagerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.top.left.right.equalToSuperview()
//            $0.height.equalTo(ScreenHeight - NavigationBarHeight)
        }
        
//        self.navCategoryView.snp.makeConstraints {
//            $0.centerY.equalTo(self.navBar.leftButton.snp.centerY)
//            $0.centerX.equalToSuperview()
//            $0.width.equalTo(ScreenWidth - 200)
//            $0.height.equalTo(50)
//        }
    }
    
    @objc private func scan() {
        
    }
}

// MARK: - JXPagingViewDelegate
extension SSHomeVIewController: JXPagingViewDelegate {
    func tableHeaderViewHeight(in pagingView: JXPagingView) -> Int {
        return Int(NavigationBarHeight)
    }

    func tableHeaderView(in pagingView: JXPagingView) -> UIView {
        return UIView()
    }

    func heightForPinSectionHeader(in pagingView: JXPagingView) -> Int {
        return heightForPinSectionHeader
    }

    func viewForPinSectionHeader(in pagingView: JXPagingView) -> UIView {
        return self.categoryView
    }

    func numberOfLists(in pagingView: JXPagingView) -> Int {
        return self.titles.count
    }

    func pagingView(_ pagingView: JXPagingView, initListAtIndex index: Int) -> JXPagingViewListViewDelegate {
        
        if index == 0 {
            let s: StandardViewController = StandardViewController()

            self.cache?.append(s)

            return s
        }  else {
            let s: StandardViewController = StandardViewController()

            self.cache?.append(s)

            return s
        }
    }

    func mainTableViewDidScroll(_ scrollView: UIScrollView) {
//        let contentY: CGFloat = scrollView.contentOffset.y
//        let alpha: CGFloat = contentY / (CGFloat(tableHeaderViewHeight) - alphaDistance + CGFloat(heightForPinSectionHeader)) > 1 ? 1 : contentY / (CGFloat(tableHeaderViewHeight) - alphaDistance + CGFloat(heightForPinSectionHeader))
//        /// 导航栏
//        //self.navBar.alpha = alpha
//        self.navBar.backgroundColor = UIColor(hexString: "FFFFFF", alpha: alpha)
//
//        self.navCategoryView.alpha = alpha >= 1 ? alpha : 0
    }
}

