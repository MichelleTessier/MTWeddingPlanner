//
//  DefaultsEditorViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskDefaultsViewController.h"
#import "VendorDefaultsViewController.h"

@interface DefaultsEditorViewController : UIViewController

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIViewController *currentViewController;

@end
