//
//  DefaultsEditorViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DefaultsEditorViewController.h"


@interface DefaultsEditorViewController ()

@end

@implementation DefaultsEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tasks";
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems: @[@"Task Defaults", @"Vendor Defaults"]];
    self.segmentedControl.frame = CGRectMake(0, 64, self.view.frame.size.width, 44);
    
    
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    [self addChildViewController:selectedViewController];
    selectedViewController.view.frame = [self frameForCurrentViewController];
    if (selectedViewController == nil) {
        selectedViewController = [TaskDefaultsViewController new];
    }
    [self.view addSubview:selectedViewController.view];
    self.currentViewController = selectedViewController;
    
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
}



-(void)segmentedControlValueChanged:(UISegmentedControl *)sender{
    UIViewController *selectedViewController = [self viewControllerForSegmentIndex:self.segmentedControl.selectedSegmentIndex];
    [self addChildViewController:selectedViewController];
    [self transitionFromViewController:self.currentViewController toViewController:selectedViewController duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [self.currentViewController.view removeFromSuperview];
        selectedViewController.view.frame = [self frameForCurrentViewController];
        [self.view addSubview:selectedViewController.view];
    } completion:^(BOOL finished) {
        [selectedViewController didMoveToParentViewController:self];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = selectedViewController;
    }];
    self.navigationItem.title = selectedViewController.title;
}


-(UIViewController *)viewControllerForSegmentIndex:(NSInteger)index{
    UIViewController *viewController;
    switch (index) {
        case 0:
            viewController = [TaskDefaultsViewController new];
            break;
            
        case 1:
            viewController = [VendorDefaultsViewController new];
            break;
            
        default:
            viewController = [TaskDefaultsViewController new];
            break;
    }
    
    return viewController;
    
}


-(CGRect)frameForCurrentViewController{
    CGRect boundingRect = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 200);
    return boundingRect;
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
