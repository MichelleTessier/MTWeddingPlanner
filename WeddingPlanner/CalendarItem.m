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

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"CalendarItem";
}

@end
