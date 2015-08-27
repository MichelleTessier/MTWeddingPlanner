//
//  TempLoginViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TempLoginViewController.h"
#import <UIKit/UIKit.h>

#import "WeddingListViewController.h"
#import "ClientTabBarController.h"

#import "PlannerProfileViewController.h"
#import "DefaultsEditorViewController.h"
#import "AllClientsCalendarViewController.h"
#import "WeddingListViewController.h"

#import "HomeViewController.h"
#import "TasksViewController.h"
#import "BudgetViewController.h"
#import "VendorsListViewController.h"
#import "GuestsViewController.h"

#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#import "Guest.h"
#import "User.h"

@interface TempLoginViewController ()

@property (strong, nonatomic) UITabBarController *plannerTabBarController;
@property (strong, nonatomic) ClientTabBarController *clientTabBarController;
@property (strong, nonatomic) UIBarButtonItem *toolBarButton;


@end

@implementation TempLoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //    testObject[@"foo"] = @"bar";
    //    [testObject saveInBackground];
    //
    //    Guest *guest = [Guest objectWithClassName:[Guest parseClassName]];
    //    guest.firstName = @"I worked!";
    //    guest.roleInWeddingParty = @"So proud!";
    //
    //    [guest saveInBackground];
    //
    //    User *user = [User user];
    //    user.username = @"mtessier";
    //    user.password = @"password";
    //    user.email = @"anne.m.tessier@gmail.com";
    //
    //    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    //        if (!error) {
    //            // Hooray! Let them use the app now.
    //        } else {
    //            NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
    //        }
    //
    //    }];
    
    
    UIButton *plannerButton = [UIButton new];
    [plannerButton setTitle:@"Planner" forState:UIControlStateNormal];
    [plannerButton setBackgroundColor:[UIColor purpleColor]];
    [plannerButton addTarget:self action:@selector(plannerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plannerButton];
    
    UIButton *clientButton = [UIButton new];
    [clientButton setTitle:@"Client" forState:UIControlStateNormal];
    [clientButton setBackgroundColor:[UIColor purpleColor]];
    [clientButton addTarget:self action:@selector(clientButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clientButton];
    
    [clientButton alignTopEdgeWithView:self.view predicate:@"100"];
    [clientButton alignCenterXWithView:self.view predicate:@"0"];
    [clientButton constrainWidth:@"200" height:@"44"];
    [plannerButton alignTopEdgeWithView:clientButton predicate:@"50"];
    [plannerButton alignCenterXWithView:self.view predicate:@"0"];
    [plannerButton constrainWidth:@"200" height:@"44"];
    
    
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

-(void)plannerButtonTapped{
    
    [self presentViewController:self.plannerTabBarController animated:YES completion:nil];
    
}

-(void)clientButtonTapped{
    
    self.toolBarButton.title = @"Couples Names";
    [self presentViewController:self.clientTabBarController animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end