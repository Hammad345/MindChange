//
//  DLView.h
//  Downloader
//
//  Created by Nobelyn Delacruz on 10/16/11.
//  Copyright (c) 2011 Jhay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLView : UIView {
    UIView              *_mainView;
    UIToolbar           *_toolbar;
    BOOL                _toolbarHidden;
    BOOL                _canHideToolbar;
    BOOL                _canHideTabbar;
    BOOL                _bannerHidden;
}

@property (nonatomic, assign) BOOL toolbarHidden;
@property (nonatomic, assign) BOOL canHideToolbar;
@property (nonatomic, assign) BOOL canHideTabbar;
@property (nonatomic, assign) BOOL bannerHidden;

- (void)setMainView:(UIView *)mainView;
- (void)setToolbar:(UIToolbar *)toolbar;

@end
