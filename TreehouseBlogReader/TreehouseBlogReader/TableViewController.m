//
//  TableViewController.m
//  TreehouseBlogReader
//
//  Created by Cookie Gu on 15/11/14.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.booksArray = [NSArray arrayWithObjects: @"Hamlet", @"King Lear", @"Othello", @"Macbeth", nil];
}

#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.booksArray count];
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.booksArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
