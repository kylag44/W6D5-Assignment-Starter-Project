//
//  w6d5_ui_performance_testingUITests.swift
//  w6d5-ui-performance-testingUITests
//
//  Created by Kyla  on 2018-09-07.
//  Copyright © 2018 Roland. All rights reserved.
//

import XCTest

class w6d5_ui_performance_testingUITests: XCTestCase {
  
    let app = XCUIApplication()
  
    override func setUp() {
        super.setUp()
      
     

        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func addMeal(mealName: String, numberOfCalories: Int) {
      
      
      let app = XCUIApplication()
      app.navigationBars["Master"].buttons["Add"].tap()
      
      let addAMealAlert = app.alerts["Add a Meal"]
      let collectionViewsQuery = addAMealAlert.collectionViews
      collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText(mealName)
      
      let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
      textField.tap()
      textField.typeText("\(numberOfCalories)")
      addAMealAlert.buttons["Ok"].tap()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
  
  func testAddNewMeal() {
  addMeal(mealName: "Burger", numberOfCalories: 300)
  
 
  }
  
  func testDeleteMeal() {
    addMeal(mealName: "Burger", numberOfCalories: 300)

    let tablesQuery = app.tables
    let burger300StaticText = tablesQuery.staticTexts["Burger - 300"]
    let staticText = app.tables.staticTexts["Burger - 300"]
    if staticText.exists {
      staticText.swipeLeft()
      app.tables.buttons["Delete"].tap()
    }
  }
  

  func testShowMealDetail() {
    
    let app = XCUIApplication()
    app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Burger - 300"].tap()
    app.staticTexts["Burger - 300"].tap()
    app.navigationBars["Detail"].buttons["Master"].tap()
  

    
  }
  
  
}
