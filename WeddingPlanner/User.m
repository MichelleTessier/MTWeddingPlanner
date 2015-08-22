//
//  User.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "User.h"
#import <parse/PFObject+Subclass.h>

@implementation User

@dynamic isPlanner;

+(void)load{
    [self registerSubclass];
}

@end
