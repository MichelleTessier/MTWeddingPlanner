//
//  CalendarDayViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface CalendarDayViewController : UIViewController

@property (strong, nonatomic) NSDate *today;

//might not need these
@property (strong, nonatomic) NSDate *yesterday;
@property (strong, nonatomic) NSDate *tomorrow;

-(instancetype)initWithDate:(NSDate *)todaysDate;

//-(void)updateVendorCategory;

@end
