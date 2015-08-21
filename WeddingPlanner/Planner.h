//
//  Planner.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Person.h"

@interface Planner : Person <PFSubclassing>

@property (retain) NSString *businessName;
@property (retain) NSArray *weddings;
@property (retain) NSArray *masterWeddingProfiles;
@property (retain) NSArray *personalCalendarItems;


@end
