//
//  Person.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Person : PFObject

@property (retain) NSString *firstName;
@property (retain) NSString *lastName;
@property (retain) NSString *title;
@property (retain) UIImage *photo;
@property (retain) NSString *facebookLink;
@property (retain) NSString *streetAddress;
@property (retain) NSString *city;
@property (retain) NSString *state;
@property (retain) NSNumber *zip;
@property (retain) NSString *email;
@property (retain) NSString *phoneNumber;
@property (retain) NSString *secondPhoneNumber;
@property (retain) NSString *website;

@end

