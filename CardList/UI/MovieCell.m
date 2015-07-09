//
//  MovieCell.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "MovieCell.h"
#import "SDWebImageDownloader.h"
#import "UIImage+ProportionalFill.h"

#pragma mark - Cell for Movie card

@interface MovieCell ()

@property(nonatomic, strong) UIImageView* movieExtraImageURL;

@end

@implementation MovieCell

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
    self.movieExtraImageURL = [[UIImageView alloc] initWithFrame:_frame];
    [self addSubview:self.movieExtraImageURL];
}

-(void) setCardInfo:(Movie *) mo
{
    [super setCardInfo:mo.title thumbnail:mo.imageURL];
    
    [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:mo.imageURL]
                                                        options:0
                                                       progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
         // progression tracking code
     }
                                                      completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
     {
         if (image && finished)
         {// do something with image
             self.movieExtraImageURL.image = [image imageCroppedToFitSize:self.thumbnail.frame.size];;
         }
     }];
}

@end

