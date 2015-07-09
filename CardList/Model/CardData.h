//
//  CardData.h
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Place.h"
#import "Movie.h"
#import "Music.h"

#pragma mark - Card data

#define CARD_DATA_OBSERVER_KEY @"carddata"

@interface CardData : NSObject

- (void)downloadCardData;
- (NSMutableArray*) getCardData;

@end


