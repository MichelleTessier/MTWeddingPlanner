//
//  PlannerController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/27/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "PlannerController.h"

@implementation PlannerController
+ (PlannerController*)sharedInstance {
    static PlannerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlannerController new];
    });
   
    return sharedInstance;
}

-(Planner *)createPlanner{
    
    Planner *newPlanner = (Planner *)[Planner object];
    [newPlanner signUpInBackground];
    return newPlanner;
    
}

-(void)retrievePlanners{
    PFQuery *getPlanners = [Planner query];
    [getPlanners findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.planners = results;
    }];
}

-(void)retrievePlannerWithEmail:(NSString *)email{
    
    PFQuery *getPlanners = [Planner query];
    [getPlanners whereKey:@"email" equalTo:email];
    [getPlanners findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        NSArray *planners = results;
        self.planner = planners[0];
    }];
    
}



@end
