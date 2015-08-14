//
//  CustomTabViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CustomTabViewController.h"

@interface CustomTabViewController ()

@end

@implementation CustomTabViewController

-(void)loadView{
    [super loadView];
    
    
    
    HomeViewController *homeVC = [HomeViewController new];
    
    TasksViewController *tasksVC = [TasksViewController new];
    
    VendorsListViewController *vendorsVC = [VendorsListViewController new];
    
    BudgetViewController *budgetVC = [BudgetViewController new];
    
    GuestsViewController *guestsVC = [GuestsViewController new];
    
    self.viewControllers = [[NSArray alloc] initWithObjects:homeVC, tasksVC, vendorsVC, budgetVC, guestsVC, nil];
    
    [self.view addSubview:homeVC.view];
    self.selectedViewController = homeVC;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 60, self.view.bounds.size.width, 44)];
    self.homeItem = [UITabBarItem new];
    self.homeItem.title = @"Home";
    self.tasksItem = [UITabBarItem new];
    self.tasksItem.title = @"Tasks";
    self.vendorsItem = [UITabBarItem new];
    self.vendorsItem.title = @"Vendors";
    self.budgetItem = [UITabBarItem new];
    self.budgetItem.title = @"Budget";
    self.guestsItem = [UITabBarItem new];
    self.guestsItem.title = @"Guests";
    
    NSArray *tabBarItems = [[NSArray alloc] initWithObjects:self.homeItem, self.tasksItem, self.vendorsItem, self.budgetItem, self.guestsItem, nil];
    
    self.tabBar.items = tabBarItems;
    self.tabBar.selectedItem = self.homeItem;
    self.tabBar.delegate = self;
    
    
    
    [self.view addSubview:self.tabBar];
    
}



-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item == self.homeItem) {
        
        UIViewController *homeVC = [self.viewControllers objectAtIndex:0];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:homeVC.view];
        self.selectedViewController = homeVC;
        
    } else if (item == self.tasksItem) {
        
        UIViewController *tasksVC = [self.viewControllers objectAtIndex:1];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:tasksVC.view];
        self.selectedViewController = tasksVC;
        
    } else if (item ==  self.vendorsItem){
        
        UIViewController *vendorsVC = [self.viewControllers objectAtIndex:2];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:vendorsVC.view];
        self.selectedViewController = vendorsVC;

    } else if (item == self.budgetItem){
        
        UIViewController *budgetVC = [self.viewControllers objectAtIndex:3];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:budgetVC.view];
        self.selectedViewController = budgetVC;
        
    } else if (item == self.guestsItem){
        
        UIViewController *guestsVC = [self.viewControllers objectAtIndex:4];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:guestsVC.view];
        self.selectedViewController = guestsVC;
        
    } else {
        
        UIViewController *homeVC = [self.viewControllers objectAtIndex:0];
        [self.selectedViewController.view removeFromSuperview];
        [self.view addSubview:homeVC.view];
        self.selectedViewController = homeVC;
        
    }
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
