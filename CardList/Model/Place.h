//
//  Place.h
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "CardBase.h"

#define KEY_CARD_TYPE_PLACE         @"place"

@interface Place : CardBase

@property (nonatomic, strong) NSString* placeCategory;

@end
