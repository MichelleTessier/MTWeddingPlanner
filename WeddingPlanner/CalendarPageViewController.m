//
//  CalendarViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarPageViewController.h"
#import "AddCalendarEventViewController.h"
#import "CalendarDayViewController.h"

@interface CalendarPageViewController () <UIPageViewControllerDataSource, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeDownGestureRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeUpGestureRecognizer;
@property (strong, nonatomic) UIScrollView *pageScrollView;

@end

@implementation CalendarPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpPageView];
    [self setUpView];
    [self addSwipeDown];
    
   
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
}


#pragma mark - methods to set up page view controller and view

-(void)setUpPageView{

    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:kNilOptions];
    
    self.pageViewController.dataSource = self;
    
    NSDate *selectedDate = [DateController sharedInstance].selectedDate;
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:selectedDate andCouple:self.couple];
    
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

#pragma mark - pageview controller datasource methods

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    [[DateController sharedInstance] getYesterDaysDate];
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:[DateController sharedInstance].selectedDate andCouple:self.couple];
    
    
    return calendarDayVC;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    [[DateController sharedInstance] getTomorrowsDate];
    
    CalendarDayViewController *calendarDayVC = [[CalendarDayViewController alloc] initWithDate:[DateController sharedInstance].selectedDate andCouple:self.couple];
    
    return calendarDayVC;
    
}

-(void)addSwipeDown{
    
    for (UIView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            self.pageScrollView = (UIScrollView *)view;
        }
    }
    
    self.swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(presentNextView)];
    self.swipeDownGestureRecognizer.delegate = self;
    self.swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.pageScrollView addGestureRecognizer:self.swipeDownGestureRecognizer];
    
    
}

-(void)presentNextView{
    
    //     if(((UISwipeGestureRecognizer *)gestureRecognizer).direction == UISwipeGestureRecognizerDirectionDown){
    
    NSLog(@"almost there");
    
    AddCalendarEventViewController *addCalendarEventVC = [AddCalendarEventViewController new];
    addCalendarEventVC.couple = self.couple;
    
    [self presentViewController: addCalendarEventVC animated:YES completion:nil];
    
    //     }
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
