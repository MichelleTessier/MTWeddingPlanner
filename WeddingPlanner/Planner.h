//
//  Planner.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Couple.h"

@interface Planner : Couple <PFSubclassing>

@property (retain) NSArray *couples;

@property (assign) BOOL isPlanner;
@property (retain) NSString *businessName;
@property (retain) NSArray *masterWeddingProfiles;
@property (retain) NSArray *personalCalendarItems;

@property (retain) NSString *firstName;
@property (retain) NSString *lastName;
@property (retain) NSString *title;
@property (retain) UIImage *photo;
@property (retain) NSString *facebookLink;
@property (retain) NSString *streetAddress;
@property (retain) NSString *city;
@property (retain) NSString *state;
@property (retain) NSNumber *zip;
@property (retain) NSString *phoneNumber;
@property (retain) NSString *secondPhoneNumber;
@property (retain) NSString *website;


@end
