//
//  PlaceCell.m
//  CardList
//
//  Created by Xinbo Wu on 7/8/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "PlaceCell.h"
#import "SDWebImageDownloader.h"
#import "UIImage+AverageColor.h"
#import "UIImage+ProportionalFill.h"

#pragma mark - Cell for Place card
@interface PlaceCell ()

@property(nonatomic, strong) UILabel* placeCategory;

@end

@implementation PlaceCell

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
    self.placeCategory = [[UILabel alloc] initWithFrame:_frame];
    [self addSubview:self.placeCategory];
}

-(void) setCardInfo:(Place *) pl
{
    self.title.text = pl.title;
    self.placeCategory.text = pl.placeCategory;
    
    [SDWebImageDownloader.sharedDownloader downloadImageWithURL:[NSURL URLWithString:pl.imageURL]
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
             __block UIImage *img = nil;
             __block UIColor *cl = nil;
             dispatch_queue_t queue = dispatch_queue_create("image.process.queue", DISPATCH_QUEUE_CONCURRENT);
             dispatch_async(queue, ^{
                 cl = [image averageColor];
             });
             dispatch_barrier_async(queue, ^{
                 img = [image imageCroppedToFitSize:self.thumbnail.frame.size];
             });
             dispatch_async(queue, ^{
                 dispatch_async(dispatch_get_main_queue(), ^{
                     self.backgroundColor = cl;
                     self.thumbnail.image = img;
                 });
                 
             });
         }
     }];
}

@end
