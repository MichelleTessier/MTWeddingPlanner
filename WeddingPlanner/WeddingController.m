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
    vendor.vendorPayments = @[];
    
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
        toDoItem.itemComplete = NO;
        [mutableToDoItems addObject:toDoItem];
        [toDoItem saveEventually];
    }
    
    toDoItems = mutableToDoItems;
    
    return toDoItems;
    
}

#pragma mark - vendor payment CRUD

-(VendorPayment *)createVendorPayment{
    
    VendorPayment *vendorPayment = [VendorPayment objectWithClassName:[VendorPayment parseClassName]];
    
    [vendorPayment saveEventually];
    
    return vendorPayment;
   
}

-(void)addVendorPayments:(NSArray *)vendorPayments toVendor:(Vendor *)vendor{
    
    NSMutableArray *mutableVendorPayments = [vendor.vendorPayments mutableCopy];
    
    for (VendorPayment *vendorPayment in vendorPayments) {
        
        [mutableVendorPayments addObject:vendorPayment];
        
        [vendorPayment saveEventually];
    }
    
    vendor.vendorPayments = mutableVendorPayments;
    
    if (!vendor.totalCost) {
        vendor.totalCost = @(0);
    }
        
    float actualCost = [vendor.totalCost floatValue];
    
    for (VendorPayment *vendorPayment in vendor.vendorPayments) {
        
        NSNumber *vendorPaymentAmount = vendorPayment.amount;
        float vendorPaymentFloatAmount = [vendorPaymentAmount floatValue];
        actualCost += vendorPaymentFloatAmount;
    }
    
    vendor.totalCost = @(actualCost);

    
    [vendor saveEventually];
}

#pragma mark - budget calculation methods

-(void)findActualCostForVendorCategory:(VendorCategory *)vendorCategory{
    
    float categoryTotalCost = 0;
    
    for (Vendor *vendor in vendorCategory.vendors) {
        
        NSNumber *vendorTotalCost = vendor.totalCost;
        float vendorTotalCostFloat = [vendorTotalCost floatValue];
        categoryTotalCost += vendorTotalCostFloat;
    }
    
    vendorCategory.actualCategoryCost = @(categoryTotalCost);
    
}

-(void)findEstimatedCostForWedding:(Wedding *)wedding{
    
    float weddingTotalEstimatedCost = 0;
    
    for (VendorCategory *vendorCateogry in wedding.vendorCategories) {
        
        NSNumber *estimatedCategoryCost = vendorCateogry.budgetedCost;
        float estimatedCategoryCostFloat = [estimatedCategoryCost floatValue];
        weddingTotalEstimatedCost += estimatedCategoryCostFloat;
    }
    
    if (!wedding.budget) {
        wedding.budget = [Budget objectWithClassName:[Budget parseClassName]];
    }
    
    wedding.budget.totalBudgetedCost = @(weddingTotalEstimatedCost);
    
    [wedding saveEventually];
    
}

-(void)findActualCostForWedding:(Wedding *)wedding{
    
    float weddingTotalCost = 0;
    
    for (VendorCategory *vendorCateogry in wedding.vendorCategories) {
        
        NSNumber *categoryCost = vendorCateogry.actualCategoryCost;
        float categoryCostFloat = [categoryCost floatValue];
        weddingTotalCost += categoryCostFloat;
    }
    
    if (!wedding.budget) {
        wedding.budget = [Budget objectWithClassName:[Budget parseClassName]];
    }
    
    wedding.budget.totalActualCost = @(weddingTotalCost);
    
    [wedding saveEventually];
    
}


#pragma mark - find chosen vendor Categories

-(NSArray *)findChosenVendorCategoriesForWedding:(Wedding *)wedding{
 
NSArray *vendorCategories = wedding.vendorCategories;
    
NSMutableArray *mutableChosenVendorCategories = [NSMutableArray new];
    
for (VendorCategory *vendorCateogry in vendorCategories) {
    if (vendorCateogry.vendors.count > 0) {
        [mutableChosenVendorCategories addObject:vendorCateogry];
    }
}

NSArray *chosenVendorCategories = mutableChosenVendorCategories;

return chosenVendorCategories;

}

@end
