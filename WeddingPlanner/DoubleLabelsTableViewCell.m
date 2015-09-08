//
//  DoubleLabelsTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/8/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DoubleLabelsTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation DoubleLabelsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.label1 = [UILabel new];
        [self.contentView addSubview:self.label1];
        
        self.label2 = [UILabel new];
        [self.contentView addSubview:self.label2];

        [self.label1 alignLeadingEdgeWithView:self.contentView predicate:@"0"];
        [self.label1 alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.label1 alignBottomEdgeWithView:self.contentView predicate:@"0"];
        [self.label1 constrainWidthToView:self.contentView predicate:@"*.5"];
        
        [self.label2 constrainLeadingSpaceToView:self.label1 predicate:@"5"];
        [self.label2 alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.label2 alignTopEdgeWithView:self.label1 predicate:nil];
        [self.label2 alignBottomEdgeWithView:self.label1 predicate:nil];
    }
    
    return self;
    
}

@end
