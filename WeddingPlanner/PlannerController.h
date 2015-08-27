//
//  PlannerController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/27/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Planner.h"

@interface PlannerController : NSObject

+(PlannerController*)sharedInstance;

-(Planner *)createPlanner;

@property (nonatomic, strong) NSArray *planners;
@property (nonatomic, strong) Planner *planner;

-(void)retrievePlanners;

-(void)deletePlanner:(Planner *)plannerToDelete;


-(void)retrievePlannerWithEmail:(NSString *)email;


@end
