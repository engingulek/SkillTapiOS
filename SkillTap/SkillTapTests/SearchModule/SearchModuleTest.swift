//
//  SearchModuleTest.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 13.12.2024.
//

import Foundation
import XCTest
@testable import SkillTap

final class SearchModuleTest : XCTestCase {
    private var presenter : SearchPresenter!
    private var view : MockSearchViewController!
    private var router:SearchRouter!
    
    
    override  func setUp() {
        super.setUp()
        view = .init()
        router = .init()
        presenter = .init(view: view,
                          router: router)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        router = nil
        presenter = nil
    }
    
    func test_viewModel_setBackColorAble_returnSecondaryColor(){
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 1)
        
        XCTAssertEqual(view.invokedsetBackColorAbleData.map((\.color)),
                       [ColorTheme.secondaryColor.color])
    }
    
    
    func test_viewModel_changeTitle_returnHomeNav(){
        XCTAssertFalse(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 1)
        
        XCTAssertEqual(view.invokedsetChangeTitleData.map((\.title)),
                       [TextTheme.searchNavTitle.text])
    }
    
    
    func test_viewModelOnSetSearchTextFieldPlaceholder_Returnplaceholder(){
        XCTAssertFalse(view.invokedsetSearchTextFieldPlaceholder)
        XCTAssertEqual(view.invokedsetSearchTextFieldPlaceholderCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetSearchTextFieldPlaceholder)
        XCTAssertEqual(view.invokedsetSearchTextFieldPlaceholderCount, 1)
        XCTAssertEqual(view.invokedsetSearchTextFieldPlaceholderData.map(\.placeholder),[TextTheme.searchplaceholder.text])
    }
    
    func test_viewModel_setAdvertsButtonDesign_ReturnDesings(){
        XCTAssertFalse(view.invokedsetAdvertsButtonDesign)
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetAdvertsButtonDesign)
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignCount, 1)
        
        //text
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.text),[TextTheme.adverts.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.textColor),[ColorTheme.secondaryColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.backColor),[ColorTheme.thirdColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
    }
    
    
    func test_viewModel_setFreelancerButtonDesign_ReturnDesings(){
        XCTAssertFalse(view.invokedsetFreelancerButtonDesign)
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetFreelancerButtonDesign)
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignCount, 1)
        
        //text
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.text),[TextTheme.freelancers.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.textColor),[ColorTheme.thirdColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.backColor),[ColorTheme.secondaryColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
    }
    
    func test_onTappedAdvertsButton_ReturnAdvertsButtonDesign(){
        
        presenter.onTappedAdvertsButton()
        
       
        
        //text
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.text),[TextTheme.adverts.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.textColor),[ColorTheme.secondaryColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.backColor),[ColorTheme.thirdColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
    }
    
    
    
    func test_onTappedAdvertsButton_ReturnFreelancersButtonDesign(){
        
        presenter.onTappedAdvertsButton()
        
       
        
        //text
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.text),[TextTheme.freelancers.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.textColor),[ColorTheme.thirdColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.backColor),[ColorTheme.secondaryColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
    }
    
    
    func test_onTappedFreelancerButton_ReturnFreelancersButtonDesign(){
        presenter.onTappedFreelancerButton()
        
        
        //text
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.text),[TextTheme.freelancers.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.textColor),[ColorTheme.secondaryColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.backColor),[ColorTheme.thirdColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetFreelancerButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
        
        
    }
    
    func test_onTappedFreelancerButton_ReturnAdvertsButtonDesign(){
        presenter.onTappedFreelancerButton()
        
        
        
        //text
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.text),[TextTheme.adverts.text])
        
        //textColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.textColor),[ColorTheme.thirdColor.color])
        
        //backColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.backColor),[ColorTheme.secondaryColor.color])
        
        //borderColor
        XCTAssertEqual(view.invokedsetAdvertsButtonDesignData.map(\.borderColor),[ColorTheme.thirdColor.color])
        
        
    }

    
    
    
    func test_viewDidload_advertsCollectionViewPrepare(){
        XCTAssertFalse(view.invokedadvertsCollectionViewPrepare)
        XCTAssertEqual(view.invokedadvertsCollectionViewPrepareCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedadvertsCollectionViewPrepare)
        XCTAssertEqual(view.invokedadvertsCollectionViewPrepareCount, 1)
    }
    
    
    func test_viewDidload_freelancerCollectionViewPrepare(){
        XCTAssertFalse(view.invokedfreelancerCollectionViewPrepare)
        XCTAssertEqual(view.invokedfreelancerCollectionViewPrepareCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedfreelancerCollectionViewPrepare)
        XCTAssertEqual(view.invokedfreelancerCollectionViewPrepareCount, 1)
    }
    
    
    func test_viewDidLoad_createSearchIconWhenOpenPage_ReturnIsHidden(){
        
        XCTAssertFalse(view.invokedcreateSearchIconWhenOpenPage)
        XCTAssertEqual(view.invokedcreateSearchIconWhenOpenPageCount,0)
     
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedcreateSearchIconWhenOpenPage)
        XCTAssertEqual(view.invokedcreateSearchIconWhenOpenPageCount,1)
        XCTAssertEqual(view.invokedcreateSearchIconWhenOpenPageData.map(\.isHidden),[false])
    }
    
    
}
