//
//  ToDoDetailDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/2/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeddingController.h"
#import "TextViewTableViewCell.h"
#import "DatePickerTableViewCell.h"

typedef NS_ENUM(NSUInteger, ToDoInformationTypes) {
    ToDoInformationTypeTitle,
    ToDoInformationTypeNotes,
    ToDoInformationTypeDueDate,
    ToDoInformationTypesCount,
    
};

@protocol ToDoDataSourceDelegate;

@interface ToDoDetailDataSource : NSObject <UITableViewDataSource, TextViewTableViewCellDelegate, DatePickerTableViewCellDelegate>

@property (strong, nonatomic) ToDoItem *toDoItem;
@property (strong, nonatomic) id<ToDoDataSourceDelegate> delegate;

@end

@protocol ToDoDataSourceDelegate <NSObject>

-(void)updateToDoItem:(ToDoItem *)toDoItem;

@end
