//
//  EditBudgetIndividualPageViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/4/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "EditBudgetIndividualPageViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

@interface EditBudgetIndividualPageViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UILabel *categoryLabel;
@property (strong, nonatomic) UITextField *budgetTextField;
@property (strong, nonatomic) UIView *dividerLine;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation EditBudgetIndividualPageViewController


-(instancetype)initWithWedding:(Wedding *)wedding andIndex:(NSInteger)index {
    //self.contentView
    self = [super init];
    
    if (self) {
        self.currentVendorCategory = wedding.vendorCategories[index];
        
        if (index > 0) {
            self.previousVendorCateogy = wedding.vendorCategories[index - 1];
        }
        
        if (index < wedding.vendorCategories.count) {
            self.nextVendorCategory = wedding.vendorCategories[index + 1];
        }
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   

    [self setUpView];
    [self setConstraints];
    
    
}

-(void)setUpView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.categoryLabel = [UILabel new];
    self.categoryLabel.textAlignment = NSTextAlignmentCenter;
    self.categoryLabel.text = self.currentVendorCategory.title;
    self.categoryLabel.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:self.categoryLabel];
    
    self.budgetTextField = [UITextField new];
    self.budgetTextField.textAlignment = NSTextAlignmentCenter;
    
    if (!self.currentVendorCategory.budgetedCost) {
        self.budgetTextField.placeholder = @"Budget for Category";
    } else {
        float catBudgetedCost = [self.currentVendorCategory.budgetedCost floatValue];
        self.budgetTextField.text = [NSString stringWithFormat:@"%.2f", catBudgetedCost];
    }
    
    [self.view addSubview:self.budgetTextField];
    
    self.dividerLine = [UIView new];
    self.dividerLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.dividerLine];
    
}

-(void)setConstraints{
//    if (!self.navigationController.navigationBar) {
    
//    } else {
//        [self.tableView alignCenterYWithView:self.view predicate:@"0"];
//    }
    
    [self.dividerLine alignCenterYWithView:self.view predicate:nil];
    [self.dividerLine constrainWidthToView:self.view predicate:@"*.6"];
    [self.dividerLine constrainHeight:@"1"];
    [self.dividerLine alignCenterXWithView:self.view predicate:nil];
    
    [self.categoryLabel constrainBottomSpaceToView:self.dividerLine predicate:@"5"];
    [self.categoryLabel constrainWidthToView:self.dividerLine predicate:nil];
    [self.categoryLabel constrainHeight:@"50"];
    [self.categoryLabel alignCenterXWithView:self.view predicate:nil];
    
    [self.budgetTextField constrainTopSpaceToView:self.dividerLine predicate:@"5"];
    [self.budgetTextField constrainWidthToView:self.dividerLine predicate:nil];
    [self.budgetTextField constrainHeightToView:self.categoryLabel predicate:nil];
    [self.budgetTextField alignCenterXWithView:self.view predicate:nil];
     
 
    
}

#pragma mark - textfield delegate methods

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
#warning need to get a decimal point in here somehow?
    
    
    //    if ((textField.text.length >= 2) && (range.location == 2)) {
    //        NSString *originalDigitString = [textField.text substringWithRange:NSMakeRange(range.location-1, 1)];
    //        NSString *decimalString = @".";
    //        decimalString = [decimalString stringByAppendingString:originalDigitString];
    //        string = decimalString;
    //        return YES;
    //    }
    
    NSCharacterSet *invalidCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
    NSString *filteredString = [[string componentsSeparatedByCharactersInSet:invalidCharacterSet] componentsJoinedByString:@""];
    return [string isEqualToString:filteredString];
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self updateVendorCategory];
    
}

-(void)updateVendorCategory{
   
    float estimatedCost = [self.budgetTextField.text floatValue];
    
    self.currentVendorCategory.budgetedCost = @(estimatedCost);
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
