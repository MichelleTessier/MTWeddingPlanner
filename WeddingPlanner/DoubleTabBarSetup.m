//
//  DoubleTabBarSetup.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/27/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DoubleTabBarSetup.h"

@implementation DoubleTabBarSetup

-(void)setUpPlannerTabBarController{
    self.plannerTabBarController = [UITabBarController new];
    
    PlannerProfileViewController *plannerProfileVC = [PlannerProfileViewController new];
    plannerProfileVC.tabBarItem.title = @"Profile";
    
    DefaultsEditorViewController *defaultsEditorVC = [DefaultsEditorViewController new];
    UINavigationController *defaultsEditorNavController = [[UINavigationController alloc] initWithRootViewController:defaultsEditorVC];
    defaultsEditorVC.title = @"Defaults";
    
    AllClientsCalendarViewController *allClientsCalendarVC = [AllClientsCalendarViewController new];
    UINavigationController *allClientsCalendarNavController = [[UINavigationController alloc] initWithRootViewController:allClientsCalendarVC];
    allClientsCalendarVC.title = @"Calendar";
    
    WeddingListViewController *weddingListVC = [WeddingListViewController new];
    UINavigationController *weddingListNavController = [[UINavigationController alloc] initWithRootViewController:weddingListVC];
    weddingListVC.title = @"Weddings";
    
    self.plannerTabBarController.viewControllers = @[plannerProfileVC, defaultsEditorNavController, allClientsCalendarNavController, weddingListNavController];
    
}

-(void)setUpClientTabBarController{
    
    self.clientTabBarController = [ClientTabBarController new];
    
    HomeViewController *homeVC = [HomeViewController new];
    homeVC.title = @"Home";
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    TasksViewController *tasksVC = [TasksViewController new];
    tasksVC.title = @"Tasks";
    UINavigationController *tasksNavController = [[UINavigationController alloc] initWithRootViewController:tasksVC];
    
    BudgetViewController *budgetVC = [BudgetViewController new];
    budgetVC.title = @"Budget";
    UINavigationController *budgetNavController = [[UINavigationController alloc] initWithRootViewController:budgetVC];
    
    VendorsListViewController *vendorsVC = [VendorsListViewController new];
    vendorsVC.title = @"Vendors";
    
    UINavigationController *vendorsNavController = [[UINavigationController alloc] initWithRootViewController:vendorsVC];
    
    GuestsViewController *guestsVC = [GuestsViewController new];
    guestsVC.tabBarItem.title = @"Guests";
    
    self.clientTabBarController.viewControllers = @[homeNavController, tasksNavController, budgetNavController, vendorsNavController, guestsVC];
}

@end
