//
//  EditBudgetViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditBudgetIndividualPageViewController.h"
#import "WeddingController.h"

@interface EditBudgetViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) EditBudgetIndividualPageViewController *editBudgetIndividualPageVC;
@property (strong, nonatomic) NSMutableArray *editBudgetViewControllers;

@end
