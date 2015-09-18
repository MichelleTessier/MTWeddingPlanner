//
//  CalendarDayViewTableViewDataSource.h
//  WeddingPlanner
//
//  Created by Anne Tessier on 9/18/15.
//  Copyright © 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "DateController.h"

@interface CalendarDayViewTableViewDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSDate *today;

@end
