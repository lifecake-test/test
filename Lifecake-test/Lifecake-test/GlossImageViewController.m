//
//  GlossImageViewController.m
//  Lifecake-test
//
//  Created by Artjom Popov on 04/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import "GlossImageViewController.h"
#import "MemoryUtils.h"

#import <SDWebImageManager.h>
#import <SDWebImageOperation.h>

@interface GlossImageViewController ()

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) id <SDWebImageOperation> imageOperation;

@end

@implementation GlossImageViewController

- (id)initWithImageURL:(NSURL *)url {
  self = [super init];

  if (self) {
    self.imageURL = url;
  }
  
  return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationController.navigationBarHidden = YES;
  
  // load image
  self.imageOperation = [[SDWebImageManager sharedManager] downloadImageWithURL:self.imageURL options:SDWebImageRefreshCached | SDWebImageCacheMemoryOnly progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    
    // add gloss effect
    [self addGlossEffectToImage:image];
  }];
}

#pragma mark - Actions

- (IBAction)closeButtonPressed:(id)sender {
  // finish image loading
  [self.imageOperation cancel];
  [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  
  [MemoryUtils printFreeMemory];
}

#pragma mark -

- (void)addGlossEffectToImage:(UIImage *)image  {
  UIImage *newImage = nil;
  
  if (image) {
    int width = image.size.width;
    int height = image.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void *data = malloc(sizeof(UInt8) * width * height * 4);
    
    CGContextRef context = CGBitmapContextCreate(data, width, height, 8, 4 * width, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0.0F, 0.0F, width, height);
    
    CGContextDrawImage(context, rect, image.CGImage);
    
    CGContextSetRGBFillColor (context, 1.0F, 1.0F, 1.0F, 0.15F);
    CGContextFillRect (context, CGRectMake(0.0F, 0.0F, width, height));
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    newImage = [UIImage imageWithCGImage:imageRef];
  }
  
  self.imageView.image = newImage;
}

@end
