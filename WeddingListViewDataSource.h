//
//  WeddingListViewDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PlannerController.h"

@interface WeddingListViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Planner *planner;

@end
