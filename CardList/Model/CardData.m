//
//  CardData.m
//  CardList
//
//  Created by Xinbo Wu on 7/7/15.
//  Copyright (c) 2015 Xinbo Wu. All rights reserved.
//

#import "CardData.h"
#import "AFHTTPRequestOperationManager.h"

#define CARD_DATA_URL @"https://gist.githubusercontent.com/helloandrewpark/0a407d7c681b833d6b49/raw/5f3936dd524d32ed03953f616e19740bba920bcd/gistfile1.js"

@interface CardData ()

@property (nonatomic, strong) NSMutableArray* carddata;

@end

@implementation CardData

- (NSMutableArray*) getCardData
{
    return self.carddata;
}

- (void)downloadCardData
{
    //Create HTTP request with URL
    NSURL *URL = [NSURL URLWithString:CARD_DATA_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray* _d = [[NSMutableArray alloc] init];
        [responseObject[@"cards"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            
            if ([obj[KEY_CARD_TYPE] isEqualToString:KEY_CARD_TYPE_PLACE]) {
                Place* pl = [[Place alloc] initWithDictionary:obj];
                if (pl) {
                    [_d addObject:pl];
                }
            }else if ([obj[KEY_CARD_TYPE] isEqualToString:KEY_CARD_TYPE_MOVIE]){
                Movie* mo = [[Movie alloc] initWithDictionary:obj];
                if (mo) {
                    [_d addObject:mo];
                }
            }else if ([obj[KEY_CARD_TYPE] isEqualToString:KEY_CARD_TYPE_MUSIC])
            {
                Music* mu = [[Music alloc] initWithDictionary:obj];
                if (mu) {
                    [_d addObject:mu];
                }
            }
        }];
        self.carddata = [_d copy];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}
                        
@end
