//
//  NameEmailPhoneTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "NameEmailPhoneTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation NameEmailPhoneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.businessNameLabel = [UILabel new];
        self.businessNameLabel.backgroundColor = [UIColor purpleColor];
        self.businessNameLabel.text = @"Business Name";
        
        [self.contentView addSubview:self.businessNameLabel];
        
        self.contactNameLabel = [UILabel new];
        self.contactNameLabel.backgroundColor = [UIColor redColor];
        self.contactNameLabel.text = @"Contact Name";
        [self.contentView addSubview:self.contactNameLabel];
        
        self.emailLabel = [UILabel new];
        self.contactNameLabel.backgroundColor = [UIColor blueColor];
        self.contactNameLabel.text = @"Email";
        [self.contentView addSubview:self.emailLabel];
        
        self.primaryPhoneLabel = [UILabel new];
        self.primaryPhoneLabel.backgroundColor = [UIColor lightGrayColor];
        self.primaryPhoneLabel.text = @"PHone";
        [self.contentView addSubview:self.primaryPhoneLabel];
        
        [self.businessNameLabel alignTop:@"5" leading:@"5" toView:self.contentView];
        [self.businessNameLabel constrainHeightToView:self.contentView predicate:@"*0.5"];
        [self.businessNameLabel constrainWidthToView:self.contentView predicate:@"*0.6"];
        
        [self.emailLabel constrainTopSpaceToView:self.businessNameLabel predicate:@"5"];
        [self.emailLabel alignBottomEdgeWithView:self.contentView predicate:@"5"];
        [self.emailLabel alignLeadingEdgeWithView:self.contentView predicate:@"5"];
        [self.emailLabel constrainWidthToView:self.businessNameLabel predicate:nil];
        
        [self.contactNameLabel alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.contactNameLabel alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.contactNameLabel constrainLeadingSpaceToView:self.businessNameLabel predicate:@"5"];
        [self.contactNameLabel constrainHeightToView:self.businessNameLabel predicate:nil];
        
        [self.primaryPhoneLabel constrainTopSpaceToView:self.contactNameLabel predicate:@"5"];
        [self.primaryPhoneLabel alignBottomEdgeWithView:self.contentView predicate:@"5"];
        [self.primaryPhoneLabel alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.primaryPhoneLabel constrainWidthToView:self.contactNameLabel predicate:nil];
        
        
    }
    
    return self;
    
}

@end
