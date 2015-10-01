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
    
//    PlannerProfileViewController *plannerProfileVC = [PlannerProfileViewController new];
//    plannerProfileVC.tabBarItem.title = @"Profile";
//    
//    DefaultsEditorViewController *defaultsEditorVC = [DefaultsEditorViewController new];
//    UINavigationController *defaultsEditorNavController = [[UINavigationController alloc] initWithRootViewController:defaultsEditorVC];
//    defaultsEditorVC.title = @"Defaults";
    
    AllClientsCalendarViewController *allClientsCalendarVC = [AllClientsCalendarViewController new];
    UINavigationController *allClientsCalendarNavController = [[UINavigationController alloc] initWithRootViewController:allClientsCalendarVC];
    allClientsCalendarVC.title = @"Calendar";
    
    UIImage *calImage = [UIImage imageNamed:@"tasks"];
    allClientsCalendarNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Calendar" image:calImage selectedImage:calImage];
    
    WeddingListViewController *weddingListVC = [WeddingListViewController new];
    weddingListVC.planner = self.planner;
   
    UINavigationController *weddingListNavController = [[UINavigationController alloc] initWithRootViewController:weddingListVC];
    
    UIImage *weddingIcon = [UIImage imageNamed:@"wedding"];
    
    weddingListNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Clients" image:weddingIcon selectedImage:weddingIcon];
    
    
    self.plannerTabBarController.viewControllers = @[allClientsCalendarNavController, weddingListNavController];
    
}

-(void)setUpClientTabBarController{
    
    if (self.plannerIsViewing == YES) {
        self.clientTabBarController = [[ClientTabBarController alloc] initWithToolBar];
    } else {
    self.clientTabBarController = [ClientTabBarController new];
    }
    
//    HomeViewController *homeVC = [HomeViewController new];
//    homeVC.title = @"Home";
//    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    homeVC.couple = self.couple;
    
    TasksViewController *tasksVC = [TasksViewController new];
    tasksVC.title = @"Tasks";
    tasksVC.couple = self.couple;
    UINavigationController *tasksNavController = [[UINavigationController alloc] initWithRootViewController:tasksVC];
    
    UIImage *tasksImage = [UIImage imageNamed:@"tasks"];
    tasksNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Calendar" image:tasksImage selectedImage:tasksImage];
    
    
    BudgetViewController *budgetVC = [BudgetViewController new];
    budgetVC.title = @"Budget";
    budgetVC.couple = self.couple;
    UINavigationController *budgetNavController = [[UINavigationController alloc] initWithRootViewController:budgetVC];
    
    UIImage *budgetImage = [UIImage imageNamed:@"budget"];
    budgetNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Budget" image:budgetImage selectedImage:budgetImage];
    
    VendorsListViewController *vendorsVC = [VendorsListViewController new];
    vendorsVC.title = @"Vendors";
    vendorsVC.couple = self.couple;
    
    UINavigationController *vendorsNavController = [[UINavigationController alloc] initWithRootViewController:vendorsVC];
    UIImage *vendorsImage = [UIImage imageNamed:@"vendors"];
    vendorsNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vendors" image:vendorsImage selectedImage:vendorsImage];
    
//    GuestsViewController *guestsVC = [GuestsViewController new];
//    guestsVC.tabBarItem.title = @"Guests";
    
    self.clientTabBarController.viewControllers = @[tasksNavController, budgetNavController, vendorsNavController];
}

@end
