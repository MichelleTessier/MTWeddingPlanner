//
//  LoginViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/13/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "LoginViewController.h"
#import "WeddingListViewController.h"

#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"

#import "RegisterWeddingPageViewController.h"
#import "RegisterPlannerViewController.h"

#import "ClientTabBarController.h"
#import "DoubleTabBarSetup.h"

#import "Guest.h"

#warning user can't login and get info to fill in until the info saves on parse. likely an issue with save evenutally


@interface LoginViewController ()

@property (strong, nonatomic) UITabBarController *plannerTabBarController;
@property (strong, nonatomic) ClientTabBarController *clientTabBarController;
@property (strong, nonatomic) UIBarButtonItem *toolBarButton;
@property (strong, nonatomic) UITextField *userNameTextField;
@property (strong, nonatomic) UITextField *passwordTextfield;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) PFUser *userSigningIn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setUpView];
   
    
    
    
    
}

-(void)setUpView{
    
    
    self.userNameTextField = [UITextField new];
    self.userNameTextField.placeholder = @"email";
    [self.view addSubview:self.userNameTextField];
    
    self.passwordTextfield = [UITextField new];
    self.passwordTextfield.placeholder = @"password";
    [self.view addSubview:self.passwordTextfield];
    
    UIButton *signInButton = [UIButton new];
    [signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
    [signInButton setBackgroundColor:[UIColor purpleColor]];
    [signInButton addTarget:self action:@selector(signInButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInButton];
    
    UIButton *registerWeddingButton = [UIButton new];
    [registerWeddingButton setTitle:@"Register Wedding" forState:UIControlStateNormal];
    [registerWeddingButton setBackgroundColor:[UIColor purpleColor]];
    [registerWeddingButton addTarget:self action:@selector(registerWeddingButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerWeddingButton];
    
    UIButton *registerAsPlannerButton = [UIButton new];
    [registerAsPlannerButton setTitle:@"Register As Planner" forState:UIControlStateNormal];
    [registerAsPlannerButton setBackgroundColor:[UIColor blueColor]];
    [registerAsPlannerButton addTarget:self action:@selector(registerAsPlannerButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerAsPlannerButton];
    
    [self.passwordTextfield alignCenterXWithView:self.view predicate:@"0"];
    [self.passwordTextfield alignCenterYWithView:self.view predicate:@"0"];
    [self.passwordTextfield constrainWidth:@"150" height:@"44"];
    
    [self.userNameTextField alignCenterXWithView:self.passwordTextfield predicate:@"0"];
    [self.userNameTextField constrainBottomSpaceToView:self.passwordTextfield predicate:@"5"];
    [self.userNameTextField constrainWidthToView:self.passwordTextfield predicate:@"0"];
    [self.userNameTextField constrainHeightToView:self.passwordTextfield predicate:@"0"];
    
    [signInButton alignCenterXWithView:self.passwordTextfield predicate:@"0"];
    [signInButton constrainTopSpaceToView:self.passwordTextfield predicate:@"5"];
    [signInButton constrainWidthToView:self.passwordTextfield predicate:@"0"];
    [signInButton constrainHeightToView:self.passwordTextfield predicate:@"0"];
    
    [self.label constrainTopSpaceToView:signInButton predicate:@"5"];
    [self.label constrainWidthToView:self.passwordTextfield predicate:nil];
    [self.label constrainHeightToView:self.passwordTextfield predicate:nil];
    [self.label alignLeadingEdgeWithView:self.view predicate:@"5"];
    
    [registerWeddingButton alignBottomEdgeWithView:self.view predicate:@"0"];
    [registerWeddingButton alignLeadingEdgeWithView:self.view predicate:@"0"];
    [registerWeddingButton constrainWidthToView:self.view predicate:@"*.5"];
    [registerWeddingButton constrainHeight:@"44"];
    
    [registerAsPlannerButton alignBottomEdgeWithView:self.view predicate:@"0"];
    [registerAsPlannerButton alignTrailingEdgeWithView:self.view predicate:@"0"];
    [registerAsPlannerButton constrainLeadingSpaceToView:registerWeddingButton predicate:nil];
    [registerAsPlannerButton constrainHeightToView:registerWeddingButton predicate:@"0"];
}

-(void)signInPlanner:(Planner *)planner{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
            DoubleTabBarSetup *doubleTabBarSetup = [DoubleTabBarSetup new];
            doubleTabBarSetup.planner = planner;
            self.toolBarButton.title = @"Couples Names";
            doubleTabBarSetup.couple = nil;
            [doubleTabBarSetup setUpClientTabBarController];
            [doubleTabBarSetup setUpPlannerTabBarController];
            [self presentViewController:doubleTabBarSetup.plannerTabBarController animated:YES completion:nil];
        
        
    });
    
}

-(void)signInCouple:(Couple *)couple{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        PFQuery *getWeddings = [PFQuery queryWithClassName:@"Wedding"];
        [getWeddings whereKey:@"objectId" equalTo:couple.wedding.objectId];
        [getWeddings includeKey:@"vendorCategories.vendors"];
        [getWeddings includeKey:@"vendorCategories.vendors.vendorPayments"];
        [getWeddings includeKey:@"toDoTimeCategories.toDoItems"];
       
        
        [getWeddings getFirstObjectInBackgroundWithBlock:^(PFObject *wedding, NSError *error){
            
            couple.wedding = (Wedding *)wedding;
            
            DoubleTabBarSetup *doubleTabBarSetup = [DoubleTabBarSetup new];
            self.toolBarButton.title = @"Couples Names";
            doubleTabBarSetup.couple = couple;
            doubleTabBarSetup.planner = nil;
            
            //Test
            VendorCategory *vendorCategory = couple.wedding.vendorCategories[0];
            NSLog(@"COUPLE: %@", couple);
            NSLog(@"COUPLE.WEDDING.VENDORCATEGORIES[0]: %@", couple.wedding.vendorCategories[0]);
            NSLog(@"VENDOR CATEGORY: %@", vendorCategory.title);
            
            ToDoTimeCategory *timeCat = couple.wedding.toDoTimeCategories[0];
            NSLog(@"TIME CAT: %@", timeCat.title);
            
            
            [doubleTabBarSetup setUpClientTabBarController];
            [self presentViewController:doubleTabBarSetup.clientTabBarController animated:YES completion:nil];
            
            
        }];
    
    
        
        
        
    });
    
    
}

-(void)signInButtonTapped{
    
    [PFUser logInWithUsernameInBackground:self.userNameTextField.text password:self.passwordTextfield.text
                                    block: ^(PFUser *user, NSError *error) {
                                        
                                        if (!error) {
                                            
                                            if (((Couple *)user).isPlanner == true) {
                                                
                                                
                                                [self signInPlanner:(Planner *)user];
                                                
                                            } else {
                                                
                                                [self signInCouple:(Couple *)user];
                                                
                                            }
                                            
                                        } else {
                                            self.label.text = @"Are you sure that login info's correct?";
                                        }
    
                                    }];
}


-(void)registerAsPlannerButtonTapped{
    
    [self presentViewController:[RegisterPlannerViewController new] animated:YES completion:nil];
    
}

-(void)registerWeddingButtonTapped{
    
    [self presentViewController:[RegisterWeddingPageViewController new] animated:YES completion:nil];
    
    
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
