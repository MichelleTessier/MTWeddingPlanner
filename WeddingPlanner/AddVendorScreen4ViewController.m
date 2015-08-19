//
//  AddVendorScreen4ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorScreen4ViewController.h"
#import "VendorsListViewController.h"

@interface AddVendorScreen4ViewController ()

@end

@implementation AddVendorScreen4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    [self.view addSubview:navBar];
    
    UIBarButtonItem *finishBarButton = [UIBarButtonItem new];
    finishBarButton.title = @"Finish";
    finishBarButton.target = self;
    finishBarButton.action = @selector(finishBarButtonTapped);
    self.navigationItem.rightBarButtonItem = finishBarButton;
    
}

-(void)finishBarButtonTapped{

    [self.navigationController popToRootViewControllerAnimated:YES];
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
