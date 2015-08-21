//
//  Wedding.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Wedding.h"
#import <Parse/PFObject+Subclass.h>

@implementation Wedding

@dynamic couple;
@dynamic couplePhoto;
@dynamic date;
@dynamic venue;
@dynamic planner;
@dynamic guests;
@dynamic vendors;
@dynamic budget;
@dynamic calendarItems;
@dynamic toDoTaskTimeCategories;


+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Wedding";
}

@end
