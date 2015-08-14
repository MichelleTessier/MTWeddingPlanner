//
//  CouplesListViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "WeddingListViewController.h"
#import "HomeViewController.h"
#import "TasksViewController.h"
#import "BudgetViewController.h"
#import "VendorsListViewController.h"
#import "GuestsViewController.h"

#import "ClientTabBarController.h"



@interface WeddingListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) WeddingListViewDataSource *datasource;
@property (strong, nonatomic) ClientTabBarController *clientTabBarController;

@end

@implementation WeddingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.datasource = [WeddingListViewDataSource new];
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    self.clientTabBarController = [[ClientTabBarController alloc] initWithToolBar];
    
    UIBarButtonItem *backToClientsButton = [UIBarButtonItem new];
    backToClientsButton.title = @"Back to clients";
    backToClientsButton.target = self;
    backToClientsButton.action = @selector(barButtonPressed);
    self.clientTabBarController.toolBar.items = @[backToClientsButton];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self presentViewController:self.clientTabBarController animated:YES completion:nil];
    
}

#pragma mark - UIBarButtonPressedMethod

-(void)barButtonPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
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
