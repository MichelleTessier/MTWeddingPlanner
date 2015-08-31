//
//  VendorsViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/12/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendorsListDataSource.h"
#import "Couple.h"

@interface VendorsListViewController : UIViewController

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) NSArray *chosenVendorCategories;

@end
