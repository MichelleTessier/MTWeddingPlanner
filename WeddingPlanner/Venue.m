//
//  Venue.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Venue.h"
#import <Parse/PFObject+Subclass.h>

@implementation Venue

@dynamic name;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Venue";
}

@end
