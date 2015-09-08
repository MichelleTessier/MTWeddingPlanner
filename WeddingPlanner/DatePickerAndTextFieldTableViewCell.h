//
//  DatePickerAndLabelTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/8/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerAndTextFieldTableViewCellDelegate;

@interface DatePickerAndTextFieldTableViewCell : UITableViewCell <UIPickerViewDelegate>

@property (strong, nonatomic) UIDatePicker *pickerView;
@property (strong, nonatomic) UITextField *pickerTextField;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) id<DatePickerAndTextFieldTableViewCellDelegate> delegate;

@end

@protocol DatePickerAndTextFieldTableViewCellDelegate <NSObject>

-(void)pickerSelectedDate:(NSDate *)date onCell:(DatePickerAndTextFieldTableViewCell *)sender;

@end