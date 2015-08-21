//
//  MasterWeddingProfile.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "MasterWeddingProfile.h"
#import <Parse/PFObject+Subclass.h>

@implementation MasterWeddingProfile

@dynamic starterToDoTaskTimeCategories;
@dynamic starterTaskCategories;
@dynamic starterVendorCategories;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"MasterWeddingProfile";
}

@end
