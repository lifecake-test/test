//
//  TableViewController.m
//  Lifecake-test
//
//  Created by Artjom Popov on 02/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "GlossImageViewController.h"

#import <SDWebImage/SDWebImageManager.h>

#define COUNT 10000

static NSString *kCellIdentifier = @"kCellIdentifier";

@interface TableViewController ()

@property (nonatomic, strong) NSArray *randomStrings;
@property (nonatomic, strong) NSArray *imageURLs;

@end

@implementation TableViewController

- (id)init {
  self = [super init];
  if (self) {
    self.imageURLs = @[@"http://www.hdwallpapersimages.com/wp-content/uploads/2014/01/Winter-Tiger-Wild-Cat-Images.jpg",
                       @"http://hdwallpapersfit.com/wp-content/uploads/2015/03/images-7.jpg",
                       @"http://images.panda.org/assets/images/pages/welcome/orangutan_1600x1000_279157.jpg",
                       @"http://www.esa.int/var/esa/storage/images/esa_multimedia/images/2014/12/multicoloured_view_of_supernova_remnant/15172784-1-eng-GB/Multicoloured_view_of_supernova_remnant_node_full_image_2.jpg"];
  }
  
  return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self loadRandomStrings];
  
  // prevent from keeping images in memory (no reason to keep them in this task)
  [SDWebImageManager sharedManager].imageCache.maxMemoryCost = 0;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:kCellIdentifier];
  [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return self.randomStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
  
  NSURL *url = [NSURL URLWithString:[self.imageURLs objectAtIndex:indexPath.row % self.imageURLs.count]];
  NSString *randomString = [self.randomStrings objectAtIndex:indexPath.row];
  
  [cell configureForURL:url randomString:randomString];
  
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSURL *url = [NSURL URLWithString:[self.imageURLs objectAtIndex:indexPath.row % self.imageURLs.count]];
  
  GlossImageViewController *glossController = [[GlossImageViewController alloc] initWithImageURL:url];
  [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:glossController] animated:YES completion:nil];
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -

- (NSString *)generateRandomString {
  return [NSString stringWithFormat:@"%li", (long)arc4random_uniform(100000)];
}

- (void)loadRandomStrings {
  // generate random strings
  // each string should be used only once
  
  CFTimeInterval startTime = CACurrentMediaTime();
  
  NSMutableArray *labels = [NSMutableArray array];
  NSString *rs = [self generateRandomString];
  
  for (int i = 0; i < COUNT; i++) {
    // generate random string
    [self generateRandomString];
    
    while ([labels containsObject:rs]) {
      rs = [self generateRandomString];
    }
    
    [labels addObject:rs];
  }
  
  self.randomStrings = labels;
  
  CFTimeInterval elapsedTime = CACurrentMediaTime() - startTime;
  NSLog(@"loading time: %f", elapsedTime);
}

@end
