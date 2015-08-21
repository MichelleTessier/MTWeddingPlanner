//
//  ToDoTaskTimeCategory.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//


#import "ToDoTaskTimeCategory.h"
#import <Parse/PFObject+Subclass.h>

@implementation ToDoTaskTimeCategory

@dynamic title;
@dynamic toDoItems;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"ToDoTaskTimeCategory";
}

@end
