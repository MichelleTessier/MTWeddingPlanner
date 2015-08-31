//
//  TextFieldTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldTableViewCellDelegate;

@interface TextFieldTableViewCell : UITableViewCell

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) id<TextFieldTableViewCellDelegate> delegate;
@property (strong, nonatomic) NSString *name;

@end

@protocol TextFieldTableViewCellDelegate <NSObject>

-(NSString *)textFieldTextfromCell:(TextFieldTableViewCell *)sender;

@end
