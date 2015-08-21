//
//  Planner.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Planner.h"
#import <Parse/PFObject+Subclass.h>

@implementation Planner

@dynamic businessName;
@dynamic weddings;
@dynamic masterWeddingProfiles;
@dynamic personalCalendarItems;

+(void)load{
    [self registerSubclass];
}


@end
