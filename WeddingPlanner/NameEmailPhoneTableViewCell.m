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
#import "AppearenceController.h"

@implementation NameEmailPhoneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        AppearenceController *appearenceController = [[AppearenceController alloc] init];
        
        self.businessNameLabel = [UILabel new];
        self.businessNameLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        self.businessNameLabel.text = @"Business Name";
        
        [self.contentView addSubview:self.businessNameLabel];
        
        self.contactNameLabel = [UILabel new];
        self.contactNameLabel.text = @"Contact Name";
        self.contactNameLabel.font = appearenceController.headerFont;
        [self.contentView addSubview:self.contactNameLabel];
        
        self.emailLabel = [UILabel new];
        self.emailLabel.text = @"Email";
        self.emailLabel.font = appearenceController.mediumSmallFont;
        [self.contentView addSubview:self.emailLabel];
        
        self.primaryPhoneLabel = [UILabel new];
        self.primaryPhoneLabel.text = @"Phone";
        self.primaryPhoneLabel.font = appearenceController.mediumSmallFont;
        [self.contentView addSubview:self.primaryPhoneLabel];
        
        [self.businessNameLabel alignTop:@"5" leading:@"15" toView:self.contentView];
        [self.businessNameLabel constrainHeightToView:self.contentView predicate:@"*0.5"];
        [self.businessNameLabel constrainWidthToView:self.contentView predicate:@"*0.6"];
        
        [self.emailLabel constrainTopSpaceToView:self.businessNameLabel predicate:@"5"];
        [self.emailLabel alignBottomEdgeWithView:self.contentView predicate:@"5"];
        [self.emailLabel alignLeadingEdgeWithView:self.contentView predicate:@"15"];
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
