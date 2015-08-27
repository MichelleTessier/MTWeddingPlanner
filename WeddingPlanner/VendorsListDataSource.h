//
//  VendorsListDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/14/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface VendorsListDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Couple *couple;

@end
