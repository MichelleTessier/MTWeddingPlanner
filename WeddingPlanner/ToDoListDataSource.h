//
//  ToDoListDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeddingController.h"

@interface ToDoListDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;

@end
