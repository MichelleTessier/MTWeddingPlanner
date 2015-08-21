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

@interface Spouse : Person <PFSubclassing>

@property (retain) Guest *emergencyContact;

+(NSString *)parseClassName;

@end
