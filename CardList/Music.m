//
//  Music.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "Music.h"

#pragma mark - Music card data model

#define KEY_CARD_MUSICVIDEOURL      @"musicVideoURL"

@implementation Music

- (instancetype) initWithDictionary: (NSDictionary *)dic
{
    if (self = [super initWithDictionary:dic]) {
        self.musicVideoURL = [[NSString alloc] initWithString:dic[KEY_CARD_MUSICVIDEOURL]];
    }
    
    return self;
}
@end
