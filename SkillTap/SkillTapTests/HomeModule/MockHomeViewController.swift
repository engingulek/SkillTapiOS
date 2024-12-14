//
//  MockHomeViewController.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 11.12.2024.
//

import Foundation
import UIKit
@testable import SkillTap

class MockHomeViewController : PresenterToViewHomeProtocol{
 
    

    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    
    var invokedsetCategoryTitleLabel:Bool = false
    var invokedsetCategoryTitleLabelCount:Int = 0
    var invokedsetCategoryTitleLabeleData = [(title:String,Void)]()
    func setCategoryTitleLabel(title: String) {
        invokedsetCategoryTitleLabel = true
        invokedsetCategoryTitleLabelCount += 1
        invokedsetCategoryTitleLabeleData.append((title:title,()))
    }
    
    var invokedsetChangeTitle:Bool = false
    var invokedsetChangeTitleCount:Int = 0
    var invokedsetChangeTitleData = [(title:String,Void)]()
    func changeTitle(title: String) {
        invokedsetChangeTitle = true
        invokedsetChangeTitleCount += 1
        invokedsetChangeTitleData.append((title:title,()))
    }
    
    
    
    var invokedsetSearchConfigureView:Bool = false
    var invokedsetSearchConfigureViewCount:Int = 0
    var invokedsetSearchConfigureViewData = [(searchLigtLabelText:String,Void)]()
    func setSearchConfigureView(searchLigtLabelText: String) {
         invokedsetSearchConfigureView = true
         invokedsetSearchConfigureViewCount += 1
         invokedsetSearchConfigureViewData.append((searchLigtLabelText:searchLigtLabelText,()))
    }
    
    
    var invokedsetHeadData:Bool = false
    var invokedsetHeadDataCount:Int = 0
    var invokedsetHeadDataData = [(title: String, subtitle: String)]()
    func setHeadData(title: String, subtitle: String) {
         invokedsetHeadData = true
         invokedsetHeadDataCount += 1
        invokedsetHeadDataData.append((title:title,subtitle:subtitle))
    }
    
    var invokedcategoriesCollectioViewPreapare:Bool = false
    var invokedcategoriesCollectioViewPreapareCount:Int = 0
    func categoriesCollectioViewPreapare() {
         invokedcategoriesCollectioViewPreapare = true
         invokedcategoriesCollectioViewPreapareCount += 1
    }
    
    
    var invokedcategoriesCollectionViewRealoadData:Bool = false
    var invokedcategoriesCollectionViewRealoadDataCount:Int = 0
    func categoriesCollectionViewRealoadData() {
        invokedcategoriesCollectionViewRealoadData = true
        invokedcategoriesCollectionViewRealoadDataCount += 1
    }
    
    
    var invokedpushViewControllerAble:Bool = false
    var invokedpushViewControllerAbleCount:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
         invokedpushViewControllerAble = true
         invokedpushViewControllerAbleCount += 1
    }
    
    
    var invokedcreateErrorMessageForCategories:Bool = false
    var invokedcreateErrorMessageForCategoriesCount:Int = 0
    var invokedcreateErrorMessageForCategoriesData = [(message:String,Void)]()
    func createErrorMessageForCategories(message: String) {
        
         invokedcreateErrorMessageForCategories = true
         invokedcreateErrorMessageForCategoriesCount += 1
         invokedcreateErrorMessageForCategoriesData.append((message:message,()))
    }
    
    
    
    var invokedstartLoadignAnimation:Bool = false
    var invokedstartLoadignAnimationCount:Int = 0
    func startLoadignAnimation() {
         invokedstartLoadignAnimation = true
         invokedstartLoadignAnimationCount += 1
    }
    
    var invokedstopLoadingAnimation:Bool = false
    var invokedstopLoadingAnimationCount:Int = 0
    func stopLoadingAnimation() {
         invokedstopLoadingAnimation = true
         invokedstopLoadingAnimationCount += 1
    }
    
    
    
    func popViewControllerAble() {
        
    }
    
    
    
    
    
    
}
