//
//  VendorCategory.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface VendorCategory : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property NSString *title;
@property NSString *budgetTipForVendorCategory;
@property NSArray *vendors;
@property (retain) NSNumber *budgetedCost;
@property (retain) NSNumber *actualCategoryCost;


@end
