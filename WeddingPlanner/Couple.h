//
//  SpouseA.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Guest.h"
#import "Wedding.h"

@interface Couple : PFUser <PFSubclassing>

@property (retain) Wedding *wedding;
@property (retain) NSString *plannerID;
@property (retain) NSString *plannerFirstName;

@property (assign) BOOL isPlanner;

@property (retain) NSString *primaryAccountEmail;
@property (retain) NSString *primaryAccountPassword;

@property (retain) UIImage *photo;
@property (retain) NSString *website;

@property (retain) NSString *spouse1FirstName;
@property (retain) NSString *spouse1LastName;
@property (retain) NSString *spouse1FacebookLink;
@property (retain) NSString *spouse1PhoneNumber;
@property (retain) NSString *spouse1SecondPhoneNumber;
@property (retain) Guest *spouse1EmergencyContact;

@property (retain) NSString *spouse2FirstName;
@property (retain) NSString *spouse2LastName;
@property (retain) NSString *spouse2Email;
@property (retain) NSString *spouse2FacebookLink;
@property (retain) NSString *spouse2PhoneNumber;
@property (retain) NSString *spouse2SecondPhoneNumber;
@property (retain) Guest *spouse2EmergencyContact;

@end
