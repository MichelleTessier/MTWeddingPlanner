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

@implementation DatePickerAndTextFieldTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        
        self.pickerTextField = [UITextField new];
        [self.contentView addSubview:self.pickerTextField];
        
        self.textField = [UITextField new];
        [self.contentView addSubview:self.textField];
        
        [self.pickerView addTarget:self action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self.pickerTextField alignLeadingEdgeWithView:self.contentView predicate:@"0"];
        [self.pickerTextField alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.pickerTextField alignBottomEdgeWithView:self.contentView predicate:@"0"];
        [self.pickerTextField constrainWidthToView:self.contentView predicate:@"*.5"];
        
        [self.textField constrainLeadingSpaceToView:self.pickerTextField predicate:@"5"];
        [self.textField alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.textField alignTopEdgeWithView:self.pickerTextField predicate:nil];
        [self.textField alignBottomEdgeWithView:self.pickerTextField predicate:nil];
        
        
        
        
        self.pickerTextField.inputView = self.pickerView;
    }
    
    return self;
    
}

-(void)pickerValueChanged:(UIDatePicker *)sender{
    
    [self.delegate pickerSelectedDate:sender.date onCell:self];
    
}


@end
