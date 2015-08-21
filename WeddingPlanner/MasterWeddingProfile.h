//
//  MasterWeddingProfile.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface MasterWeddingProfile : PFObject <PFSubclassing>

@property (retain) NSArray *starterToDoTaskTimeCategories;
@property (retain) NSArray *starterTaskCategories;
@property (retain) NSArray *starterVendorCategories;

+(NSString *)parseClassName;

@end
