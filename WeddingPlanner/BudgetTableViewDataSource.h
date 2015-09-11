//
//  BudgetTableViewDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "QMBParallaxScrollViewController.h"

@interface BudgetTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSArray *selectedVendorCategories;

@end
