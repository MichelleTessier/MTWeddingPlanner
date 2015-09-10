//
//  BudgetViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "QMBParallaxScrollViewController.h"

@interface BudgetViewController : QMBParallaxScrollViewController <QMBParallaxScrollViewControllerDelegate>

@property (strong, nonatomic) Couple *couple;

@end
