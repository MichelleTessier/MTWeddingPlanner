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
        [self.contentView addSubview:self.textField];
        [self.textField alignTop:@"0" leading:@"5" bottom:@"0" trailing:@"5" toView:self.contentView];
        
    }
    
    return self;
    
}

@end
