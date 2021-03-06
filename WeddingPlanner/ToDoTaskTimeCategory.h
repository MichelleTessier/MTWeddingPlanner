//
//  ToDoTaskTimeCategory.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface ToDoTaskTimeCategory : PFObject <PFSubclassing>

@property NSString *title;
@property NSArray *toDoItems;

+(NSString *)parseClassName;

@end
