//
//  Budget.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "BudgetItem.h"

@interface Budget : PFObject <PFSubclassing>

@property (retain) NSArray *budgetItems;
@property (retain) NSNumber *totalBudgetedCost;
@property (retain) NSNumber *totalActualCost;
@property (retain) NSNumber *totalPaid;
@property (retain) NSNumber *totalOutstandingBalance;

+(NSString *)parseClassName;

@end
