//
//  CustomTabViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "TasksViewController.h"
#import "BudgetViewController.h"
#import "VendorsListViewController.h"
#import "GuestsViewController.h"

@interface CustomTabViewController : UIViewController <UITabBarDelegate>

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) UITabBar *tabBar;
@property (nonatomic, retain) UITabBarItem *homeItem;
@property (nonatomic, retain) UITabBarItem *tasksItem;
@property (nonatomic, retain) UITabBarItem *vendorsItem;
@property (nonatomic, retain) UITabBarItem *budgetItem;
@property (nonatomic, retain) UITabBarItem *guestsItem;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic, strong) UINavigationController *vendorsNavController;

@end
