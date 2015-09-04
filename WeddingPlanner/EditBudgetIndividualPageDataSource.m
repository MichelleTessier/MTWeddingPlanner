//
//  EditBudgetIndividualPageDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//



#import "EditBudgetIndividualPageDataSource.h"

static NSString *labelCellID = @"labelCellID";
static NSString *textCellID = @"textCellID";

@implementation EditBudgetIndividualPageDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return BudgetInformationTypeCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BudgetInformationTypes informationTypes = indexPath.row;
    
    switch (informationTypes) {
        case BudgetInformationTypeVendorCategory:
        {
            
            LabelTableViewCell *labelCell = [tableView dequeueReusableCellWithIdentifier:labelCellID];
            
            if (!labelCell) {
                labelCell = [[LabelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:labelCellID];
            }
            
            labelCell.label.textAlignment = NSTextAlignmentCenter;
            
            labelCell.label.text = self.vendorCategory.title;
            labelCell.label.font = [UIFont boldSystemFontOfSize:17];
            
            return labelCell;
            
            
            break;
        }
        case BudgetInformationTypeBudget:
        {
           TextFieldTableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:textCellID];
            
            if (!textCell) {
                textCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textCellID];
            }
            
            textCell.textField.textAlignment = NSTextAlignmentCenter;
            
            
            if (!self.vendorCategory.budgetedCost) {
                textCell.textField.placeholder = [NSString stringWithFormat:@"Budget for %@", self.vendorCategory.title];
            } else {
                textCell.textField.text = [NSString stringWithFormat:@"%@", self.vendorCategory.budgetedCost];
            }
            
            return textCell;
            
            break;
        }
        default:
            
        {
            TextFieldTableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:textCellID];
            
            if (!textCell) {
                textCell = [[TextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textCellID];
            }
            
            return textCell;
            
            break;
            break;
        }
    }
    
    
}
@end
