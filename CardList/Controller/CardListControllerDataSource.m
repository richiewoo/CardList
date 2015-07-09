//
//  CardListControllerDataSource.m
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "CardListControllerDataSource.h"
#import "CardData.h"
#import "PlaceCell.h"
#import "MovieCell.h"
#import "MusicCell.h"

@interface CardListControllerDataSource ()

@property (nonatomic, strong)   NSArray *items;
@property (nonatomic, copy)     TableViewCellConfigureBlock configureCellBlock;

@end

@implementation CardListControllerDataSource

- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray *)anItems configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardBase* item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([item class])];
    if (cell == nil) {
        if ([item.cardType isEqualToString:KEY_CARD_TYPE_PLACE]) {
            cell  = [[PlaceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cardType];
        }
        if ([item.cardType isEqualToString:KEY_CARD_TYPE_MOVIE]) {
            cell  = [[MovieCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cardType];
        }
        if ([item.cardType isEqualToString:KEY_CARD_TYPE_MUSIC]) {
            cell  = [[MusicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:item.cardType];
        }
    }
    
    self.configureCellBlock(cell, item);
    return cell;
}

@end
