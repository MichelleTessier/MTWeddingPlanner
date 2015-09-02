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

#pragma mark - couple CRUD


-(Couple *)createCouplewithEmail:(NSString *)email andPassword:(NSString *)password{
    
    Couple *newCouple = (Couple *)[Couple object];
    [newCouple setIsPlanner:NO];
    [newCouple setUsername:email];
    [newCouple setPassword:password];
    [newCouple signUpInBackground];
    
    return newCouple;
    
}

-(void)retrieveCouples{
    PFQuery *getCouples = [Couple query];
    [getCouples findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.couples = results;
    }];
}

#pragma mark - wedding CRUD


-(Wedding *)createWeddingForCouple:(Couple *)couple{
    
    Wedding *wedding = [Wedding objectWithClassName:[Wedding parseClassName]];
    wedding.coupleID = couple.objectId;
    return wedding;
    
}

-(void)retrieveWeddings{
    PFQuery *getWeddings = [Wedding query];
    [getWeddings findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.weddings = results;
    }];
    
}


#pragma mark - Vendor CRUD

-(Vendor *)createVendorInCateogry:(VendorCategory *)selectedVendorCategory forWedding:(Wedding *)wedding{
    
    Vendor *vendor = [Vendor objectWithClassName:[Vendor parseClassName]];
    vendor.weddingID = wedding.objectId;
    
    for (VendorCategory *vendorCateogry in wedding.vendorCategories) {
        if ([vendorCateogry isEqual:selectedVendorCategory]) {
            NSMutableArray *mutableVendors = [vendorCateogry.vendors mutableCopy];
            [mutableVendors addObject:vendor];
            vendorCateogry.vendors = mutableVendors;
            [vendorCateogry saveInBackground];
        }
    }
    
    return vendor;
    
}

//-(void)retrieveVendorsforWedding:(Wedding *)wedding{
//    
//    PFQuery *getVendors = [Vendor query];
//    
//    [getVendors whereKey:@"weddingID" equalTo:wedding.objectId];
//    
//    [getVendors findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
//        wedding.vendors = results;
//    }];
//}

#pragma mark - vendorCategory CRUD

-(void)addVendorCategoriesFromPlanner:(Planner *)planner ToWedding:(Wedding *)wedding{
    
    //will add the correct vendor categories once I have that built
    //for now using JSON file
    wedding.vendorCategories = [self getVendorCategoriesForWedding:wedding];
    
}

-(NSArray *)getVendorCategoriesForWedding:(Wedding *)wedding{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WeddingConnectionsMasterWeddingProfile" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSArray *vendorCategoryTitles = [dictionary objectForKey:@"vendorCategories"];
    
    NSMutableArray *mutableVendorCategories = [NSMutableArray new];
    
    for (NSString *vendorCategoryTitle in vendorCategoryTitles) {
        VendorCategory *vendorCategory = [VendorCategory objectWithClassName:[VendorCategory parseClassName]];
        vendorCategory.title = vendorCategoryTitle;
        vendorCategory.vendors = @[];
        [vendorCategory saveEventually];
        [mutableVendorCategories addObject:vendorCategory];
    }
    
    NSArray *vendorCategories = mutableVendorCategories;
    
    return vendorCategories;
    
}

#pragma mark - toDoTimeCategory CRUD

-(void)addToDoTimeCategoriesFromPlanner:(Planner *)planner ToWedding:(Wedding *)wedding{
    
    wedding.toDoTimeCategories = [self getToDoTimeCategoriesForWedding:wedding];
}

-(NSArray *)getToDoTimeCategoriesForWedding:(Wedding *)wedding{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WeddingConnectionsMasterWeddingProfile" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSDictionary *toDoTimeCategoriesDict = [dictionary objectForKey:@"toDoTimeCategories"];
    
     NSMutableArray *mutableToDoTimeCategories = [NSMutableArray new];
    
    for (NSString *toDoTimeCategoryTitle in [toDoTimeCategoriesDict allKeys]) {
        ToDoTimeCategory *toDoTimeCategory = [ToDoTimeCategory objectWithClassName:[ToDoTimeCategory parseClassName]];
        toDoTimeCategory.title = toDoTimeCategoryTitle;
        toDoTimeCategory.toDoItems = [self getToDoItemsForTimeCategory:toDoTimeCategoryTitle FromDict:toDoTimeCategoriesDict];
        [mutableToDoTimeCategories addObject:toDoTimeCategory];
        [toDoTimeCategory saveEventually];
    
    }

    NSArray *toDoTimeCategories = mutableToDoTimeCategories;
    
    return toDoTimeCategories;
    
}

-(NSArray *)getToDoItemsForTimeCategory:(NSString *)toDoTimeCategoryTitle FromDict:(NSDictionary *)toDoTimeCategoriesDict{
    
    NSArray *toDoItems = toDoTimeCategoriesDict[toDoTimeCategoryTitle];
    NSMutableArray *mutableToDoItems = [NSMutableArray new];
    
    for (NSDictionary *toDoItemDictionary in toDoItems) {
        ToDoItem *toDoItem = [ToDoItem objectWithClassName:[ToDoItem parseClassName]];
        toDoItem.title = toDoItemDictionary[@"title"];
        toDoItem.plannerTip = toDoItemDictionary[@"tip"];
        [mutableToDoItems addObject:toDoItem];
        [toDoItem saveEventually];
    }
    
    toDoItems = mutableToDoItems;
    
    return toDoItems;
    
}



@end
