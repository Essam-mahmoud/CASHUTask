//
//  HomePagePresenter.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import Foundation

class HomePagePresenter{
    
    var homePageData = HomePageModel()
    var homePageVC : MainPageViewController?
    
    init(homePageVC : MainPageViewController) {
        self.homePageVC = homePageVC
    }
}
