//
//  VendorDetailViewController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeddingController.h"

@interface VendorDetailViewController : UIViewController

@property (strong, nonatomic) Vendor *vendor;
@property (strong, nonatomic) VendorCategory *vendorCategory;

@end
