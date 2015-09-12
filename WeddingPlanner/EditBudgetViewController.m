//
//  EditBudgetViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "EditBudgetViewController.h"

@interface EditBudgetViewController ()

@end

@implementation EditBudgetViewController

#warning breaks if you try to push the page view controller past the last category

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Edit Budget";
    
    UIBarButtonItem *saveButton = [UIBarButtonItem new];
    saveButton.title = @"Save";
    saveButton.target = self;
    saveButton.action = @selector(saveButtonTapped);
    self.navigationItem.rightBarButtonItem = saveButton;
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:kNilOptions];
    
    self.pageViewController.dataSource = self;
    
    self.editBudgetIndividualPageVC = [[EditBudgetIndividualPageViewController alloc] initWithWedding:self.couple.wedding andIndex:0];
    
    
    NSArray *viewControllers = @[self.editBudgetIndividualPageVC];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    [self.view addSubview:self.pageViewController.view];
    
    
    
    
}

-(void)saveButtonTapped{
    
    [[WeddingController sharedInstance] findEstimatedCostForWedding:self.couple.wedding];
    [self.couple saveEventually];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(EditBudgetIndividualPageViewController *)VCForVendorCategory:(VendorCategory *)vendorCategory{
    
   NSInteger index = [self.couple.wedding.vendorCategories indexOfObjectIdenticalTo:vendorCategory];
    
    EditBudgetIndividualPageViewController *editBudgetIndividualPageVC = [[EditBudgetIndividualPageViewController alloc] initWithWedding:self.couple.wedding andIndex:index];
    
//    [self.editBudgetViewControllers addObject:editBudgetIndividualPageVC];
    
    return editBudgetIndividualPageVC;
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    EditBudgetIndividualPageViewController *editBudgetIndividualPageVC = (EditBudgetIndividualPageViewController *)viewController;
    
    [editBudgetIndividualPageVC updateVendorCategory];
    
    if (editBudgetIndividualPageVC.previousVendorCateogy) {
        return [self VCForVendorCategory:editBudgetIndividualPageVC.previousVendorCateogy];
    } else {
        return nil;
    }
 
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    EditBudgetIndividualPageViewController *editBudgetIndividualPageVC = (EditBudgetIndividualPageViewController *)viewController;
    
    [editBudgetIndividualPageVC updateVendorCategory];
    
    if (editBudgetIndividualPageVC.nextVendorCategory) {
        return [self VCForVendorCategory:editBudgetIndividualPageVC.nextVendorCategory];
    } else {
        return nil;
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
