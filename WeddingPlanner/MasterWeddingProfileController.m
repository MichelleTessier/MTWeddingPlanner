//
//  MasterWeddingProfileController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "MasterWeddingProfileController.h"

@implementation MasterWeddingProfileController


+ (MasterWeddingProfileController*)sharedInstance {
    static MasterWeddingProfileController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MasterWeddingProfileController new];
    });
   
    return sharedInstance;
}

- (MasterWeddingProfile *)createMasterWeddingProfile{
    
    MasterWeddingProfile *masterWeddingProfile = [MasterWeddingProfile objectWithClassName:[MasterWeddingProfile parseClassName]];
    
    return masterWeddingProfile;
    
}

-(void)retrieveMasterWeddingProfiles{
    PFQuery *getMasterWeddingProfiles = [MasterWeddingProfile query];
    [getMasterWeddingProfiles findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error){
        self.masterWeddingProfiles = results;
    }];
}


-(void)deleteMasterWeddingProfile:(MasterWeddingProfile *)masterWeddingProfileToDelete{
    
}

@end
