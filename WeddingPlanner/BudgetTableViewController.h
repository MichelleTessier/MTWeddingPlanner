//
//  BudgetTableView.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "QMBParallaxScrollViewController.h"

@interface BudgetTableViewController : UIViewController <QMBParallaxScrollViewHolder, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end
