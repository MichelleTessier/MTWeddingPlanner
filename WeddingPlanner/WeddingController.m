//
//  WeddingController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "WeddingController.h"

@implementation WeddingController

+ (WeddingController*)sharedInstance {
    
    static WeddingController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeddingController new];
    });
   
    return sharedInstance;
}

-(Wedding *)createWedding{
    
    Wedding *wedding = [Wedding objectWithClassName:[Wedding parseClassName]];
    
    return wedding;
    
}

-(void)retrieveWeddings{
    PFQuery *getWeddings = [Wedding query];
    [getWeddings findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.weddings = results;
    }];
    
    
}

-(void)deleteWedding:(Wedding *)weddingToDelete{
    
}

@end
