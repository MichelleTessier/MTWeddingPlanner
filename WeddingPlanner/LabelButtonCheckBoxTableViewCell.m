//
//  LabelAndIconTableViewCell.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LabelButtonCheckBoxTableViewCell.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@implementation LabelButtonCheckBoxTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //self.contentView
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.button = [UIButton new];
        [self.contentView addSubview:self.button];
        
        self.label = [UILabel new];
        self.label.numberOfLines = 0;
        [self.contentView addSubview:self.label];
        
        self.checkbox = [MPCheckBox new];
        [self.checkbox setCircular:YES];
        
        [self.contentView addSubview:self.checkbox];
        
        [self.checkbox alignLeadingEdgeWithView:self.contentView predicate:@"5"];
        [self.checkbox constrainWidth:@"20"];
        [self.checkbox constrainHeight:@"20"];
        [self.checkbox alignCenterYWithView:self.contentView predicate:nil];
        
        [self.button alignTrailingEdgeWithView:self.contentView predicate:@"5"];
        [self.button constrainWidth:@"44"];
        [self.button constrainHeight:@"44"];
        [self.button alignCenterYWithView:self.contentView predicate:nil];
        
        [self.label constrainLeadingSpaceToView:self.checkbox predicate:@"5"];
        [self.label alignTopEdgeWithView:self.contentView predicate:@"5"];
        [self.label alignBottomEdgeWithView:self.contentView predicate:@"5"];
        [self.label constrainTrailingSpaceToView:self.button predicate:@"5"];
        
    }
    
    return self;
    
}

-(void)updateToDoCellAtIndexPath: (NSIndexPath *)indexPath WithToDoItem: (ToDoItem *)toDoItem {
    
    if (toDoItem.plannerTip) {
        [self.button setBackgroundColor:[UIColor purpleColor]];
        [self.button setTitle:@"T" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(buttonWasTapped) forControlEvents:UIControlEventTouchUpInside];
        
    } else {
       
        [self.button setBackgroundColor:[UIColor clearColor]];
        
    }
    
    self.label.text = toDoItem.title;
    self.label.font = [UIFont systemFontOfSize:14];
    
    self.checkbox.identifier = [NSString stringWithFormat:@"%ld,%ld",(long)indexPath.section, (long)indexPath.row];
   
    self.checkbox.delegate = self;
    
    if (toDoItem.itemComplete == YES) {
        [self.checkbox setState:kMPCheckBoxStateChecked animated:YES];
    } else {
        [self.checkbox setState:kMPCheckBoxStateUnchecked animated:YES];
    }
    
}



-(void)buttonWasTapped{
    [self.delegate tipButtonTappedinSender:self];
}



-(void)mpCheckBoxDidChangeState:(kMPCheckBoxState)state checkBox:(MPCheckBox *)checkBox{
    [self.delegate checkBoxChangedState:state inCell:self];
}

@end
