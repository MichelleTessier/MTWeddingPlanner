//
//  VendorsDetailDataSource.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VendorViewControllerEnums.h"
#import "WeddingController.h"

@interface VendorsDetailDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) Vendor *vendor;
@property (strong, nonatomic) VendorCategory *vendorCategory;

@end
