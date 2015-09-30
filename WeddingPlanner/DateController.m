//
//  DateController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//
//open calendar tableview: go to today's date, set today as current date
//scroll calendar tableview: each cell needs to know it's date based on it's index path, but current date doesn't need to change
//select a cell: current date becomes date of cell selected
//flip through page views: current date goes up or down based on flipping through page view
//pop back to tableview: date in center is current date
//hit back button: current date and center date becomes today
//selected date property and today property

#import "DateController.h"

@implementation DateController

+ (DateController*)sharedInstance {
    static DateController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [DateController new];
        sharedInstance.startingRow = 730;
    });
    
    return sharedInstance;
}



-(void)setTodaysDate{
    
    NSDate *todaysDate = [NSDate date];
    self.today = [self getNoonDateForDate:todaysDate];
    self.selectedDate = self.today;
    
}



-(NSDate *)getDateForRow:(NSInteger)row{
    
    NSInteger secondsPerDay = 24 * 60 * 60;
    
    NSInteger daysSinceToday = row - self.startingRow;
    
    NSTimeInterval timeSinceLastDate = daysSinceToday * secondsPerDay;
    
    NSDate *dateForRow = [self.today dateByAddingTimeInterval: timeSinceLastDate];
    
    return dateForRow;
    
    
    
}



-(void)getTomorrowsDate{
    
    NSDate *today = self.selectedDate;
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    self.selectedDate = [today dateByAddingTimeInterval: secondsPerDay];
    
}



-(void)getYesterDaysDate{
    
    NSDate *today = self.selectedDate;
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    self.selectedDate = [today dateByAddingTimeInterval: -secondsPerDay];
    
}

-(NSDateComponents *)getDateComponentsForDate:(NSDate *)date{
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *comps = [currentCalendar components:unitFlags fromDate:date];
    
    return comps;
    
    
}

-(NSArray *)getCalendarItemsForDate:(NSDate *)date fromWedding:(Wedding *)wedding{
  
//NSArray *calendarItemsForDate = [wedding.calendarItems]
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [currentCalendar components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    NSDate *firstDate = [currentCalendar dateFromComponents:dateComponents];
    NSDate *secondDate = [NSDate dateWithTimeInterval:(24 * 60 * 60) sinceDate:firstDate];
                                        
    NSPredicate *firstPredicate = [NSPredicate predicateWithFormat:@"startingDate >= %@", firstDate];
    NSPredicate *secondPredicate = [NSPredicate predicateWithFormat:@"startingDate < %@", secondDate];
    
    NSPredicate *compoundPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[firstPredicate, secondPredicate]];
//    [calendarItemPredicate evaluateWithObject:date];
//    [NSPredicate predicateWithFormat:@"date == date"];
//    
//    NSArray *incompleteToDoItemsForCateogory = [toDoTimeCategory.toDoItems filteredArrayUsingPredicate:itemCompletePredicate];
    
    NSArray *filteredArray = [wedding.calendarItems filteredArrayUsingPredicate:compoundPredicate];
    
    return filteredArray;

}

-(CalendarItem *)createCalendarItemForWedding:(Wedding *)wedding{
    
    CalendarItem *calendarItem = [CalendarItem objectWithClassName:[CalendarItem parseClassName]];
    
    if (!wedding.calendarItems) {
        wedding.calendarItems = @[];
    }
    
    NSMutableArray *mutableCalendarItems = [wedding.calendarItems mutableCopy];
    
    [mutableCalendarItems addObject:calendarItem];
    
    wedding.calendarItems = mutableCalendarItems;
    
    return calendarItem;
    
    
}

-(NSDate *)getNoonDateForDate:(NSDate *)date{
    
    NSDate *startDate = date;
    
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *startComponents = [calendar components:(NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:startDate];
    
    [startComponents setHour: 12];
    [startComponents setMinute: 00];
    [startComponents setSecond: 00];
    
    return [calendar dateFromComponents:startComponents];
    
}



-(NSString *)getTimeFormatMonthDayHoursMinForDate:(NSDate *)date{
    
    NSDateComponents *dateComponents = [self getDateComponentsForDate:date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *monthName = [[dateFormatter shortMonthSymbols] objectAtIndex:(dateComponents.month - 1)];
    
    //Make sure minutes has 0 in front if less than 10
    
    NSString *hourMinString = [self getTimeFormatHoursMinForDate:date];
    
    return [NSString stringWithFormat: @"%@ %ld, %@", monthName, dateComponents.day, hourMinString];
    
}

-(NSString *)getTimeFormatHoursMinForDate:(NSDate *)date{
    
    NSDateComponents *dateComponents = [[DateController sharedInstance] getDateComponentsForDate:date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *minuteString = @"";
    
    if (dateComponents.minute < 10) {
        
        minuteString = [NSString stringWithFormat:@"0%ld", dateComponents.minute];
        
    } else {
        
        minuteString = [NSString stringWithFormat:@"%ld", dateComponents.minute];
        
    }
    
    //Make AM/PM time instead of military time
    
    NSString *hourString = @"";
    NSString *amOrPmString = @"";
    
    //if its the afternoon
    
    if (dateComponents.hour > 11) {
        
        //if its noon
        if (dateComponents.hour == 12 ) {
            
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour];
            amOrPmString = dateFormatter.PMSymbol;
            
            NSLog(@"%ld", dateComponents.hour);
            
            //else its 1pm or later
        } else {
            
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour - 12];
            amOrPmString = dateFormatter.PMSymbol;
            
            NSLog(@"%ld", dateComponents.hour);
            NSLog(@"%ld", dateComponents.hour - 12);
            
        }
        
        //else its the am
    } else {
        
        //if its midnight
        if (dateComponents.hour == 0) {
            
            hourString = [NSString stringWithFormat:@"%i", 12];
            amOrPmString = dateFormatter.AMSymbol;
            
            //else its past 1 am but before noon
        } else {
            
            hourString = [NSString stringWithFormat:@"%ld", dateComponents.hour];
            amOrPmString = dateFormatter.AMSymbol;
            
        }
        
    }
    
    return [NSString stringWithFormat: @"%@:%@ %@", hourString, minuteString, amOrPmString];
    
}



@end
