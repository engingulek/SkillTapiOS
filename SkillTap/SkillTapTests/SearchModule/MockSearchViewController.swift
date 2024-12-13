//
//  MockSearchViewController.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 13.12.2024.
//

import Foundation
import UIKit
@testable import SkillTap

class MockSearchViewController : PresenterToViewSearchProtocol {
    
    
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    var invokedsetChangeTitle:Bool = false
    var invokedsetChangeTitleCount:Int = 0
    var invokedsetChangeTitleData = [(title:String,Void)]()
    func changeTitle(title: String) {
        invokedsetChangeTitle = true
        invokedsetChangeTitleCount += 1
        invokedsetChangeTitleData.append((title:title,()))
    }
    
    var invokedsetSearchTextFieldPlaceholder:Bool = false
    var invokedsetSearchTextFieldPlaceholderCount:Int = 0
    var invokedsetSearchTextFieldPlaceholderData = [(placeholder:String,Void)]()
    func setSearchTextFieldPlaceholder(_ placeholder: String) {
         invokedsetSearchTextFieldPlaceholder = true
         invokedsetSearchTextFieldPlaceholderCount += 1
        invokedsetSearchTextFieldPlaceholderData.append((placeholder:placeholder,()))
    }
    
    var invokedsetAdvertsButtonDesign:Bool = false
    var invokedsetAdvertsButtonDesignCount:Int = 0
    var invokedsetAdvertsButtonDesignData = [
        (text:String,
         textColor:String,
         backColor:String,
         borderColor:String)
    ]()
    func setAdvertsButtonDesign(
        text: String,
        textColor: String,
        backColor: String,
        borderColor: String) {
             invokedsetAdvertsButtonDesign = true
             invokedsetAdvertsButtonDesignCount += 1
            invokedsetAdvertsButtonDesignData.append(
                (text:text,
                 textColor:textColor,
                 backColor:backColor,
                 borderColor:borderColor)
            
            )
        
    }
    
    var invokedsetFreelancerButtonDesign:Bool = false
    var invokedsetFreelancerButtonDesignCount:Int = 0
    var invokedsetFreelancerButtonDesignData = [
        (text:String,
         textColor:String,
         backColor:String,
         borderColor:String)
    ]()
    func setFreelancerButtonDesign(
        text: String,
        textColor: String,
        backColor: String,
        borderColor: String) {
            invokedsetFreelancerButtonDesign = true
            invokedsetFreelancerButtonDesignCount += 1
            invokedsetFreelancerButtonDesignData.append(
               (text:text,
                textColor:textColor,
                backColor:backColor,
                borderColor:borderColor)
           
           )
        
    }
    
    var invokedadvertsCollectionViewPrepare:Bool = false
    var invokedadvertsCollectionViewPrepareCount:Int = 0
    func advertsCollectionViewPrepare() {
         invokedadvertsCollectionViewPrepare = true
         invokedadvertsCollectionViewPrepareCount += 1
    }
    
    var invokedfreelancerCollectionViewPrepare:Bool = false
    var invokedfreelancerCollectionViewPrepareCount:Int = 0
    func freelancerCollectionViewPrepare() {
        invokedfreelancerCollectionViewPrepare = true
        invokedfreelancerCollectionViewPrepareCount += 1
    }
    
    var invokedadvertsCollectionViewReload:Bool = false
    var invokedadvertsCollectionViewReloadCount:Int = 0
    func advertsCollectionViewReload() {
         invokedadvertsCollectionViewReload = true
         invokedadvertsCollectionViewReloadCount += 1
    }
    
    var invokedfreelancerCollectionViewReload:Bool = false
    var invokedfreelancerCollectionViewReloadCount:Int = 0
    func freelancerCollectionViewReload() {
         invokedfreelancerCollectionViewReload = true
         invokedfreelancerCollectionViewReloadCount += 1
    }
    
    
    var invokedcreateSearchIconWhenOpenPage:Bool = false
    var invokedcreateSearchIconWhenOpenPageCount:Int = 0
    var invokedcreateSearchIconWhenOpenPageData = [(isHidden:Bool,Void)]()
    func createSearchIconWhenOpenPage(isHidden: Bool) {
         invokedcreateSearchIconWhenOpenPage = true
         invokedcreateSearchIconWhenOpenPageCount += 1
        invokedcreateSearchIconWhenOpenPageData.append((isHidden:isHidden,()))
    }
    
    var invokedpushViewControllerAble:Bool = false
    var invokedpushViewControllerAbleCount:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
         invokedpushViewControllerAble = true
         invokedpushViewControllerAbleCount += 1
    }
    
    

    
    func popViewControllerAble() {
        
    }
    
    
}
