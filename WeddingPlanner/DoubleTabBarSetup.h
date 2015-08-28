//
//  DoubleTabBarSetup.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/27/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "PlannerProfileViewController.h"
#import "DefaultsEditorViewController.h"
#import "AllClientsCalendarViewController.h"
#import "WeddingListViewController.h"

#import "HomeViewController.h"
#import "TasksViewController.h"
#import "BudgetViewController.h"
#import "VendorsListViewController.h"
#import "GuestsViewController.h"

#import "ClientTabBarController.h"

#import "Couple.h"

@interface DoubleTabBarSetup : NSObject

-(void)setUpPlannerTabBarController;
-(void)setUpClientTabBarController;

@property (strong, nonatomic) UITabBarController *plannerTabBarController;
@property (strong, nonatomic) ClientTabBarController *clientTabBarController;
@property (strong, nonatomic) UIBarButtonItem *toolBarButton;
@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) Planner *planner;

@end
