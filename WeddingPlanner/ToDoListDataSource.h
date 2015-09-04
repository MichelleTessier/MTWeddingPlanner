//
//  ToDoListDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeddingController.h"
#import "MPCheckBox.h"
#import "LabelButtonCheckBoxTableViewCell.h"

@interface ToDoListDataSource : NSObject <UITableViewDataSource, LabelButtonCheckBoxTableViewCellDelegate>

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSIndexPath *indexPathForTip;
@property (assign, nonatomic) BOOL isCurrentDataSource;

@end
