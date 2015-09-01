//
//  LabelAndIconTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LabelAndIconTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation LabelAndIconTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.label = [UILabel new];
        self.label.numberOfLines = 0;
        [self.contentView addSubview:self.label];
        [self.label alignTop:@"0" leading:@"5" bottom:@"0" trailing:@"5" toView:self.contentView];
        
    }
    
    return self;
    
}

@end
