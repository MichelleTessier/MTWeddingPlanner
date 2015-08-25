//
//  MasterWeddingProfileController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MasterWeddingProfile.h"

@interface MasterWeddingProfileController : NSObject

+ (MasterWeddingProfileController *)sharedInstance;

- (MasterWeddingProfile *)createMasterWeddingProfile;

@property (nonatomic, strong) NSArray *masterWeddingProfiles;
-(void)retrieveMasterWeddingProfiles;

-(void)deleteMasterWeddingProfile:(MasterWeddingProfile *)masterWeddingProfileToDelete;

@end
