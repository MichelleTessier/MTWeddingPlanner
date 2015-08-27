//
//  ClientTabBarController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Couple.h"

@interface ClientTabBarController : UITabBarController

- (instancetype)initWithToolBar;
@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) Couple *couple;

@end
