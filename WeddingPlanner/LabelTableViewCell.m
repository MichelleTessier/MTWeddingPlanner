//
//  LabelTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/31/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LabelTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation LabelTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.label = [UILabel new];
        [self.contentView addSubview:self.label];
        [self.label alignTop:@"0" leading:@"15" bottom:@"0" trailing:@"-15" toView:self.contentView];
        
    }
    
    return self;
    
}

@end
