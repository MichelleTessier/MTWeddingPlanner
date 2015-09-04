//
//  ToDoDetailDataSource.m
//  WeddingPlanner
//
//  Created by Michelle Tessier on 9/2/15.
//  Copyright (c) 2015 MichelleTessier. All rights reserved.
//

#import "ToDoDetailDataSource.h"



static NSString *titleCellID = @"titleCellID";
static NSString *timeCatCellID = @"timeCatCellID";
static NSString *notesCellID = @"notesCellID";

@interface ToDoDetailDataSource()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ToDoDetailDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ToDoInformationTypesCount;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoInformationTypes informationTypes = indexPath.row;
    
    self.tableView = tableView;
    
    switch (informationTypes) {
        case ToDoInformationTypeTitle:{
            
            TextViewTableViewCell  *textCell = [tableView dequeueReusableCellWithIdentifier:titleCellID];
            
            if (!textCell) {
                textCell = [[TextViewTableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:titleCellID];
            }
            
            textCell.textView.text = self.toDoItem.title;
           
            return textCell;
            
            break;
        }
        case ToDoInformationTypeDueDate:{
            
            DatePickerTableViewCell *timeCell = [tableView dequeueReusableCellWithIdentifier:timeCatCellID];
            
            if (!timeCell) {
                timeCell = [[DatePickerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:timeCatCellID];
            }
            
            if (self.toDoItem.dueDate) {
                timeCell.textField.text = [NSString stringWithFormat:@"Due: %@", self.toDoItem.dueDate];
                
            } else {
                
            timeCell.textField.text = @"Due Date";
                
            }
            
            timeCell.delegate = self;
            timeCell.pickerView.datePickerMode = UIDatePickerModeDate;
            
            return timeCell;
            
            break;
        }
            
        case ToDoInformationTypeNotes:{
            
            TextViewTableViewCell *notesCell = [tableView dequeueReusableCellWithIdentifier:notesCellID];
            
            if (!notesCell) {
                notesCell = [[TextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:notesCellID];
            }
            

            
            if (!self.toDoItem.notes) {
                notesCell.textView.text = @"Notes";
            } else {
                notesCell.textView.text = self.toDoItem.notes; 
            }
            
            notesCell.delegate = self;
            
            return notesCell;
            
            break;
        }
        default: {
            
            TextViewTableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:titleCellID];
            
            if (!textCell) {
                textCell = [[TextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:titleCellID];
            }
            
            return textCell;
            
            break;
        
            break;
        }
    }
    
}

-(void)textViewWillBeginEditing:(TextViewTableViewCell *)sender{
    
    sender.textView.text = @"";
    
}

-(void)pickerSelectedDate:(NSDate *)date onCell:(DatePickerTableViewCell *)sender{
    
    
    if ([sender.reuseIdentifier isEqualToString:timeCatCellID]) {
        self.toDoItem.dueDate = date;
        [self.delegate updateToDoItem:self.toDoItem];
    }
    
   
    
}
    
    
    




@end
