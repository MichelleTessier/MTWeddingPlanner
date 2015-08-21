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

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Planner";
}

@end
