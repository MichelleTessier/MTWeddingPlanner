//
//  PlannerController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/27/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "PlannerController.h"
#import "Couple.h"

@implementation PlannerController
+ (PlannerController*)sharedInstance {
    static PlannerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlannerController new];
    });
   
    return sharedInstance;
}

-(Planner *)createPlannerwithEmail:(NSString *)email andPassword:(NSString *)password{
    
    Planner *newPlanner = (Planner *)[Planner object];
    [newPlanner setIsPlanner:YES];
    [newPlanner setUsername:email];
    [newPlanner setPassword:password];
    [newPlanner signUpInBackground];
    
    return newPlanner;
    
}

-(void)retrievePlannersWithCompletion:(void(^)(void))completion{
    PFQuery *getPlanners = [Planner query];
    [getPlanners whereKey:@"isPlanner" equalTo:@YES];
    [getPlanners findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.planners = results;
        
        completion();
    }];
}

-(void)retrievePlannerWithEmail:(NSString *)email withCompletion:(void(^)(void))completion{
    
    PFQuery *getPlanners = [Planner query];
    [getPlanners whereKey:@"isPlanner" equalTo:@YES];
    [getPlanners whereKey:@"email" equalTo:email];
    [getPlanners findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        NSArray *planners = results;
        self.planner = planners[0];
        
        completion();
    }];
    
}



@end
