//
//  EditBudgetIndividualPageDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TextFieldTableViewCell.h"
#import "LabelTableViewCell.h"
#import "WeddingController.h"


typedef NS_ENUM(NSUInteger, BudgetInformationTypes) {
    BudgetInformationTypeVendorCategory,
    BudgetInformationTypeBudget,
    BudgetInformationTypeCount,
    
};

@interface EditBudgetIndividualPageDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) VendorCategory *vendorCategory;

@end
