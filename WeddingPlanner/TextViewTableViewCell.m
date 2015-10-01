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
        self.textView.delegate = self;
        [self.contentView addSubview:self.textView];
       [self.textView alignTop:@"0" leading:@"15" bottom:@"0" trailing:@"-15" toView:self.contentView];
        
    }
    
    return self;
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    [self.delegate textViewWillBeginEditing:self];
    return YES;
}


@end
