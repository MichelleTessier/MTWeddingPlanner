//
//  Vendor.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Person.h"
#import "VendorCategory.h"

@interface Vendor : Person <PFSubclassing>

//V1
@property (retain) NSString *businessName;
@property (retain) VendorCategory *vendorCategory;
@property (retain) NSArray *vendorContractImages;
@property (retain) NSNumber *totalCost;
@property (retain) NSArray *vendorPayments;
@property (retain) NSArray *images;
@property (retain) NSString *notes;
@property (retain) NSString *weddingID;

//V1.2

//would some of these BOOLS be better as enums?
@property (assign) BOOL isPhysicalGood;
@property (assign) BOOL isDelivery;
@property (assign) BOOL isRental;
@property (retain) NSDate *arrivalOrPickupTime;
@property (retain) NSDate *departureOrReturnTime;

+(NSString *)parseClassName;

@end
