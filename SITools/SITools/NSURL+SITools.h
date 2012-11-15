//
//  NSURL+SITools.h
//  SITools
//
//  Created by KUROSAKI Ryota on 2012/05/08.
//  Copyright (c) 2012 SI Agency Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SITools)
+ (NSURL *)URLWithScheme:(NSString *)scheme host:(NSString *)host path:(NSString *)path;
- (NSURL *)URLByAppendingQueryValuesAndKeys:(NSString *)firstValue, ...;
- (NSURL *)URLByAppendingQueryValue:(NSString *)value andKey:(NSString *)key;
- (NSURL *)URLByAppendingQuery:(NSString *)query;
@end

@interface NSString (NSURLForSITools)
- (NSString *)stringByURLEncode;
- (NSString *)stringByURLDecode;
+ (NSString *)queryStringWithValue:(NSString *)value andKey:(NSString *)key;
+ (NSString *)queryStringWithValuesAndKeys:(NSString *)firstValue, ...;
+ (NSString *)queryStringWithValuesAndKeys:(NSString *)firstValue list:(va_list)argumentList;
- (NSString *)queryStringByAppendingValue:(NSString *)value andKey:(NSString *)key;
- (NSString *)queryStringByAppendingQueryString:(NSString *)query;
@end
