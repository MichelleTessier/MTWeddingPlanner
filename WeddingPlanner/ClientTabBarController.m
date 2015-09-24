//
//  ClientTabBarController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ClientTabBarController.h"

@interface ClientTabBarController ()

@end

@implementation ClientTabBarController

- (instancetype)initWithToolBar;
{
    self = [super init];
    if (self) {
        self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height -100, self.view.bounds.size.width, 44)];
        [self.view addSubview:self.toolBar];
        
        UIBarButtonItem *backToClientsButton = [UIBarButtonItem new];
        backToClientsButton.title = @"Back to clients";
        backToClientsButton.target = self;
        backToClientsButton.action = @selector(barButtonPressed);
        self.toolBar.items = @[backToClientsButton];
        
    }
    return self;
}

-(void)barButtonPressed{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
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
