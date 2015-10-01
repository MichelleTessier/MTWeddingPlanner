//
//  DatePickerAndLabelTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/8/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DatePickerAndTextFieldTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface DatePickerAndTextFieldTableViewCell ()

@property (strong, nonatomic) NSDate *tempDate;

@end


@implementation DatePickerAndTextFieldTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        self.pickerView.datePickerMode = UIDatePickerModeDate;
   
        
        self.pickerTextField = [UITextField new];
        self.pickerTextField.placeholder = @"Date Due";
        [self.contentView addSubview:self.pickerTextField];
        
        self.textField = [UITextField new];
        self.textField.delegate = self;
        [self.contentView addSubview:self.textField];
        
        [self.pickerView addTarget:self action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self.pickerTextField alignLeadingEdgeWithView:self.contentView predicate:@"15"];
        [self.pickerTextField alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.pickerTextField alignBottomEdgeWithView:self.contentView predicate:@"0"];
        [self.pickerTextField constrainWidthToView:self.contentView predicate:@"*.4"];
        
        [self.textField constrainLeadingSpaceToView:self.pickerTextField predicate:@"-15"];
        [self.textField alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.textField alignTopEdgeWithView:self.pickerTextField predicate:nil];
        [self.textField alignBottomEdgeWithView:self.pickerTextField predicate:nil];
        
        self.pickerTextField.inputView = self.pickerView;
        
        UIToolbar *toolBar = [UIToolbar new];
        toolBar.frame = CGRectMake(0.0, 0.0, self.superview.frame.size.width, 40.0);
        UIBarButtonItem *doneButton = [UIBarButtonItem new];
        doneButton.title = @"Done";
        
        [doneButton setTarget:self];
        [doneButton setAction:@selector(doneButtonTapped)];
        
        NSArray *items = @[doneButton];
        
        [toolBar setItems:items];
        
        self.pickerTextField.inputAccessoryView = toolBar;
    }
    
    return self;
    
}

-(void)pickerValueChanged:(UIDatePicker *)sender{
    
    self.tempDate = sender.date;
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self.delegate textFieldWasEdited:textField onCell:self];
    
}

-(void)doneButtonTapped{
    
    [self.delegate pickerSelectedDate:self.tempDate onCell:self];
    [((UITableView *)self.superview.superview) reloadData];
    [self.pickerTextField resignFirstResponder];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
#warning need to get a decimal point in here somehow?

//    if ((textField.text.length >= 2) && (range.location == 2)) {
//        NSString *originalDigitString = [textField.text substringWithRange:NSMakeRange(range.location-1, 1)];
//        NSString *decimalString = @".";
//        decimalString = [decimalString stringByAppendingString:originalDigitString];
//        string = decimalString;
//        return YES;
//    }
    
    NSCharacterSet *invalidCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
    NSString *filteredString = [[string componentsSeparatedByCharactersInSet:invalidCharacterSet] componentsJoinedByString:@""];
    return [string isEqualToString:filteredString];
    
    
}


@end
