//
//  TableViewCell.m
//  Lifecake-test
//
//  Created by Artjom Popov on 02/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import "TableViewCell.h"

#import <SDWebImageManager.h>
#import <SDWebImageOperation.h>

@interface TableViewCell ()

@property (nonatomic) IBOutlet UILabel *randomLabel;
@property (nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic) IBOutlet UIImageView *thumbView;
@property (nonatomic, strong) id <SDWebImageOperation> imageOperation;

@end

@implementation TableViewCell

- (void)configureForURL:(NSURL *)url randomString:(NSString *)randomString {

  self.randomLabel.text = randomString;
  
  self.imageOperation = [[SDWebImageManager sharedManager] downloadImageWithURL:url options:SDWebImageRefreshCached | SDWebImageCacheMemoryOnly progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    self.thumbView.image = image;
  }];
}

@end
