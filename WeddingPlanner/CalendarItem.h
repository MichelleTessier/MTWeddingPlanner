//
//  CalendarItem.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface CalendarItem : PFObject <PFSubclassing>

@property (retain) NSString *title;
@property (retain) NSDate *startingDate;
@property (retain) NSDate *endingDate;
@property (retain) NSArray *reminders;
@property (retain) NSString *location;
@property (retain) NSString *taskCategory;
@property (retain) Vendor *vendor;
@property (retain) VendorCategory *vendorCategory;
@property (retain) NSString *notes;

+(NSString *)parseClassName;

@end
