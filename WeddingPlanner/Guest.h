//
//  Guest.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Person.h"

@interface Guest : Person <PFSubclassing>

@property (assign) BOOL inWeddingParty;
@property (retain) NSString *roleInWeddingParty;
@property (assign) BOOL invitedToRehearsalDinner;
@property (assign) BOOL invitedToReceptionOnly;
@property (assign) BOOL RSVP;
@property (assign) NSArray *plusOnes;

+(NSString *)parseClassName;

@end
