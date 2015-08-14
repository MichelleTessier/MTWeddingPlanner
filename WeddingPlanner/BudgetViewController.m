//
//  BudgetViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "BudgetViewController.h"

@interface BudgetViewController ()

@end

@implementation BudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-80);
   
   
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
