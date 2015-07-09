//
//  CardBase.h
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_CARD_TYPE               @"type"
#define KEY_CARD_TITLE              @"title"
#define KEY_CARD_IMAGEURL           @"imageURL"

@interface CardBase : NSObject

@property (nonatomic, strong) NSString* cardType;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* imageURL;

- (instancetype) initWithDictionary: (NSDictionary *)dic;

@end
