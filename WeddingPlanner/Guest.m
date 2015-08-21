//
//  Guest.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "Guest.h"
#import <Parse/PFObject+Subclass.h>

@implementation Guest

@dynamic inWeddingParty;
@dynamic roleInWeddingParty;
@dynamic invitedToRehearsalDinner;
@dynamic invitedToReceptionOnly;
@dynamic RSVP;
@dynamic plusOnes;


+(void)load{
    [self registerSubclass];
}


@end
