//
//  BudgetTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "BudgetTableViewDataSource.h"
#import "DoubleLabelsTableViewCell.h"

static NSString *vendorBudgetCellID = @"vendorBudgetCellID";

@implementation BudgetTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.selectedVendorCategories.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    VendorCategory *vendorCategory = self.selectedVendorCategories[section];
    return vendorCategory.vendors.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VendorCategory *vendorCategory = self.selectedVendorCategories[indexPath.section];
    Vendor *vendor = vendorCategory.vendors[indexPath.row];
    
    DoubleLabelsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorBudgetCellID];
    
    if (!cell) {
        cell = [[DoubleLabelsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorBudgetCellID];
    }
    
    if (vendor.businessName) {
        cell.label1.text = vendor.businessName;
    } else {
        cell.label1.text = vendor.firstName;
    }
    
    float vendorCost = [vendor.totalCost floatValue];
    
    cell.label2.text = [NSString stringWithFormat:@"$%.2f", vendorCost];
    
    return cell;
    
}



@end
