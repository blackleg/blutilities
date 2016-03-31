//
//  BLViews.m
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

#import "BLViews.h"

@implementation BLViews

+ (CGFloat)getHeight:(UIView *) view {
    return view.frame.size.height;
}

+ (CGFloat)getWidth:(UIView *) view {
    return view.frame.size.width;
}

+(void)addDecorationBotomBorder:(UIView *) view withColor:(UIColor *) color {
    CALayer *layer = [CALayer new];
    layer.frame = CGRectMake(0, view.frame.size.height - 1, view.frame.size.width, 1);
    layer.backgroundColor = [color CGColor];
    [view.layer addSublayer:layer];
}


@end
