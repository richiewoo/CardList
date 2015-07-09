//
//  CardCell.h
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardBase.h"

@protocol CellActionDelegate <NSObject>
@optional
- (void) ViewMusicVideo:(NSString*) videoURl;

@end

#define CELL_HEIGHT_FOR_ROW 100

@interface CardCell : UITableViewCell

@property(nonatomic, strong) UILabel* title;
@property(nonatomic, strong) UIImageView* thumbnail;
@property(nonatomic, weak)id<CellActionDelegate> delegate;

- (void)UIInit;
- (void) setCardInfo:(CardBase *) ba;
- (void) setCardInfo:(NSString *) titleName thumbnail:(NSString *)imgUrl;

@end