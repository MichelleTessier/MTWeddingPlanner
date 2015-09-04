//
//  ToDoTaskTimeCategory.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//


#import "ToDoTimeCategory.h"
#import <Parse/PFObject+Subclass.h>

@implementation ToDoTimeCategory

@dynamic title;
@dynamic toDoItems;
@dynamic days;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"ToDoTimeCategory";
}

@end
