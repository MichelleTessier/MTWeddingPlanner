//
//  ToDoDetailViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/2/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoDetailViewController.h"
#import "ToDoDetailDataSource.h"
#import "TextViewTableViewCell.h"

@interface ToDoDetailViewController () <UITableViewDelegate, UITextViewDelegate, ToDoDataSourceDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ToDoDetailDataSource *dataSource;

@end

@implementation ToDoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    [self.view addSubview:navBar];
    self.navigationController.navigationBarHidden = NO;
    
    
    UIBarButtonItem *backButton = [UIBarButtonItem new];
    [backButton setTitle:@"Back"];
    [backButton setTarget:self];
    [backButton setAction:@selector(backButtonTapped)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    self.dataSource = [ToDoDetailDataSource new];
    self.dataSource.toDoItem = self.toDoItem;
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    self.dataSource.delegate = self;
    [self.view addSubview:self.tableView];
    
}

- (void)backButtonTapped{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

//Need to do something to keep text view expanding as person is typing

//- (void)textViewDidChange:(UITextView *)textView
//{
//    CGFloat fixedWidth = textView.frame.size.width;
//    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
//    CGRect newFrame = textView.frame;
//    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
//}

-(CGFloat)heightForNotesInTextView{
    CGRect bounding = [self.toDoItem.notes boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, CGFLOAT_MAX)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                        context:nil];
    CGFloat newsize = bounding.size.height + 50;
    return newsize;
}

-(CGFloat)heightForTitleInTextView{
    CGRect bounding = [self.toDoItem.title boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, CGFLOAT_MAX)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}
                                                        context:nil];
    CGFloat newsize = bounding.size.height;
    return newsize;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     ToDoInformationTypes informationTypes = indexPath.row;
    
    CGFloat height;
    
    if (informationTypes == ToDoInformationTypeTitle){
        
        CGFloat textViewSize = [self heightForTitleInTextView];
        
        if (20 > textViewSize)
            
            height = 20;
        
        else {
            
            height = textViewSize;
            
        }
        
    } else if (informationTypes == ToDoInformationTypeNotes) {
        
    

        CGFloat textViewSize = [self heightForNotesInTextView];
        
        if (75 > textViewSize)
            
            height = 75;
        
        else {
            
            height = textViewSize;
            
        }
        
    } else {
        
        height = 44;
    }
    
    return height;
}

-(void)updateToDoItem:(ToDoItem *)toDoItem{
    self.toDoItem = toDoItem;
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
