//
//  CalendarWeekTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarWeekTableViewDataSource.h"

static NSString *dayCellID = @"dayCellID";

@implementation CalendarWeekTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //probably just need enough cells to cover the tableview?
    //maybe should insert and delete cells and then auto scroll to them?
    //should think about how fast I want the table view to scroll
    
    return 20;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dayCellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dayCellID];
    }
    
    cell.textLabel.text = @"Day";
    
    return cell;
}

@end
