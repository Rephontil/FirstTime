//
//  NSDate+ZYExtension.m
//  Sisters
//
//  Created by ZhouYong on 16/6/23.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "NSDate+ZYExtension.h"

@implementation NSDate (ZYExtension)

//比较self（ 当前的时间对象）和from的时间差值
- (NSDateComponents *)deltaFrom:(NSDate *)from
{
    //    当前日期
    NSCalendar *nowCalendar = [NSCalendar currentCalendar];
    //    返回先前时间距当前时间的对象，通过对象的属性获取每一个具体的时间
    return [nowCalendar components:NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:from toDate:self options:0];
}


/*
 *各种单位制格式枚举值
 */
/*
     NSCalendarUnitEra                = kCFCalendarUnitEra,
     NSCalendarUnitYear               = kCFCalendarUnitYear,
     NSCalendarUnitMonth              = kCFCalendarUnitMonth,
     NSCalendarUnitDay                = kCFCalendarUnitDay,
     NSCalendarUnitHour               = kCFCalendarUnitHour,
     NSCalendarUnitMinute             = kCFCalendarUnitMinute,
     NSCalendarUnitSecond             = kCFCalendarUnitSecond,
     NSCalendarUnitWeekday            = kCFCalendarUnitWeekday,
     NSCalendarUnitWeekdayOrdinal     = kCFCalendarUnitWeekdayOrdinal,
     NSCalendarUnitQuarter            NS_ENUM_AVAILABLE(10_6, 4_0) = kCFCalendarUnitQuarter,
     NSCalendarUnitWeekOfMonth        NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitWeekOfMonth,
     NSCalendarUnitWeekOfYear         NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitWeekOfYear,
     NSCalendarUnitYearForWeekOfYear  NS_ENUM_AVAILABLE(10_7, 5_0) = kCFCalendarUnitYearForWeekOfYear,
     NSCalendarUnitNanosecond         NS_ENUM_AVAILABLE(10_7, 5_0) = (1 << 15),
     NSCalendarUnitCalendar           NS_ENUM_AVAILABLE(10_7, 4_0) = (1 << 20),
     NSCalendarUnitTimeZone           NS_ENUM_AVAILABLE(10_7, 4_0) = (1 << 21),
     
     NSEraCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitEra instead") = NSCalendarUnitEra,
     NSYearCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitYear instead") = NSCalendarUnitYear,
     NSMonthCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitMonth instead") = NSCalendarUnitMonth,
     NSDayCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitDay instead") = NSCalendarUnitDay,
     NSHourCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitHour instead") = NSCalendarUnitHour,
     NSMinuteCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitMinute instead") = NSCalendarUnitMinute,
     NSSecondCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitSecond instead") = NSCalendarUnitSecond,
     NSWeekCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitWeekOfMonth or NSCalendarUnitWeekOfYear, depending on which you mean") = kCFCalendarUnitWeek,
     NSWeekdayCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitWeekday instead") = NSCalendarUnitWeekday,
     NSWeekdayOrdinalCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_4, 10_10, 2_0, 8_0, "Use NSCalendarUnitWeekdayOrdinal instead") = NSCalendarUnitWeekdayOrdinal,
     NSQuarterCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_6, 10_10, 4_0, 8_0, "Use NSCalendarUnitQuarter instead") = NSCalendarUnitQuarter,
     NSWeekOfMonthCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_7, 10_10, 5_0, 8_0, "Use NSCalendarUnitWeekOfMonth instead") = NSCalendarUnitWeekOfMonth,
     NSWeekOfYearCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_7, 10_10, 5_0, 8_0, "Use NSCalendarUnitWeekOfYear instead") = NSCalendarUnitWeekOfYear,
     NSYearForWeekOfYearCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_7, 10_10, 5_0, 8_0, "Use NSCalendarUnitYearForWeekOfYear instead") = NSCalendarUnitYearForWeekOfYear,
     NSCalendarCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_7, 10_10, 4_0, 8_0, "Use NSCalendarUnitCalendar instead") = NSCalendarUnitCalendar,
     NSTimeZoneCalendarUnit NS_CALENDAR_ENUM_DEPRECATED(10_7, 10_10, 4_0, 8_0, "Use NSCalendarUnitTimeZone instead") = NSCalendarUnitTimeZone,
 */
@end
