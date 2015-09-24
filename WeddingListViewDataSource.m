//
//  WeddingListViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "WeddingListViewDataSource.h"

static NSString *cellID = @"cellID";

@implementation WeddingListViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.planner.couples.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    Couple *couple = self.planner.couples[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat: @"%@ & %@", couple.spouse1FirstName, couple.spouse2FirstName];
    
    return cell;
    
}



@end
