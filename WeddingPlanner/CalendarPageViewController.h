//
//  CalendarViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "DateController.h"

@interface CalendarPageViewController : UIViewController

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray *editBudgetViewControllers;

@end

