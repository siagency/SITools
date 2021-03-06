//
//  NSDate+SIATools.h
//  SIATools
//
//  Created by KUROSAKI Ryota on 2012/04/26.
//  Copyright (c) 2012-2015 SI Agency Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SIATools)

+ (NSDate *)sia_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                        hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
+ (NSDate *)sia_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                        hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
                    calendar:(NSCalendar *)calendar;

@property (nonatomic, readonly) NSDateComponents *sia_components;
- (NSDateComponents *)sia_componentsWithCalendar:(NSCalendar *)calendar;

@end
