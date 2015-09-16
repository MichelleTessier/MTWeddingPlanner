//
//  CalendarViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarPageViewController.h"
#import "AddCalendarEventViewController.h"

@interface CalendarPageViewController () <UIPageViewControllerDataSource, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeDownGestureRecognizer;
@property (strong, nonatomic) UIScrollView *pageScrollView;

@end

@implementation CalendarPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpPageView];
    [self setUpView];
    [self addSwipeDown];
   
    
    
}




//self.pageViewController.gestureRecognizers currently nil
-(void)addSwipeDown{
    
//    for (UIGestureRecognizer *gestureReconizer in self.pageViewController.gestureRecognizers) {
//        
//        gestureReconizer.delegate = self;
//        
//        if ([gestureReconizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//            
//            [gestureReconizer addTarget:self action:@selector(presentNextView:)];
//                
//            }
//        
//    }
    
    for (UIView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            self.pageScrollView = (UIScrollView *)view;
        }
    }
    
    self.swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(presentNextView:)];
    self.swipeDownGestureRecognizer.delegate = self;
    self.swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
   
    [self.pageScrollView addGestureRecognizer:self.swipeDownGestureRecognizer];
    
    
}




-(void)presentNextView: (UIGestureRecognizer *)gestureRecognizer{
    
     if(((UISwipeGestureRecognizer *)gestureRecognizer).direction == UISwipeGestureRecognizerDirectionDown){
         
         NSLog(@"almost there");
    
    [self presentViewController:[AddCalendarEventViewController new] animated:YES completion:nil];
         
     }
}




//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    
//    
//    return YES;
////    if ([gestureRecognizer isKindOfClass:[UISwipeGestureRecognizer class]]) {
////        if(((UISwipeGestureRecognizer *)gestureRecognizer).direction == UISwipeGestureRecognizerDirectionDown){
////            
////           return YES;
////            
////        } else {
////            return NO;
////        }
////        
////    } else {
////        return NO;
////    }
//   
//    
//}






-(void)setUpPageView{

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:kNilOptions];
    
    self.pageViewController.dataSource = self;
    
    NSDate *selectedDate = [DateController sharedInstance].selectedDate;
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:selectedDate];
    
    NSArray *viewControllers = @[calendarDayVC];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    [self.view addSubview:self.pageViewController.view];
    
}

-(void)setUpView{
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navBar];
    
    self.navigationController.navigationBarHidden = NO;
    
    
    UIBarButtonItem *saveButton = [UIBarButtonItem new];
    saveButton.title = @"Save";
    saveButton.target = self;
    saveButton.action = @selector(saveButtonTapped);
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

-(void)saveButtonTapped{
    
    [[WeddingController sharedInstance] findEstimatedCostForWedding:self.couple.wedding];
    [self.couple saveEventually];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    [[DateController sharedInstance] getYesterDaysDate];
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:[DateController sharedInstance].selectedDate];
    
    return calendarDayVC;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    [[DateController sharedInstance] getTomorrowsDate];
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:[DateController sharedInstance].selectedDate];
    
    return calendarDayVC;
    
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
