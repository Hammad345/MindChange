//
//  DLView.m
//  Downloader
//
//  Created by Nobelyn Delacruz on 10/16/11.
//  Copyright (c) 2011 Jhay. All rights reserved.
//

#import "DLView.h"
#import "Constant.h"
#import "AppDelegate.h"

@implementation DLView

@synthesize toolbarHidden = _toolbarHidden;
@synthesize canHideToolbar = _canHideToolbar;
@synthesize canHideTabbar = _canHideTabbar;
@synthesize bannerHidden = _bannerHidden;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.canHideToolbar = NO;
    self.toolbarHidden = NO;
    self.canHideTabbar = NO;
    self.bannerHidden = YES;
    return self;
}

- (void)setMainView:(UIView *)mainView {
    _mainView = mainView;
    [self addSubview:_mainView];
}

- (void)setToolbar:(UIToolbar *)toolbar {
    _toolbar = toolbar;
    [self addSubview:_toolbar];
}

- (void)dealloc {
    _toolbar = nil;
}

@end
