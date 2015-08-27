//
//  RegisterWeddingViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterWeddingPage2ViewController.h"
#import "WeddingController.h"

//probably needs to have escape button if user accidentally clicks the wrong register as button

@interface RegisterWeddingPage1ViewController : UIViewController

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) Wedding *wedding;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) RegisterWeddingPage2ViewController *registerWeddingPage2VC;

@end
