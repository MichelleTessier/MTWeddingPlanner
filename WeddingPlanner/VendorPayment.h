//
//  VendorPayment.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "CalendarItem.h"
#import "Vendor.h"

@interface VendorPayment : PFObject <PFSubclassing>

@property (retain) NSNumber *payment;
@property (retain) NSDate *date;
@property (retain) CalendarItem *calendarItem;
@property (retain) NSNumber *amountPaid;
@property (retain) NSNumber *outstandingBalance;
@property (retain) Vendor *vendor;

+(NSString *)parseClassName;

@end
