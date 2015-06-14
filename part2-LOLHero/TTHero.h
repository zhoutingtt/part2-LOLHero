//
//  TTHero.h
//  part2-LOLHero
//
//  Created by Apple on 15/6/14.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTHero : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *icon;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) heroWithDict:(NSDictionary *)dict;

@end
