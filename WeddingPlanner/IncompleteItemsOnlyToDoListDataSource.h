//
//  IncompleteItemsOnlyToDoListDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/2/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeddingController.h"
#import "MPCheckBox.h"

@interface IncompleteItemsOnlyToDoListDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSIndexPath *indexPathForTip;
@property (assign, nonatomic) BOOL isCurrentDataSource;

@end
