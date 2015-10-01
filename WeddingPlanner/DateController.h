//
//  DateController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeddingController.h"


@interface DateController : NSObject

+ (DateController*)sharedInstance;

-(void)setTodaysDate;

-(NSDate *)getDateForRow:(NSInteger)row;

-(NSDateComponents *)getDateComponentsForDate:(NSDate *)date;

-(void)getTomorrowsDate;
-(void)getYesterDaysDate;

-(CalendarItem *)createCalendarItemForWedding:(Wedding *)wedding;

-(NSArray *)getCalendarItemsForDate:(NSDate *)date fromWedding:(Wedding *)wedding;

@property (assign, nonatomic) NSInteger startingRow;

@property (strong, nonatomic) NSDate *today;
@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) NSDateComponents *currentDateComponents;

-(NSString *)getTimeFormatMonthDayHoursMinForDate:(NSDate *)date;
-(NSString *)getTimeFormatHoursMinForDate:(NSDate *)date;
-(NSString *)getTimeFormatMonthDayForDate:(NSDate *)date;


@end
