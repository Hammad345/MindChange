//
//  DLViewController.m
//  Downloader
//
//  Created by Nobelyn Delacruz on 10/16/11.
//  Copyright (c) 2011 Jhay. All rights reserved.
//

#import "DLViewController.h"
#import "Constant.h"

@implementation DLViewController

- (id)init {
    return [super init];
}


- (void)setToolbarHidden:(BOOL)hidden animated:(BOOL)animated {
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
    }
    _dlView.toolbarHidden = hidden;
    [_dlView layoutSubviews];
    if (animated) {
        [UIView commitAnimations];
    }
}

- (void)setBannerHidden:(BOOL)hidden animated:(BOOL)animated; {
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
    }
//    if (hidden) {
//        if (banner) {
//            [banner.view removeFromSuperview];
//            [banner release];
//            banner = nil;
//        }
//    } else {
//        if (banner == nil) {
////            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
////                banner = [[BannerViewController alloc]initWithNibName:@"BannerViewController-iPad" bundle:nil];
////            }
////            else {
//                banner = [[BannerViewController alloc]initWithNibName:@"BannerViewController" bundle:nil];
////            }
//            
//            [_dlView addSubview:banner.view];
//
//            banner.view.frame = CGRectMake(0.0f, 0.0f, _dlView.bounds.size.width, banner.view.frame.size.height);
//        }   
//        
//        [banner startRandomAd];
//    }
    
    _dlView.bannerHidden = hidden;
    [_dlView layoutSubviews];
    
    if (animated) {
        [UIView commitAnimations];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;//[self.selectedViewController supportedInterfaceOrientations];
}

- (UIView *)rotatingFooterView {
    return _toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    //remove observer
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
