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
@property (retain) UIImage *photo;
@property (retain) NSString *facebookLink;
@property (retain) NSString *address;
@property (retain) NSString *email;
@property (retain) NSString *phoneNumber;
@property (retain) NSString *secondPhoneNumber;

@end

