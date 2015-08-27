//
//  VendorsListDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorsListDataSource.h"
#import "NameEmailPhoneTableViewCell.h"


static NSString *vendorListCell = @"vendorListCell";

@implementation VendorsListDataSource

-(NSArray *)chosenVendorCategories{
    
    NSArray *array = @[@1];
    
    return array;
//    Wedding *wedding = [[WeddingController sharedInstance] createWedding];
//    NSArray *vendorCategories = wedding.vendorCategories;
//    NSMutableArray *mutableChosenVendorCategories = [NSMutableArray new];
//    for (VendorCategory *vendorCateogry in vendorCategories) {
//        if (!(vendorCateogry.vendors.count == 0)) {
//            [mutableChosenVendorCategories addObject:vendorCateogry];
//        }
//    }
//    
//    NSArray *chosenVendorCategories = mutableChosenVendorCategories;
//    
//    return chosenVendorCategories;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSArray *chosenVendorCategories = [self chosenVendorCategories];
    
    return chosenVendorCategories.count;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray *chosenVendorCategories = [self chosenVendorCategories];
    
    VendorCategory *vendorCategory = chosenVendorCategories[section];
    
    return vendorCategory.title;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *chosenVendorCategories = [self chosenVendorCategories];
    
    VendorCategory *vendorCategory = chosenVendorCategories[section];
    
    return vendorCategory.vendors.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NameEmailPhoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:vendorListCell];
    
    if (!cell) {
        cell = [[NameEmailPhoneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vendorListCell];
    }
    
    NSArray *chosenVendorCategories = [self chosenVendorCategories];
    
    VendorCategory *vendorCategory = chosenVendorCategories[indexPath.section];
    
    Vendor *vendor = vendorCategory.vendors[indexPath.row];
    
    cell.businessNameLabel.text = vendor.businessName;
    cell.contactNameLabel.text = vendor.firstName;
    cell.emailLabel.text = vendor.email;
    cell.primaryPhoneLabel.text = vendor.phoneNumber;
    
    return cell;
}

@end
