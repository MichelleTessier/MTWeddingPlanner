//
//  VendorCategory.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//


#import "VendorCategory.h"
#import <Parse/PFObject+Subclass.h>

@implementation VendorCategory

@dynamic title;
@dynamic budgetTipForVendorCategory;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"VendorCategory";
}

@end
