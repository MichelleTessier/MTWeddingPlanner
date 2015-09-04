//
//  DatePickerTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DatePickerTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"


@implementation DatePickerTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
        
        self.textField = [UITextField new];
        [self.contentView addSubview:self.textField];
        
        [self.pickerView addTarget:self action:@selector(pickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self.textField alignTop:@"0" leading:@"5" bottom:@"0" trailing:@"5" toView:self.contentView];
        
        self.textField.inputView = self.pickerView;
    }
    
    return self;
    
}

-(void)pickerValueChanged:(UIDatePicker *)sender{
    
    [self.delegate pickerSelectedDate:sender.date onCell:self];
    
}



@end
