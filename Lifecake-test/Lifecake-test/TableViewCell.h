//
//  TableViewCell.h
//  Lifecake-test
//
//  Created by Artjom Popov on 02/05/15.
//  Copyright (c) 2015 Artjom Popov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

- (void)configureForURL:(NSURL *)url
           randomString:(NSString *)randomString;

@end
