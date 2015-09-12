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
    
    self.today = [NSDate date];
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
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorianCalendar setLocale:[NSLocale currentLocale]];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay;
    NSDateComponents *comps = [gregorianCalendar components:unitFlags fromDate:date];
    
    return comps;
    
    
}

-(NSArray *)getCalendarItemsForDate:(NSDate *)date fromWedding:(Wedding *)wedding{
    
    
//NSArray *calendarItemsForDate = [wedding.calendarItems]
    
    NSPredicate *calendarItemPredicate = [NSPredicate predicateWithFormat:@"calendarItem.date like %@", date];
//    [calendarItemPredicate evaluateWithObject:date];
//    [NSPredicate predicateWithFormat:@"date == date"];
//    
//    NSArray *incompleteToDoItemsForCateogory = [toDoTimeCategory.toDoItems filteredArrayUsingPredicate:itemCompletePredicate];
    
    NSArray *filteredArray = [wedding.calendarItems filteredArrayUsingPredicate:calendarItemPredicate];
    
    return filteredArray;

}



@end
