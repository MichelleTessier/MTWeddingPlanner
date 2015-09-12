//
//  VendorPayment.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/21/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "VendorPayment.h"

@implementation VendorPayment

@dynamic date;
@dynamic calendarItem;
@dynamic amount;
@dynamic isPaid;
@dynamic vendor;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"VendorPayment";
}

@end
