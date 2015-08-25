//
//  Budget.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "BudgetItem.h"
#import <Parse/PFObject+Subclass.h>

@implementation BudgetItem

@dynamic vendorCategoryID;
@dynamic budgetedCost;
@dynamic actualCategoryCost;
@dynamic vendors;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"BudgetItem";
}

@end
