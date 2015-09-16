//
//  CalendarItem.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarItem.h"
#import <Parse/PFObject+Subclass.h>

@implementation CalendarItem

@dynamic title;
@dynamic startingDate;
@dynamic endingDate;
@dynamic reminders;
@dynamic location;
@dynamic taskCategory;
@dynamic vendor;
@dynamic vendorCategory;
@dynamic notes;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"CalendarItem";
}

@end
