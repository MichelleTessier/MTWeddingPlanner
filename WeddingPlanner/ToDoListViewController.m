//
//  ToDoViewController.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 8/19/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoListViewController.h"
#import "ToDoListDataSource.h"
#import "ToDoDetailViewController.h"
#import "IncompleteItemsOnlyToDoListDataSource.h"
#import "UIView+FLKAutoLayout.h"
#import "UIView+FLKAutoLayoutDebug.h"
#import "AppearenceController.h"

@interface ToDoListViewController () <UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ToDoListDataSource *showAlldataSource;
@property (strong, nonatomic) IncompleteItemsOnlyToDoListDataSource *incompleteOnlyDataSource;

@end

#warning why is table view starting so far down?

@implementation ToDoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppearenceController *appearenceController = [[AppearenceController alloc] init];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.bounds.size.width - 80, 50)];
    self.label.font = appearenceController.headerFont;
    self.label.text = @"Show completed tasks";

    [self.view addSubview:self.label];
    
    self.archivedSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 80, 10, 80, 45)];
    [self.view addSubview:self.archivedSwitch];
    self.archivedSwitch.enabled = YES;
    self.archivedSwitch.userInteractionEnabled = YES;
    [self.archivedSwitch setOn:NO animated:YES];
    [self.archivedSwitch addTarget:self action:@selector(archivedSwitchToggled) forControlEvents:UIControlEventValueChanged];
    

   
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height- 44)];

    self.showAlldataSource = [ToDoListDataSource new];
    self.incompleteOnlyDataSource = [IncompleteItemsOnlyToDoListDataSource new];
    self.incompleteOnlyDataSource.couple = self.couple;
    self.showAlldataSource.couple = self.couple;
    
    self.showAlldataSource.isCurrentDataSource = NO;
    self.incompleteOnlyDataSource.isCurrentDataSource = YES;

    self.tableView.dataSource = self.incompleteOnlyDataSource;
    
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    
}

-(void)archivedSwitchToggled{
    
#warning check animations of checkbox when changing switch
    
    if (self.archivedSwitch.on) {
        self.tableView.dataSource = self.showAlldataSource;
        self.showAlldataSource.isCurrentDataSource = YES;
        self.incompleteOnlyDataSource.isCurrentDataSource = NO;
    } else {
        self.tableView.dataSource = self.incompleteOnlyDataSource;
        self.showAlldataSource.isCurrentDataSource = NO;
        self.incompleteOnlyDataSource.isCurrentDataSource = YES;
    }
    
    [self.tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoTimeCategory *toDoTimeCategory = self.couple.wedding.toDoTimeCategories[indexPath.section];
    

    
    if (self.showAlldataSource.indexPathForTip){
        //there is a tip cell displayed
        if ((indexPath.section == self.showAlldataSource.indexPathForTip.section)&&(indexPath.row == self.showAlldataSource.indexPathForTip.row)) {
            //This is the tip cell
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
        } else if ((indexPath.section == self.showAlldataSource.indexPathForTip.section)&&(indexPath.row == (self.showAlldataSource.indexPathForTip.row - 1))){
            //The cell tapped is the title of the tip that is already displayed
            
            NSIndexPath *indexPathToDelete = self.showAlldataSource.indexPathForTip;
            self.showAlldataSource.indexPathForTip = nil;
            [tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
            
            ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            ToDoDetailViewController *toDoDetailVC = [ToDoDetailViewController new];
            toDoDetailVC.toDoItem = toDoItem;
            
            [self.navigationController pushViewController: toDoDetailVC animated:YES];
            
        }else if (indexPath.section == self.showAlldataSource.indexPathForTip.section){
            //The cell tapped is in the same section as the tip cell displayed
            
            ToDoItem *toDoItem;
            
            if (indexPath.row < self.showAlldataSource.indexPathForTip.row) {
                
                //The cell tapped is above the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
                NSIndexPath *indexPathToDelete = self.showAlldataSource.indexPathForTip;
                self.showAlldataSource.indexPathForTip = nil;
                [tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
                
                ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
                ToDoDetailViewController *toDoDetailVC = [ToDoDetailViewController new];
                toDoDetailVC.toDoItem = toDoItem;
                
                [self.navigationController pushViewController: toDoDetailVC animated:YES];
                
            } else {
                //The cell tapped is below the tip cell displayed
                toDoItem = toDoTimeCategory.toDoItems[indexPath.row - 1];
                
                NSIndexPath *indexPathToDelete = self.showAlldataSource.indexPathForTip;
                self.showAlldataSource.indexPathForTip = nil;
                [tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
                
                ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
                ToDoDetailViewController *toDoDetailVC = [ToDoDetailViewController new];
                toDoDetailVC.toDoItem = toDoItem;
                
                [self.navigationController pushViewController: toDoDetailVC animated:YES];
            }
                
            
            
        } else {
            //The cell tapped is not in the same section as the tip cell displayed
            ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
            
            NSIndexPath *indexPathToDelete = self.showAlldataSource.indexPathForTip;
            self.showAlldataSource.indexPathForTip = nil;
            [tableView deleteRowsAtIndexPaths:@[indexPathToDelete] withRowAnimation:UITableViewRowAnimationBottom];
            
            ToDoDetailViewController *toDoDetailVC = [ToDoDetailViewController new];
            toDoDetailVC.toDoItem = toDoItem;
            
            [self.navigationController pushViewController: toDoDetailVC animated:YES];
            
        }
        
    } else {
        //There is no tip cell currently displayed
        
        ToDoItem *toDoItem = toDoTimeCategory.toDoItems[indexPath.row];
        
        ToDoDetailViewController *toDoDetailVC = [ToDoDetailViewController new];
        toDoDetailVC.toDoItem = toDoItem;
        
        [self.navigationController pushViewController: toDoDetailVC animated:YES];
        
    }
 
 
    
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
