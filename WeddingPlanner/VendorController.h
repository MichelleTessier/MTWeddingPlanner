//
//  VendorController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/25/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vendor.h"

@interface VendorController : NSObject

+ (VendorController*)sharedInstance;

-(Vendor *)createVendor;

@property (strong, nonatomic) NSArray *vendors;
-(void)retrieveVendors;

-(void)deleteVendor:(Vendor *)vendorToDelete;

@end
