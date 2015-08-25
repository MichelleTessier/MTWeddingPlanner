//
//  ToDoItem.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ToDoItem : PFObject <PFSubclassing>

@property (retain) NSString *title;
@property (retain) NSString *plannerTip;
@property (retain) NSString *notes;
@property (retain) NSString *taskCategory;
@property (retain) NSDate *dueDate;
//date that todo item will go onto calendar
@property (retain) NSArray *reminders;
@property (assign) BOOL itemComplete;
//is assign the right thing to use here?

+(NSString *)parseClassName;

@end

/*
 (title
*/