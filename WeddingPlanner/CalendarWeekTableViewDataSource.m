//
//  CalendarWeekTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarWeekTableViewDataSource.h"
#import "DateLabelsCell.h"

static NSString *dayCellID = @"dayCellID";

@implementation CalendarWeekTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //probably just need enough cells to cover the tableview?
    //maybe should insert and delete cells and then auto scroll to them?
    //should think about how fast I want the table view to scroll
    
    return self.numberOfRows;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DateLabelsCell *cell = [tableView dequeueReusableCellWithIdentifier:dayCellID];
    
    if (!cell) {
        cell = [[DateLabelsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dayCellID];
    }
    
    NSDate *dateForRow = [[DateController sharedInstance] getDateForRow:indexPath.row];
    
    NSArray *calendarItems = [[DateController sharedInstance] getCalendarItemsForDate:dateForRow fromWedding:self.couple.wedding];
    
    //Get the calendar items for the date
    
    NSString *calendarItemString = @"";
    
    for (CalendarItem *calendarItem in calendarItems) {
        
        NSString *timeStringForCalItem =  [[DateController sharedInstance] getTimeFormatHoursMinForDate:calendarItem.startingDate];
       
        calendarItemString = [calendarItemString stringByAppendingString:[NSString stringWithFormat:@"%@ %@\n", timeStringForCalItem, calendarItem.title]];
    }
    
    cell.calendarItemsLabel.text = calendarItemString;
    
    NSDateComponents *dateComponents = [[DateController sharedInstance] getDateComponentsForDate:dateForRow];
   
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *weekDayName = [[dateFormatter shortWeekdaySymbols] objectAtIndex:(dateComponents.weekday - 1)];
    
    cell.dateMonthLabel.text = [NSString stringWithFormat:@"%@ \n %ld", weekDayName, dateComponents.day];
    
    return cell;
}

@end
