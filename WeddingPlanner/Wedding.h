//
//  Wedding.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Vendor.h"
#import "Budget.h"

@interface Wedding : PFObject <PFSubclassing>

@property (retain) NSString *coupleID;
@property (retain) NSDate *date;
@property (retain) Vendor *venue;
@property (retain) NSArray *guests;
@property (retain) Budget *budget;
@property (retain) NSArray *vendorCategories;
@property (retain) NSArray *calendarItems;
@property (retain) NSArray *toDoTimeCategories;


+(NSString *)parseClassName;

@end
