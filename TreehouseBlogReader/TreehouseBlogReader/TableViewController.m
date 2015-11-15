//
//  TableViewController.m
//  TreehouseBlogReader
//
//  Created by Cookie Gu on 15/11/14.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // uRL
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    // download NSData
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSError *error = nil;

    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSArray *posts = dataDic[@"posts"];

    // init self blogPosts
    self.blogPosts = [NSMutableArray array];

    for (NSDictionary* post in posts) {
        NSString* title = post[@"title"];
        BlogPost *blogPost = [BlogPost blogPostWithTitle:title];
        blogPost.author = post[@"author"];
        blogPost.imagePath = post[@"thumbnail"];
        blogPost.date = post[@"date"];
        
        [self.blogPosts addObject:blogPost];
    }
}
;
#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.blogPosts count];
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier =@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

    NSLog(@"%@",blogPost.imagePath);
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", blogPost.author, blogPost.date];

    if ([blogPost.imagePath isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:[blogPost getImagePathURL]];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse.png"];
    }

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
