//
//  MusicCell.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "MusicCell.h"

#pragma mark - Cell for Music card

@interface MusicCell ()
@property(nonatomic, strong) UIButton* musicVideoBtn;
@property(nonatomic, strong) NSString* musicVideoURL;
@end

@implementation MusicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self UIInit];
    }
    
    return self;
}

- (void)UIInit
{
    [super UIInit];
    CGRect _frame = CGRectMake(self.thumbnail.frame.origin.x + self.thumbnail.frame.size.width, self.title.frame.origin.y+self.title.frame.size.height, self.contentView.frame.size.width-self.thumbnail.frame.size.width, self.frame.size.height - self.title.frame.size.height);
    self.musicVideoBtn = [UIButton buttonWithType:UIButtonTypeSystem];//[[UIButton alloc] initWithFrame:_frame];
    self.musicVideoBtn.frame = _frame;
    [self.musicVideoBtn addTarget:self action:@selector(musicButAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:self.musicVideoBtn];
}

-(void) setCardInfo:(Music *) mu
{
    [super setCardInfo:mu.title thumbnail:mu.imageURL];
    [self.musicVideoBtn setTitle:mu.musicVideoURL forState:UIControlStateNormal];
    self.musicVideoURL = mu.musicVideoURL;
}

- (void) musicButAction:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ViewMusicVideo:)]) {
        [self.delegate ViewMusicVideo:self.musicVideoURL];
    }
}

@end
