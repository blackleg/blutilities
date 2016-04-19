//
//  BLDates.m
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

#import "BLDates.h"

#define SECONDS_OF_MINUTE 60

@interface BLDates ()

@end

@implementation BLDates

+(NSDateFormatter *)formatter {
    return [NSDateFormatter new];
}

+(NSDateFormatter *)formatterWithDateStyle:(NSDateFormatterStyle) dateStyle andTimeStyle:(NSDateFormatterStyle) timeStyle {
    NSDateFormatter *dateFormatter = [self formatter];
    [dateFormatter setDateStyle:dateStyle];
    [dateFormatter setTimeStyle:timeStyle];
    return dateFormatter;
}

+(NSString *)stringFromDate:(NSDate *) date withDateStyle:(NSDateFormatterStyle) dateStyle andTimeStyle:(NSDateFormatterStyle) timeStyle {
    return [[self formatterWithDateStyle:dateStyle andTimeStyle:timeStyle] stringFromDate:date];
}

+(NSString *)stringFromDateShortStyle:(NSDate *) date {
    return [self stringFromDate:date withDateStyle: NSDateFormatterShortStyle andTimeStyle:NSDateFormatterShortStyle];
}

+ (NSDateComponents *)getTimeComponents:(NSDate *)date {
    return [[NSCalendar currentCalendar] components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
}

+ (NSInteger)getSeconds:(NSDate *) date {
    return [[self getTimeComponents:date] second];
}

+ (NSInteger)getMinutes:(NSDate *) date {
    return [[self getTimeComponents:date] minute];
}

+ (NSInteger)getHours:(NSDate *) date {
    return [[self getTimeComponents:date] hour];
}

+ (NSDate *)roundDateTo5Minutes:(NSDate *)date {
    return [self roundDateToMinutes:5 theDate:date];
}

+ (NSDate *)roundDateTo10Minutes:(NSDate *)date {
    return [self roundDateToMinutes:10 theDate:date];
}

+ (NSDate *)roundDateTo30Minutes:(NSDate *)date {
    return [self roundDateToMinutes:30 theDate:date];
}

+ (NSDate *)roundDateToMinutes:(int)minuteInterval theDate:(NSDate *)date {
    NSInteger minutes = [self getMinutes: date];
    int onesDigit = minutes % 10;
    NSDate *temDate;
    if (onesDigit < 5) {
        temDate = [self roundDateToFlooringMinutes:minuteInterval theDate:date];
    } else {
        temDate = [self roundDateToCeilingMinutes:minuteInterval theDate:date];
    }
    return date;
}

+ (NSDate *)roundDateToCeiling5Minutes:(NSDate *)date {
    return [self roundDateToCeilingMinutes:5 theDate: date];
}

+ (NSDate *)roundDateToCeiling10Minutes:(NSDate *)date {
    return [self roundDateToCeilingMinutes:10 theDate:date];
}

+ (NSDate *)roundDateToCeiling30Minutes:(NSDate *)date {
    return [self roundDateToCeilingMinutes:30 theDate:date];
}

+ (NSDate *)roundDateToCeilingMinutes:(int)minuteInterval theDate:(NSDate *)date {
    NSInteger minutes = [self getMinutes: date];
    int remain = minutes % minuteInterval;
    return [date dateByAddingTimeInterval: (SECONDS_OF_MINUTE * (minuteInterval - remain)) - [self getSeconds:date]];
}

+ (NSDate *)roundDateToFlooring5Minutes:(NSDate *) date {
    return [self roundDateToFlooringMinutes:5 theDate: date];
}

+ (NSDate *)roundDateToFlooring10Minutes:(NSDate *)date {
    return [self roundDateToFlooringMinutes:10 theDate:date];
}

+ (NSDate *)roundDateToFlooring30Minutes:(NSDate *)date {
    return [self roundDateToFlooringMinutes:30 theDate: date];
}

+ (NSDate *)roundDateToFlooringMinutes:(int)minuteInterval theDate:(NSDate *)date {
    NSInteger minutes = [self getMinutes:date];
    int remain = minutes % minuteInterval;
    return [date dateByAddingTimeInterval:-(SECONDS_OF_MINUTE * remain) - [self getSeconds:date]];
}

+(NSString *)makeDateIntervalStringfrom:(NSDate *)fromDate to:(NSDate *) untilDate withIntervalFormat:(NSString *) intervalFormat andDateStyle:(NSDateFormatterStyle) dateStyle andTimeStyle:(NSDateFormatterStyle) timeStyle  {
    NSString *fromDateString = [self stringFromDate:fromDate withDateStyle:dateStyle andTimeStyle:timeStyle];
    NSString *untilDateString = [self stringFromDate:untilDate withDateStyle:dateStyle andTimeStyle:timeStyle];
    return [NSString stringWithFormat:intervalFormat, fromDateString, untilDateString];
}

+(NSString *)makeDateIntervalStringfrom:(NSDate *)fromDate to:(NSDate *) untilDate withFormat:(NSString *) format {
    return [self makeDateIntervalStringfrom:fromDate to:untilDate withIntervalFormat:format andDateStyle:NSDateFormatterShortStyle andTimeStyle:NSDateFormatterShortStyle];
}

+(NSDate *) makeDateFromDoubleInterval:(double) interval {
    return [NSDate dateWithTimeIntervalSince1970:interval];
}

+(NSDate *) makeDateFromMilisecondsInterval:(double) interval {
    return [self makeDateFromDoubleInterval:interval/1000.0];
}

+(NSNumber *) dateToMiliseconds:(NSDate *) date {
    double seconds = [date timeIntervalSince1970];
    double miliseconds = seconds * 1000;
    return [NSNumber numberWithDouble:miliseconds];
}

+(Boolean)isDate:(NSDate *) date laterThanOrEqualTo:(NSDate*)anotherDate {
    return !([date compare:anotherDate] == NSOrderedAscending);
}

+(Boolean)isDate:(NSDate *) date earlierThanOrEqualTo:(NSDate*)anotherDate {
    return !([date compare:anotherDate] == NSOrderedDescending);
}

+(Boolean)isDate:(NSDate *) date laterThan:(NSDate*)anotherDate {
    return ([date compare:anotherDate] == NSOrderedDescending);
}

+(Boolean)isDate:(NSDate *) date earlierThan:(NSDate*)anotherDate {
    return ([date compare:anotherDate] == NSOrderedAscending);
}

@end
