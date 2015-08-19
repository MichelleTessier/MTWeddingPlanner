//
//  AddVendorScreen1ViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorScreen1ViewController.h"

#import "AddVendorScreen2ViewController.h"

@interface AddVendorScreen1ViewController ()

@end

@implementation AddVendorScreen1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    [self.view addSubview:navBar];
    
    UIBarButtonItem *nextScreenBarButton = [UIBarButtonItem new];
    nextScreenBarButton.title = @"Next";
    nextScreenBarButton.target = self;
    nextScreenBarButton.action = @selector(nextScreenBarButtonTapped);
    self.navigationItem.rightBarButtonItem = nextScreenBarButton;

}

-(void)nextScreenBarButtonTapped{
    [self.navigationController pushViewController:[AddVendorScreen2ViewController new] animated:YES];
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
