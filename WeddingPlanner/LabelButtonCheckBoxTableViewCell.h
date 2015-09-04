//
//  LabelAndIconTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/1/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCheckBox.h"
#import "ToDoItem.h"

@protocol LabelButtonCheckBoxTableViewCellDelegate;

@interface LabelButtonCheckBoxTableViewCell : UITableViewCell <MPCheckBoxDelegate>


@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) MPCheckBox *checkbox;
@property (weak, nonatomic) id <LabelButtonCheckBoxTableViewCellDelegate> delegate;

-(void)updateToDoCellAtIndexPath: (NSIndexPath *)indexPath WithToDoItem: (ToDoItem *)toDoItem;

@end

@protocol LabelButtonCheckBoxTableViewCellDelegate <NSObject>

-(void)tipButtonTappedinSender: (LabelButtonCheckBoxTableViewCell *)sender;
-(void)checkBoxChangedState:(kMPCheckBoxState)state inCell:(LabelButtonCheckBoxTableViewCell *)sender;

@end
