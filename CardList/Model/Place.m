//
//  Place.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "Place.h"

#pragma mark - Place card data model

#define KEY_CARD_PLACECATEGORY      @"placeCategory"

@implementation Place

- (instancetype) initWithDictionary: (NSDictionary *)dic
{
    if (self = [super initWithDictionary:dic]) {
        NSString* var = dic[KEY_CARD_PLACECATEGORY];
        if (var) {
            self.placeCategory = [[NSString alloc] initWithString:var];
        }
    }
    return self;
}
@end
