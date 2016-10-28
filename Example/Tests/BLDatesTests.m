//
//  BLDatesTests.m
//  BLUtilities
//
//  Copyright © 2016 blackleg.es.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE

#import <XCTest/XCTest.h>
#import <BLUtilities/BLDates.h>

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

-(void)testFormatterWith {
    NSDateFormatter *formatter = [BLDates formatterWith:@"yyyy-MM-dd"];
    XCTAssertNotNil(formatter);
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

-(void)testGetDateComponents {
    NSDate *now = [NSDate date];
    XCTAssertNotNil(now);
    NSDateComponents * components = [BLDates getDateComponents:now];
    XCTAssertNotNil(components);
}

-(void)testFromStringWithFormat {
    NSString *format = @"dd-MM-yy";
    NSString *date = @"18-01-88";
    NSDate *fromFormatDate = [BLDates fromString:date withFormat:format];
    XCTAssertNotNil(fromFormatDate);
}

-(void)testHoursBetween {
    NSString *format = @"dd-MM-yy HH:mm";
    NSString *firstDateString = @"18-01-88 12:00";
    NSDate *firstDate = [BLDates fromString:firstDateString withFormat:format];
    XCTAssertNotNil(firstDate);
    NSString *secondDateString = @"18-01-88 14:00";
    NSDate *secondDate = [BLDates fromString:secondDateString withFormat:format];
    XCTAssertNotNil(secondDate);
    NSUInteger hours = [BLDates hoursBetween:firstDate and:secondDate];
    XCTAssertEqual(2, hours);
    firstDateString = @"18-01-88 12:00";
    firstDate = [BLDates fromString:firstDateString withFormat:format];
    XCTAssertNotNil(firstDate);
    secondDateString = @"19-01-88 14:00";
    secondDate = [BLDates fromString:secondDateString withFormat:format];
    XCTAssertNotNil(secondDate);
    hours = [BLDates hoursBetween:firstDate and:secondDate];
    XCTAssertEqual(26, hours);
}


@end
