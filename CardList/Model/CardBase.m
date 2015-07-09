//
//  CardBase.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "CardBase.h"

@implementation CardBase

- (instancetype) initWithDictionary: (NSDictionary *)dic
{
    if (self = [super init]) {
        NSString* var = dic[KEY_CARD_TYPE];
        if (var) {
            self.cardType = [[NSString alloc] initWithString:var];
        }
        
        var = dic[KEY_CARD_TITLE];
        if (var) {
            self.title = [[NSString alloc] initWithString:var];
        }
        
        var = dic[KEY_CARD_IMAGEURL];
        if (var) {
            self.imageURL = [[NSString alloc] initWithString:var];
        }
    }
    return self;
}

@end
