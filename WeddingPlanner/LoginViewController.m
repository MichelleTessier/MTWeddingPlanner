//
//  LoginViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LoginViewController.h"
#import "WeddingListViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *plannerButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 70, 100, 44)];
    [plannerButton setTitle:@"Planner" forState:UIControlStateNormal];
    [plannerButton setBackgroundColor:[UIColor purpleColor]];
    [plannerButton addTarget:self action:@selector(plannerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plannerButton];
    
    UIButton *clientButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 120, 100, 44)];
    [clientButton setTitle:@"Client" forState:UIControlStateNormal];
    [clientButton setBackgroundColor:[UIColor purpleColor]];
    [clientButton addTarget:self action:@selector(clientButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clientButton];
    
    
}

-(void)plannerButtonTapped{
    
    [self.navigationController pushViewController:[WeddingListViewController new] animated:YES];
    
}

-(void)clientButtonTapped{
    
    
    
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
