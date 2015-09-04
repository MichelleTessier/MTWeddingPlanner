//
//  EditBudgetIndividualPageViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface EditBudgetIndividualPageViewController : UIViewController

@property (strong, nonatomic) VendorCategory *currentVendorCategory;
@property (strong, nonatomic) VendorCategory *previousVendorCateogy;
@property (strong, nonatomic) VendorCategory *nextVendorCategory;

-(instancetype)initWithWedding:(Wedding *)wedding andIndex:(NSInteger)index;

@end
