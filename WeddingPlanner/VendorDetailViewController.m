//
//  VendorDetailViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorDetailViewController.h"

@interface VendorDetailViewController ()

@end

@implementation VendorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
    self.view.backgroundColor = [UIColor cyanColor];
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
