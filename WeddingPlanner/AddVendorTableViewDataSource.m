//
//  AddVendorTableViewDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/24/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "AddVendorTableViewDataSource.h"

static NSString *addVendorCell = @"addVendorCell";
typedef NS_ENUM(NSUInteger, AddVendorInformationSections) {
    AddVendorInformationPickerSection,
    AddVendorInformationContactSection,
    AddVendorinformationPaymentSection,
    AddVendorInformationSectionsCount,
};

@implementation AddVendorTableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Title";
}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    
//    
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addVendorCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addVendorCell];
    }
    
    cell.textLabel.text = @"Vendor";
    
    return cell;
}



@end
