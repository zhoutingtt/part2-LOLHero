//
//  TTHero.m
//  part2-LOLHero
//
//  Created by Apple on 15/6/14.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "TTHero.h"

@implementation TTHero

- (instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.name = [dict[@"name"] copy];
//        self.intro = [dict[@"intro"] copy];
//        self.icon = [dict[@"icon"] copy];
        [self setValuesForKeysWithDictionary:dict];
    }

    return self;
}

+ (instancetype) heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];

}

@end
