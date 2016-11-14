//
//  BLUtilitiesTests.m
//  BLUtilitiesTests
//
//  Created by Hector Espert on 30/3/16.
//  Copyright © 2016 blackleg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BLUtilities/BLUtilities.h>

@interface BLUtilitiesTests : XCTestCase

@end

@implementation BLUtilitiesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBase64 {
    NSString *string = @"manuela:1234";
    NSString *encodedString = [BLBase64 encode: string];
    XCTAssertNotNil(encodedString);
    NSLog(@"Encoded: %@", encodedString);
    NSString *expected = @"bWFudWVsYToxMjM0";
    XCTAssertTrue([expected isEqualToString:encodedString]);
}



@end
