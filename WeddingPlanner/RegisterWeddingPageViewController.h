//
//  RegisterWeddingPageViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterWeddingPage1ViewController.h"
#import "RegisterWeddingPage2ViewController.h"

@interface RegisterWeddingPageViewController : UIViewController

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) RegisterWeddingPage1ViewController *registerWeddingPage1VC;
@property (strong, nonatomic) RegisterWeddingPage2ViewController *registerWeddingPage2VC;

@end
