//
//  CalendarWeekTableViewDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DateController.h"

@interface CalendarWeekTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;
@property (assign, nonatomic) NSInteger numberOfRows;

@end
