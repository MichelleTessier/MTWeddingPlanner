//
//  SpouseA.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Spouse.h"
#import <Parse/PFObject+Subclass.h>

@implementation Spouse

@dynamic emergencyContact;


+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Spouse";
}

@end
