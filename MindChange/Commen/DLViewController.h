//
//  DLViewController.h
//  Downloader
//
//  Created by Nobelyn Delacruz on 10/16/11.
//  Copyright (c) 2011 Jhay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLView.h"

@interface DLViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    DLView      *_dlView;
    UITableView *_tableView;
    UIToolbar   *_toolbar;
}

- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
