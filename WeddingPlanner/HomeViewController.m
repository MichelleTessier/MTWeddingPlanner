//
//  ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Home";
    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-80);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
