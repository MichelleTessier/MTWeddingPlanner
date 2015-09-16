//
//  AddCalendarEventViewController.h
//  WeddingPlanner
//
//  Created by Anne Tessier on 9/16/15.
//  Copyright © 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "DateController.h"

@interface AddCalendarEventViewController : UIViewController

@property (strong, nonatomic) CalendarItem *calendarItem;
@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSDate *date;

@end
