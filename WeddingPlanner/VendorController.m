//
//  VendorController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/25/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorController.h"

@implementation VendorController

+ (VendorController*)sharedInstance {
    static VendorController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [VendorController new];
    });
   
    return sharedInstance;
}

-(Vendor *)createVendor{
    Vendor *vendor = [Vendor objectWithClassName:[Vendor parseClassName]];
    return vendor;
}

-(void)retrieveVendors{
    PFQuery *getVendors = [Vendor query];
    [getVendors findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.vendors = results;
    }];
}

@end
