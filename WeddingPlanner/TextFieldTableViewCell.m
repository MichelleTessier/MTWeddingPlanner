//
//  TextFieldTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TextFieldTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation TextFieldTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.textField = [UITextField new];
        [self.textField constrainLeadingSpaceToView:self.contentView predicate:@"0"];
        [self.textField constrainTrailingSpaceToView:self.contentView predicate:@"0"];
        [self.textField constrainTopSpaceToView:self.contentView predicate:@"0"];
        [self.textField constrainBottomSpaceToView:self.contentView predicate:@"0"];
        [self.contentView addSubview:self.textField];
    }
    
    return self;
    
}

@end
