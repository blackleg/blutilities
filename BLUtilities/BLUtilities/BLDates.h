//
//  BLDates.h
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

#import <Foundation/Foundation.h>

@interface BLDates : NSObject
+(NSDateFormatter *)formatter;
+(NSDateFormatter *)formatterWithDateStyle:(NSDateFormatterStyle) dateStyle andTimeStyle:(NSDateFormatterStyle) timeStyle;
+(NSString *)stringFromDateShortStyle:(NSDate *) date;
+(NSDateComponents *)getTimeComponents:(NSDate *)date;
+(NSInteger)getSeconds:(NSDate *) date;
+(NSInteger)getMinutes:(NSDate *) date;
+(NSInteger)getHours:(NSDate *) date;
+(NSDate *)roundDateTo5Minutes:(NSDate *) date;
+(NSDate *)roundDateTo10Minutes:(NSDate *) date;
+(NSDate *)roundDateTo30Minutes:(NSDate *) date;
+(NSDate *)roundDateToMinutes:(int)minuteInterval theDate:(NSDate *) date;
+(NSDate *)roundDateToCeiling5Minutes:(NSDate *) date;
+(NSDate *)roundDateToCeiling10Minutes:(NSDate *) date;
+(NSDate *)roundDateToCeiling30Minutes:(NSDate *) date;
+(NSDate *)roundDateToCeilingMinutes:(int)minuteInterval theDate:(NSDate *) date;
+(NSDate *)roundDateToFlooring5Minutes:(NSDate *) date;
+(NSDate *)roundDateToFlooring10Minutes:(NSDate *) date;
+(NSDate *)roundDateToFlooring30Minutes:(NSDate *) date;
+(NSDate *)roundDateToFlooringMinutes:(int)minuteInterval theDate:(NSDate *) date;
+(NSString *)makeDateIntervalStringfrom:(NSDate *)fromDate to:(NSDate *) untilDate withIntervalFormat:(NSString *) intervalFormat andDateStyle:(NSDateFormatterStyle) dateStyle andTimeStyle:(NSDateFormatterStyle) timeStyle;
+(NSString *)makeDateIntervalStringfrom:(NSDate *)fromDate to:(NSDate *) untilDate withFormat:(NSString *) format;
+(NSDate *) makeDateFromDoubleInterval:(double) interval;
+(NSDate *) makeDateFromMilisecondsInterval:(double) interval;
+(NSNumber *) dateToMiliseconds:(NSDate *) date;
@end