//
//  CardCell.m
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "CardCell.h"
#import "CardData.h"
#import "SDWebImageDownloader.h"
#import "UIImage+ProportionalFill.h"

@interface CardCell ()

@end

#define CELL_SIZE_HEIGTH   100

#define THUMBNAIL_SIZE_WIDTH    60
#define THUMBNAIL_SIZE_HEIGTH   60
#define TITLE_SIZE_HEIGTH  35


#pragma mark - base class of cell
@implementation CardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self UIInit];
    }
    
    return self;
}

//init the subview
- (void)UIInit
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, CELL_SIZE_HEIGTH);;
    CGRect _frame = CGRectMake(0, (self.frame.size.height-THUMBNAIL_SIZE_HEIGTH)/2, THUMBNAIL_SIZE_WIDTH, THUMBNAIL_SIZE_HEIGTH);
    self.thumbnail = [[UIImageView alloc] initWithFrame:_frame];
    [self addSubview:self.thumbnail];
    
    _frame = CGRectMake(_frame.origin.x + _frame.size.width, 0, self.contentView.frame.size.width - _frame.size.width, TITLE_SIZE_HEIGTH);
    self.title = [[UILabel alloc] initWithFrame:_frame];
    [self addSubview:self.title];
}

- (void) setCardInfo:(CardBase *) ba
{
    [self setCardInfo:ba.title thumbnail:ba.imageURL];
}

- (void) setCardInfo:(NSString *) titleName thumbnail:(NSString *)imgUrl
{
    self.title.text = titleName;
    
    [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:imgUrl]
                                                        options:0
                                                       progress:^(NSInteger receivedSize, NSInteger expectedSize)
     {
         // progression tracking code
     }
                                                      completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished)
     {
         if (image && finished)
         {  // do something with image
             self.thumbnail.image = [image imageCroppedToFitSize:self.thumbnail.frame.size];
         }
     }];
}

@end
