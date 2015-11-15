//
//  BlogPost.h
//  TreehouseBlogReader
//
//  Created by Cookie Gu on 15/11/15.
//  Copyright © 2015年 Cookie Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong)NSString* title;
@property (nonatomic, strong)NSString* author;;
@property (nonatomic, strong)NSString* imagePath;
@property (nonatomic, strong)NSString* date;

+(id)blogPostWithTitle:(NSString*)title;

-(NSURL*)getImagePathURL;

@end
