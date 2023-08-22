//
//  GestureTableViewController.h
//  MindChange
//
//  Created by Xululabs on 12/05/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StyleDelegate;

@interface GestureTableViewController : UITableViewController

@property (assign, nonatomic) NSUInteger style;

@property(weak, nonatomic) id<StyleDelegate> styleDelegate;
@end

@protocol StyleDelegate <NSObject>

- (void)styleDidChange:(NSUInteger)newStyle;

@end
