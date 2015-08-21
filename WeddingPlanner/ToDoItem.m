//
//  ToDoItem.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoItem.h"
#import <Parse/PFObject+Subclass.h>

@implementation ToDoItem

@dynamic title;
@dynamic plannerTip;
@dynamic notes;
@dynamic taskCategory;
@dynamic dueDate;
@dynamic reminders;
@dynamic itemComplete;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"ToDoItem";
}

@end
