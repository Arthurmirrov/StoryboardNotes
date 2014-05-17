//
//  TableViewController.h
//  StoryboardNotes
//
//  Created by Art on 16.05.14.
//  Copyright (c) 2014 Artur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end
