//
//  CalendarWeekViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"

@interface CalendarWeekViewController : UIViewController

-(void)jumpToTodayButtonPushed;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSDate *today;
@property (strong, nonatomic) NSDate *selectedDay;
@property (assign, nonatomic) NSInteger numberOfRows;

@end
