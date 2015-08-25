//
//  WeddingController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wedding.h"
#import "Vendor.h"

@interface WeddingController : NSObject

+(WeddingController*)sharedInstance;

-(Wedding *)createWedding;

@property (nonatomic, strong) NSArray *weddings;

-(void)retrieveWeddings;

-(void)deleteWedding:(Wedding *)weddingToDelete;

-(Vendor *)createVendorforWedding:(Wedding *)wedding;


@property (strong, nonatomic) NSArray *vendors;
-(void)retrieveVendors;

-(void)deleteVendor:(Vendor *)vendorToDelete;


@end

