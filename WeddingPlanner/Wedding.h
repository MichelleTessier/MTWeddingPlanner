//
//  Wedding.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "SpouseA.h"
#import "SpouseB.h"
#import "Venue.h"
#import "Planner.h"
#import "Budget.h"

@interface Wedding : PFObject <PFSubclassing>

@property (retain) SpouseA *spouseA;
@property (retain) SpouseB *spouseB;
@property (retain) UIImage *couplePhoto;
@property (retain) NSDate *date;
@property (retain) Venue *venue;
@property (retain) Planner *planner;
@property (retain) NSArray *guests;
@property (retain) NSArray *vendors;
@property (retain) Budget *budget;
@property (retain) NSArray *calendarItems;
@property (retain) NSArray *toDoItems;

+(NSString *)parseClassName;

@end
