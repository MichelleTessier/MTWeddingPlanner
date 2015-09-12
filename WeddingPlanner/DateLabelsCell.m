//
//  DateLabelsCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/11/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "DateLabelsCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation DateLabelsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dateMonthLabel = [UILabel new];
        self.dateMonthLabel.numberOfLines = 2;
        self.dateMonthLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.dateMonthLabel];
        
        self.calendarItemsLabel = [UILabel new];
        
        [self.contentView addSubview:self.calendarItemsLabel];
        
        [self.dateMonthLabel alignLeadingEdgeWithView:self.contentView predicate:@"0"];
        [self.dateMonthLabel alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.dateMonthLabel alignBottomEdgeWithView:self.contentView predicate:@"0"];
        [self.dateMonthLabel constrainAspectRatio:@"*1"];
        
        [self.calendarItemsLabel constrainLeadingSpaceToView:self.dateMonthLabel predicate:@"15"];
        [self.calendarItemsLabel alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.calendarItemsLabel alignTopEdgeWithView:self.dateMonthLabel predicate:nil];
        [self.calendarItemsLabel alignBottomEdgeWithView:self.dateMonthLabel predicate:nil];
    }
    
    return self;
    
}

@end
