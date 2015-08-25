//
//  VendorCategoryPickerCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "PickerViewTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"


@implementation PickerViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.pickerView = [UIPickerView new];
        
        [self.contentView addSubview:self.pickerView];
        [self.pickerView constrainWidth:@"200" height:@"44"];
        [self.pickerView alignCenterYWithView:self.contentView predicate:@"0"];
        [self.pickerView alignCenterXWithView:self.contentView predicate:@"0"];
    }
    
    return self;
    
}





@end
