//
//  TextViewTableViewCell.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextViewTableViewCellDelegate;

@interface TextViewTableViewCell : UITableViewCell <UITextViewDelegate>

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) id<TextViewTableViewCellDelegate> delegate;

@end

@protocol TextViewTableViewCellDelegate <NSObject>

-(void)textViewWillBeginEditing:(TextViewTableViewCell *)sender;
-(NSString *)textViewTextfromCell:(TextViewTableViewCell *)sender;


@end