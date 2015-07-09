//
//  Movie.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "Movie.h"

#pragma mark - Movie card data model

#define KEY_CARD_MOVIEEXTRAIMAGEURL @"movieExtraImageURL"

@implementation Movie

- (instancetype) initWithDictionary: (NSDictionary *)dic
{
    if (self = [super initWithDictionary:dic]) {
        NSString* var = dic[KEY_CARD_MOVIEEXTRAIMAGEURL];
        if (var) {
            self.movieExtraImageURL = [[NSString alloc] initWithString:var];
        }
    }
    
    return self;
}
@end
