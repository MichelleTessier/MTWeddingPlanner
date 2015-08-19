//
//  VendorsDetailDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorsDetailDataSource.h"

static NSString *vendorsDetailCell = @"vendorsDetailCell";

@implementation VendorsDetailDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorsDetailCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorsDetailCell];
    }
    
    cell.textLabel.text = @"Some Vendor Details";
    
    return cell;
    
}
@end
