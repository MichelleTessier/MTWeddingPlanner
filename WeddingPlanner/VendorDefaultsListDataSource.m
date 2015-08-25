//
//  VendorDefaultsListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorDefaultsListDataSource.h"

static NSString *vendorDefaultCell = @"vendorDefaultCell";

@implementation VendorDefaultsListDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorDefaultCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorDefaultCell];
    }
    
    cell.textLabel.text = @"Vendor Default";
    
    return cell;
}

@end
