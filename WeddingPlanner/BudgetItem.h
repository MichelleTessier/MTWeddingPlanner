//
//  Budget.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "VendorCategory.h"

@interface BudgetItem : PFObject <PFSubclassing>

@property (retain) VendorCategory *vendorCategory;
@property (retain) NSNumber *budgetedCost;
@property (retain) NSNumber *actualCategoryCost;
@property (retain) NSArray *vendors;


+(NSString *)parseClassName;

@end
