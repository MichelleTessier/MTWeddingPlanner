//
//  CalendarDayViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "DateController.h"
#import "CalendarPageViewController.h"

@interface CalendarDayViewController : UIViewController 

-(instancetype)initWithDate:(NSDate *)date andCouple:(Couple *)couple;

@property (strong, nonatomic) NSDate *today;


@end


