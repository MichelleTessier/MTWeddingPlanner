//
//  WeddingController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wedding.h"
#import "VendorCategory.h"
#import "Couple.h"
#import "Planner.h"
#import "ToDoTimeCategory.h"
#import "ToDoItem.h"
#import "VendorPayment.h"

@interface WeddingController : NSObject

+(WeddingController*)sharedInstance;



-(Couple *)createCouplewithEmail:(NSString *)email andPassword:(NSString *)password;

@property (nonatomic, strong) NSArray *couples;

-(void)retrieveCouples;

-(void)deleteCouple:(Couple *)coupleToDelete;



-(Wedding *)createWeddingForCouple:(Couple *)couple;

@property (nonatomic, strong) NSArray *weddings;

-(void)retrieveWeddings;

-(void)deleteWedding:(Wedding *)weddingToDelete;




-(Vendor *)createVendorInCateogry:(VendorCategory *)selectedVendorCategory forWedding:(Wedding *)wedding;

@property (strong, nonatomic) NSArray *vendors;
-(void)retrieveVendors;

-(void)deleteVendor:(Vendor *)vendorToDelete;



-(void)addVendorCategoriesFromPlanner:(Planner *)planner ToWedding:(Wedding*)wedding;

-(void)addToDoTimeCategoriesFromPlanner:(Planner *)planner ToWedding:(Wedding *)wedding;



-(VendorPayment *)createVendorPayment;
-(void)addVendorPayments:(NSArray *)vendorPayments toVendor:(Vendor *)vendor;

@end

