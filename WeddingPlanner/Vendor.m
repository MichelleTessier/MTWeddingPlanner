//
//  Vendor.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Vendor.h"
#import <Parse/PFObject+Subclass.h>

@implementation Vendor

@dynamic businessName;
@dynamic vendorCategory;
@dynamic vendorContractImages;
@dynamic totalCost;
@dynamic vendorPayments;
@dynamic images;
@dynamic notes;

//V1.2

@dynamic isPhysicalGood;
@dynamic isDelivery;
@dynamic isRental;
@dynamic arrivalOrPickupTime;
@dynamic departureOrReturnTime;


+(void)load{
    [self registerSubclass];
}



@end
