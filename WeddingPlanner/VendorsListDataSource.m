//
//  VendorsListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorsListDataSource.h"

static NSString *vendorCell = @"vendorCell";

@implementation VendorsListDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorCell];
    }
    
    cell.textLabel.text = @"Vendor";
    
    return cell;
}

@end
