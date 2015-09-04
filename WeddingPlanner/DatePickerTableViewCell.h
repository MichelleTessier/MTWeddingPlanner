//
//  DatePickerTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@protocol DatePickerTableViewCellDelegate;

@interface DatePickerTableViewCell : UITableViewCell <UIPickerViewDelegate>

@property (strong, nonatomic) UIDatePicker *pickerView;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) id<DatePickerTableViewCellDelegate> delegate;

@end

@protocol DatePickerTableViewCellDelegate <NSObject>

-(void)pickerSelectedDate:(NSDate *)date onCell:(DatePickerTableViewCell *)sender;

@end