//
//  BlogPost.m
//  TreehouseBlogReader
//
//  Created by Cookie Gu on 15/11/15.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

-(id)initWithTitle:(NSString*)title {
    self = [super init];
    if (self) {
        self.title = title;
        self.author = nil;
        self.imagePath = nil;
    }
    return self;
}

+(id)blogPostWithTitle:(NSString*)title {
    return [[self alloc] initWithTitle:title];
}

-(NSURL *)getImagePathURL {
//    NSLog(@"%@", [self.imagePath class]);
    return [NSURL URLWithString:self.imagePath];
}

-(NSString *)formatteredDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];

    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:tempDate];
}

@end
