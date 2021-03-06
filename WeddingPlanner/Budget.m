//
//  Budget.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//


#import "Budget.h"
#import <Parse/PFObject+Subclass.h>

@implementation Budget

@dynamic budgetItems;
@dynamic totalBudgetedCost;
@dynamic totalActualCost;
@dynamic totalPaid;
@dynamic totalOutstandingBalance;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Budget";
}

@end
