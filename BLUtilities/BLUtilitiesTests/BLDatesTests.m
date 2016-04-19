//
//  BLDatesTests.m
//  BLUtilities
//
//  Created by Hector Espert on 19/4/16.
//  Copyright © 2016 blackleg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BLDates.h"

@interface BLDatesTests : XCTestCase

@end

@implementation BLDatesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDateIsEarlierThanOrEqualTo {
    NSDate *now = [NSDate date];
    NSDate *earlier = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:[NSDate date] options:0];
    XCTAssertTrue([BLDates isDate:earlier earlierThanOrEqualTo:now]);
    earlier = now;
    XCTAssertTrue([BLDates isDate:earlier earlierThanOrEqualTo:now]);
    earlier = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:[NSDate date] options:0];
    XCTAssertFalse([BLDates isDate:earlier earlierThanOrEqualTo:now]);
}

- (void)testDateIsLaterThanOrEqualTo {
    NSDate *now = [NSDate date];
    NSDate *earlier = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:[NSDate date] options:0];
    XCTAssertTrue([BLDates isDate:earlier laterThanOrEqualTo:now]);
    earlier = now;
    XCTAssertTrue([BLDates isDate:earlier laterThanOrEqualTo:now]);
    earlier = [[NSCalendar currentCalendar] dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:[NSDate date] options:0];
    XCTAssertFalse([BLDates isDate:earlier laterThanOrEqualTo:now]);
}


@end
