//
//  SpouseA.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "SpouseA.h"
#import <Parse/PFObject+Subclass.h>

@implementation SpouseA

@dynamic phoneNumber;
@dynamic email;
@dynamic emergencyContact;


+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"SpouseA";
}

@end
