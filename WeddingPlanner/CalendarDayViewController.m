//
//  CalendarDayViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/10/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "CalendarDayViewController.h"
#import "WeddingController.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "DateController.h"
#import "AddCalendarEventViewController.h"

@interface CalendarDayViewController ()

@property (strong, nonatomic) Couple *couple;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeDownGestureRecognizer;

@end

@implementation CalendarDayViewController

-(instancetype)initWithDate:(NSDate *)date{
   
    self = [super init];
    
    if (self) {
        self.today = date;
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    [self setDateForView];
    [self setConstraints];
    [self addSwipeDown];
    
    
    
}

-(void)addSwipeDown{
    
    //    for (UIGestureRecognizer *gestureReconizer in self.pageViewController.gestureRecognizers) {
    //
    //        gestureReconizer.delegate = self;
    //
    //    }
    
    self.swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(presentNextView:)];
    [self.view addGestureRecognizer:self.swipeDownGestureRecognizer];
    
}



-(void)presentNextView: (UIGestureRecognizer *)gestureRecognizer{
    
    if(((UISwipeGestureRecognizer *)gestureRecognizer).direction == UISwipeGestureRecognizerDirectionDown){
       
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        AddCalendarEventViewController *addCalendarEventVC = [AddCalendarEventViewController new];
        addCalendarEventVC.couple = self.couple;
        [self presentViewController:addCalendarEventVC animated: YES completion:nil];
        
    }
}



-(void)setUpView{
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.dateLabel = [UILabel new];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.numberOfLines = 2;
    [self.view addSubview:self.dateLabel];
    

}

-(void)setDateForView{
    
    NSDateComponents *dateComponents = [[DateController sharedInstance] getDateComponentsForDate:self.today];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:(dateComponents.month - 1)];
    
    NSString *weekDayName = [[dateFormatter weekdaySymbols] objectAtIndex:(dateComponents.weekday - 1)];
    
    self.dateLabel.text = [NSString stringWithFormat:@"%@ \n %@ %ld", weekDayName, monthName, dateComponents.day];
    
}

-(void)setConstraints{
    
    [self.dateLabel alignLeading:@"5" trailing:@"5" toView:self.view];
    [self.dateLabel alignTopEdgeWithView:self.view predicate:@"64"];
    [self.dateLabel constrainHeight:@"64"];
    
}

-(void)saveButtonTapped{
    
    [self.couple saveEventually];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
