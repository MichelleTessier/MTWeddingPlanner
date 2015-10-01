//
//  RegisterWeddingPageViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "RegisterWeddingPageViewController.h"

@interface RegisterWeddingPageViewController () <UIGestureRecognizerDelegate, UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@end

@implementation RegisterWeddingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:kNilOptions];
    
    for (UIGestureRecognizer *gR in self.pageViewController.gestureRecognizers){
        gR.delegate = self;
    }
    
    self.pageViewController.dataSource = self;
    
    self.registerWeddingPage1VC = [RegisterWeddingPage1ViewController new];
    self.registerWeddingPage2VC = [RegisterWeddingPage2ViewController new];
    
    self.registerWeddingPage1VC.registerWeddingPage2VC = self.registerWeddingPage2VC;
    self.registerWeddingPage1VC.pageViewController = self.pageViewController;
    
    
    
    NSArray *viewControllers = @[self.registerWeddingPage1VC];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    [self.view addSubview:self.pageViewController.view];
    
  
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if (viewController == self.registerWeddingPage1VC) {
        return nil;
    } else {
        return self.registerWeddingPage1VC;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if (viewController == self.registerWeddingPage2VC) {
        return nil;
    } else {
        return self.registerWeddingPage2VC;
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
