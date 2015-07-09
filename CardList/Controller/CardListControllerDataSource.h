//
//  CardListControllerDataSource.h
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface CardListControllerDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
