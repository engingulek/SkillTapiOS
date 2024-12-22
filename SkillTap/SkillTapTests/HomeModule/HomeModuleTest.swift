//
//  HomeModuleTest.swift
//  SkillTapTests
//
//  Created by Engin Gülek on 11.12.2024.
//

import Foundation
import XCTest
@testable import SkillTap

final class HomeModuleTest :  XCTestCase {
    private var presenter : HomePresenter!
    private var view : MockHomeViewController!
    private var interactor : MockHomeInteractor!
    private var router:HomeRouter!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view,
                          router: router,
                          interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        presenter = nil
        interactor = nil
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
    
    func test_viewModel_setCategoryTitleLabel_returnCategoryTitle(){
        XCTAssertFalse(view.invokedsetCategoryTitleLabel)
        XCTAssertEqual(view.invokedsetCategoryTitleLabelCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetCategoryTitleLabel)
        XCTAssertEqual(view.invokedsetCategoryTitleLabelCount, 1)
        
        XCTAssertEqual(view.invokedsetCategoryTitleLabeleData.map((\.title)),
                       [TextTheme.categories.text])
    }
    
    func test_viewModel_changeTitle_returnHomeNav(){
        XCTAssertFalse(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 1)
        
        XCTAssertEqual(view.invokedsetChangeTitleData.map((\.title)),
                       [TextTheme.homeNavTitle.text])
    }
    
    
    func test_viewModel_setSearchConfigureView_returnSearchLigtLabelText(){
        XCTAssertFalse(view.invokedsetSearchConfigureView)
        XCTAssertEqual(view.invokedsetSearchConfigureViewCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetSearchConfigureView)
        XCTAssertEqual(view.invokedsetSearchConfigureViewCount, 1)
        
        XCTAssertEqual(view.invokedsetSearchConfigureViewData.map((\.searchLigtLabelText)),
                       [TextTheme.searchplaceholder.text])
    }
    
    
    func test_viewModel_setHeadData_returnHiAndSearchplaceholder(){
        XCTAssertFalse(view.invokedsetHeadData)
        XCTAssertEqual(view.invokedsetHeadDataCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetHeadData)
        XCTAssertEqual(view.invokedsetHeadDataCount, 1)
        
        XCTAssertEqual(view.invokedsetHeadDataData.map((\.title)),
                       [TextTheme.hi.text])
        
        XCTAssertEqual(view.invokedsetHeadDataData.map((\.subtitle)),
                       [TextTheme.searchplaceholder.text])
    }
    
    func test_viewModel_categoriesCollectioViewPreapare(){
        XCTAssertFalse(view.invokedcategoriesCollectioViewPreapare)
        XCTAssertEqual(view.invokedcategoriesCollectioViewPreapareCount, 0)
     presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetHeadData)
        XCTAssertEqual(view.invokedsetHeadDataCount, 1)
        
    }
    
    func test_fetchCategoryOnViewDidload_categoriesCollectionViewRealoadData(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(view.invokedcategoriesCollectionViewRealoadData)
        XCTAssertEqual(view.invokedcategoriesCollectionViewRealoadDataCount, 0)
        interactor.categories = [
            .init(id: 1,
                  title: "test ttile",
                  imageURL:"test url",
                  advertCount: 10,
                  freelancerCount: 10,
                  colorCode: "#FFFFF")
        ]
        
        presenter.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedcategoriesCollectionViewRealoadData)
            XCTAssertEqual(self.view.invokedcategoriesCollectionViewRealoadDataCount, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    
    func test_pushViewControllerAble_categoriesCollectionViewRealoadData(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(view.invokedpushViewControllerAble)
        XCTAssertEqual(view.invokedpushViewControllerAbleCount, 0)
        interactor.categories = [
            .init(id: 1,
                  title: "test ttile",
                  imageURL:"test url",
                  advertCount: 10,
                  freelancerCount: 10,
                  colorCode: "#FFFFF")
        ]
        let indexPath:IndexPath = [0,0]
        presenter.didSelectItem(at:indexPath )
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedpushViewControllerAble)
            XCTAssertEqual(self.view.invokedpushViewControllerAbleCount, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_fetchCategoryOnViewDidload_retrunErrorMessage(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(view.invokedcreateErrorMessageForCategories)
        XCTAssertEqual(view.invokedcreateErrorMessageForCategoriesCount, 0)
        interactor.categories = [
            .init(id: 1,
                  title: "test ttile",
                  imageURL:"test url",
                  advertCount: 10,
                  freelancerCount: 10,
                  colorCode: "#FFFFF")
        ]
        interactor.mockfetchCategoriesError = true
        presenter.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in 
            XCTAssertTrue(view.invokedcreateErrorMessageForCategories)
            XCTAssertEqual(view.invokedcreateErrorMessageForCategoriesCount, 1)
            XCTAssertEqual(view.invokedcreateErrorMessageForCategoriesData.map(\.message),[TextTheme.errorMessage.text])
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_fetchCategoryOnViewDidload_ReturnLoadinAnimation(){
        let expectation = XCTestExpectation(description: "Async task completed")
        // start animation
        XCTAssertFalse(view.invokedstartLoadignAnimation)
        XCTAssertEqual(view.invokedstartLoadignAnimationCount, 0)
        
        
        // stop animation
        XCTAssertFalse(view.invokedstopLoadingAnimation)
        XCTAssertEqual(view.invokedstopLoadingAnimationCount, 0)
        
        interactor.categories = [
            .init(id: 1,
                  title: "test ttile",
                  imageURL:"test url",
                  advertCount: 10,
                  freelancerCount: 10,
                  colorCode: "#FFFFF")
        ]
        
        presenter.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            // start animation
            XCTAssertTrue(view.invokedstartLoadignAnimation)
            XCTAssertEqual(view.invokedstartLoadignAnimationCount, 1)
            
            
            // stop animation
            XCTAssertTrue(view.invokedstopLoadingAnimation)
            XCTAssertEqual(view.invokedstopLoadingAnimationCount, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
    }
    
    func test_fetchCategoryOnViewDidload_IfError_ReturnLoadinAnimation(){
        let expectation = XCTestExpectation(description: "Async task completed")
        // start animation
        XCTAssertFalse(view.invokedstartLoadignAnimation)
        XCTAssertEqual(view.invokedstartLoadignAnimationCount, 0)
        
        
        // stop animation
        XCTAssertFalse(view.invokedstopLoadingAnimation)
        XCTAssertEqual(view.invokedstopLoadingAnimationCount, 0)
        
        interactor.categories = [
            .init(id: 1,
                  title: "test ttile",
                  imageURL:"test url",
                  advertCount: 10,
                  freelancerCount: 10,
                  colorCode: "#FFFFF")
        ]
        interactor.mockfetchCategoriesError = true
        presenter.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            // start animation
            XCTAssertTrue(view.invokedstartLoadignAnimation)
            XCTAssertEqual(view.invokedstartLoadignAnimationCount, 1)
            
            
            // stop animation
            XCTAssertTrue(view.invokedstopLoadingAnimation)
            XCTAssertEqual(view.invokedstopLoadingAnimationCount, 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
        
    }

}
