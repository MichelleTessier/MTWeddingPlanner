//
//  WeddingController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "WeddingController.h"


@interface WeddingController ()

@end

@implementation WeddingController

+(WeddingController*)sharedInstance {
    
    static WeddingController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeddingController new];
    });
   
    return sharedInstance;
}

-(Wedding *)createWedding{
    
    Wedding *wedding = [Wedding objectWithClassName:[Wedding parseClassName]];
    wedding.vendors = [NSArray new];
    wedding.vendorCategories = [self getVendorCategoriesForWedding:wedding];
    return wedding;
    
}

-(void)retrieveWeddings{
    PFQuery *getWeddings = [Wedding query];
    [getWeddings findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.weddings = results;
    }];
    
}


#pragma mark - Vendor CRUD

-(Vendor *)createVendorforWedding:(Wedding *)wedding{
    
    Vendor *vendor = [Vendor objectWithClassName:[Vendor parseClassName]];
    vendor.weddingID = wedding.objectId;
    
    NSMutableArray *mutableWeddings = [wedding.vendors mutableCopy];
    [mutableWeddings addObject:vendor];
    wedding.vendors = mutableWeddings;
    
    return vendor;
    
}

//How to I retreieve only the vendors that are attached to a specific wedding? Do I have to pull out the wedding first?
-(void)retrieveVendorsforWedding:(Wedding *)wedding{
    
    PFQuery *getVendors = [Vendor query];
    
    [getVendors whereKey:@"weddingID" equalTo:wedding.objectId];
    
    [getVendors findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        wedding.vendors = results;
    }];
}

-(NSArray *)getVendorCategoriesForWedding:(Wedding *)wedding{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WeddingConnectionsMasterWeddingProfile" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSArray *vendorCateogries = [dictionary objectForKey:@"vendorCategories"];
    
    return vendorCateogries;
    
}

@end
