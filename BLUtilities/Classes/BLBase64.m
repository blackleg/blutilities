//
//  BLBase64.m
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

#import "BLBase64.h"

@implementation BLBase64

+(NSString *)encode:(NSString *) string {
    if (string) {
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        return [data base64EncodedStringWithOptions:kNilOptions];
    } else {
        return nil;
    }
}


+(NSString *)basicAuthStringWithUser:(NSString *) user andPassword:(NSString *) password {
    NSString *authString = [NSString stringWithFormat:@"%@:%@", user, password];
    return [NSString stringWithFormat:@"Basic %@", [self encode:authString]];
}

@end
