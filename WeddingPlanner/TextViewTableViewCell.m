//
//  TextViewTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "TextViewTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation TextViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.textView = [UITextView new];
        [self.textView constrainLeadingSpaceToView:self.contentView predicate:@"0"];
        [self.textView constrainTrailingSpaceToView:self.contentView predicate:@"0"];
        [self.textView constrainTopSpaceToView:self.contentView predicate:@"0"];
        [self.textView constrainBottomSpaceToView:self.contentView predicate:@"0"];
        [self.contentView addSubview:self.textView];
    }
    
    return self;
    
}

@end
