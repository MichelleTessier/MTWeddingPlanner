//
//  WeddingController.h
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wedding.h"

@interface WeddingController : NSObject

+ (WeddingController*)sharedInstance;

-(Wedding *)createWedding;

@property (nonatomic, strong) NSArray *weddings;
-(void)retrieveWeddings;

-(void)deleteWedding:(Wedding *)weddingToDelete;


@end

