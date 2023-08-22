//
//  MiscTableViewController.h
//  MindChange
//
//  Created by Xululabs on 01/12/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface MiscTableViewController : UITableViewController <UIAlertViewDelegate, FBSDKSharingDelegate, FBSDKAppInviteDialogDelegate>

@property (nonatomic, strong) NSString      *passcode;
@property (nonatomic, assign) NSUInteger    failedAttempts;
@property (nonatomic, strong) NSDate        *lockUntilDate;

@end
