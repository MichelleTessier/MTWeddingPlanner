//
//  CalendarDayViewTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Anne Tessier on 9/18/15.
//  Copyright © 2015 MichelleTessier. All rights reserved.
//

#import "CalendarDayViewTableViewDataSource.h"

static NSString *calendarItemcellID = @"CalendarItemCellID";

@implementation CalendarDayViewTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    return [[DateController sharedInstance] getCalendarItemsForDate:self.today fromWedding:self.couple.wedding].count + 1;
    return 25;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:calendarItemcellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:calendarItemcellID];
    }
    
    cell.backgroundColor = [UIColor purpleColor];
//    NSArray *calendarItems = [[DateController sharedInstance] getCalendarItemsForDate:self.today fromWedding:self.couple.wedding];
//    
//    CalendarItem *calendarItem = calendarItems[indexPath.row];
//    
//    cell.textLabel.text = calendarItem.title;
    
    cell.textLabel.text = @"Calendar event";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
    
    
}

@end
