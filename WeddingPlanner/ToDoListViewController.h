//
//  ToDoViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface ToDoListViewController : UIViewController <UITableViewDelegate>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UISwitch *archivedSwitch;

@end
