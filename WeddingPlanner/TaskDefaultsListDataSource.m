//
//  TaskDefaultsListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TaskDefaultsListDataSource.h"

static NSString *taskDefaultCell = @"taskDefaultCell";

@implementation TaskDefaultsListDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:taskDefaultCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:taskDefaultCell];
    }
    
    cell.textLabel.text = @"Task Default";
    
    return cell;
}

@end
