//
//  Vendor.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Vendor.h"
#import <Parse/PFObject+Subclass.h>

@implementation Vendor

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Vendor";
}

@end
