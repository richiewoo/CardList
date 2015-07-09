//
//  ViewController.m
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "MainViewController.h"
#import "MusicWebviewController.h"
#import "CardListControllerDataSource.h"
#import "CardCell.h"
#import "CardData.h"

@interface MainViewController () <CellActionDelegate>
@property (nonatomic, strong) CardData* cardData;
@property (nonatomic, strong) CardListControllerDataSource *cardListDataSource;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cardData = [[CardData alloc] init];
    [self.cardData downloadCardData];
    //KVO programming
    [self.cardData addObserver:self forKeyPath:CARD_DATA_OBSERVER_KEY options:NSKeyValueObservingOptionOld context:nil];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(CardCell *cell, CardBase *card) {
        cell.delegate = self;
        [cell setCardInfo:card];
    };

    self.cardListDataSource = [[CardListControllerDataSource alloc] initWithItems:[self.cardData getCardData] configureCellBlock:configureCell];
    self.tableView.dataSource = self.cardListDataSource;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView reloadData];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqual:CARD_DATA_OBSERVER_KEY]) {
        [self setupTableView];
    }
}

#pragma mark CellActionDelegate

- (void) ViewMusicVideo:(NSString*) videoURl
{
    MusicWebviewController *vc = [[MusicWebviewController alloc] init];
    vc.webPageUrl = videoURl;
    UINavigationController*nav = (UINavigationController*)[[[UIApplication sharedApplication] delegate]window].rootViewController;
    [nav pushViewController:vc animated:YES];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT_FOR_ROW;
}

@end
