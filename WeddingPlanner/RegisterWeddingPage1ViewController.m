//
//  RegisterWeddingViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/26/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "RegisterWeddingPage1ViewController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#import "Couple.h"



@interface RegisterWeddingPage1ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *spouse1FirstNameTextField;
@property (strong, nonatomic) UITextField *spouse1LastNameTextField;
@property (strong, nonatomic) UITextField *spouse1EmailTextField;
@property (strong, nonatomic) UITextField *spouse2FirstNameTextField;
@property (strong, nonatomic) UITextField *spouse2LastNameTextField;
@property (strong, nonatomic) UITextField *spouse2EmailTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UITextField *confirmPasswordTextField;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *registerButton;


@end



@implementation RegisterWeddingPage1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setUpTextFieldsAndLabel];
    [self setUpButtons];
    [self setUpConstraints];
    
}

- (void)setUpTextFieldsAndLabel{
    
    self.spouse1FirstNameTextField = [UITextField new];
    self.spouse1FirstNameTextField.placeholder = @"First";

    [self.view addSubview:self.spouse1FirstNameTextField];
    
    self.spouse1LastNameTextField = [UITextField new];
    self.spouse1LastNameTextField.placeholder = @"Last";
    [self.view addSubview:self.spouse1LastNameTextField];
    
    self.spouse1EmailTextField = [UITextField new];
    self.spouse1EmailTextField.placeholder = @"Email";
    [self.view addSubview:self.spouse1EmailTextField];
    
    self.spouse2FirstNameTextField = [UITextField new];
    self.spouse2FirstNameTextField.placeholder = @"First";
    [self.view addSubview:self.spouse2FirstNameTextField];
    
    self.spouse2LastNameTextField = [UITextField new];
    [self.view addSubview:self.spouse2LastNameTextField];
    self.spouse2LastNameTextField.placeholder = @"Last";
    
    self.spouse2EmailTextField = [UITextField new];
    self.spouse2EmailTextField.placeholder = @"Email (optional)";
    [self.view addSubview:self.spouse2EmailTextField];
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];
    
    self.confirmPasswordTextField = [UITextField new];
    self.confirmPasswordTextField.delegate = self;
    self.confirmPasswordTextField.placeholder = @"Confirm password";
    self.confirmPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:self.confirmPasswordTextField];
    
    self.label = [UILabel new];
    [self.view addSubview:self.label];
    
    
    
}

-(void)setUpButtons{
    
    self.registerButton = [UIButton new];
    [self.registerButton setBackgroundColor:[UIColor purpleColor]];
    [self.registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
}

-(void)setUpConstraints{
    
    [self.spouse1FirstNameTextField constrainWidthToView:self.view predicate:@"*.4"];
    [self.spouse1FirstNameTextField constrainHeight:@"44"];
    [self.spouse1FirstNameTextField alignTopEdgeWithView:self.view predicate:@"15"];
    [self.spouse1FirstNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.spouse1LastNameTextField constrainLeadingSpaceToView:self.spouse1FirstNameTextField predicate:@"5"];
    [self.spouse1LastNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1LastNameTextField alignCenterYWithView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse1LastNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    
    [self.spouse1EmailTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1EmailTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse1EmailTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse1EmailTextField constrainTopSpaceToView:self.spouse1FirstNameTextField predicate:@"5"];
    
    [self.spouse2FirstNameTextField constrainTopSpaceToView:self.spouse1EmailTextField predicate:@"5"];
    [self.spouse2FirstNameTextField constrainWidthToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2FirstNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2FirstNameTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [self.spouse2LastNameTextField constrainLeadingSpaceToView:self.spouse2FirstNameTextField predicate:@"5"];
    [self.spouse2LastNameTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2LastNameTextField alignCenterYWithView:self.spouse2FirstNameTextField predicate:nil];
    [self.spouse2LastNameTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    
    [self.spouse2EmailTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2EmailTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.spouse2EmailTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.spouse2EmailTextField constrainTopSpaceToView:self.spouse2FirstNameTextField predicate:@"5"];
    
    [self.passwordTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.passwordTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.passwordTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.passwordTextField constrainTopSpaceToView:self.spouse2EmailTextField predicate:@"5"];
    
    [self.confirmPasswordTextField alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.confirmPasswordTextField alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.confirmPasswordTextField constrainHeightToView:self.spouse1FirstNameTextField predicate:nil];
    [self.confirmPasswordTextField constrainTopSpaceToView:self.passwordTextField predicate:@"5"];

    
    
    
    [self.label alignLeadingEdgeWithView:self.view predicate:@"5"];
    [self.label alignTrailingEdgeWithView:self.view predicate:@"5"];
    [self.label constrainHeight:@"44"];
    [self.label constrainTopSpaceToView:self.confirmPasswordTextField predicate:@"10"];
    
    [self.registerButton alignBottomEdgeWithView:self.view predicate:nil];
    [self.registerButton alignTrailingEdgeWithView:self.view predicate:nil];
    [self.registerButton alignLeadingEdgeWithView:self.view predicate:nil];
    [self.registerButton constrainHeight:@"44"];
    
}

- (void)createWedding{
    
    //put in method to make sure all textfields are filled in
    
    //also need to create parse user here
    
    if ([self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        
        self.label.text = @"";
        
         self.couple = [[WeddingController sharedInstance] createCouplewithEmail:self.spouse1EmailTextField.text andPassword:self.passwordTextField.text];
        
        self.wedding = [[WeddingController sharedInstance] createWeddingForCouple:self.couple];
        
        self.couple.wedding = self.wedding;
        
        [self.couple setSpouse1FirstName:self.spouse1FirstNameTextField.text];
        [self.couple setSpouse1LastName:self.spouse1LastNameTextField.text];
        [self.couple setEmail:self.spouse1EmailTextField.text];
        
        [self.couple setSpouse2FirstName:self.spouse2FirstNameTextField.text];
        [self.couple setSpouse2LastName:self.spouse2LastNameTextField.text];
        [self.couple setSpouse2Email:self.spouse2EmailTextField.text];
    
        [self.couple saveInBackground];
        
    } else {
        self.label.text = @"Please make sure your passwords match";
    }
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)registerButtonTapped{
    
    [self createWedding];
    
    self.registerWeddingPage2VC.couple = self.couple;
    
    [self.pageViewController setViewControllers:@[self.registerWeddingPage2VC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];

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
