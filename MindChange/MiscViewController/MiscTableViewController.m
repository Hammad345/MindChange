//
//  MiscTableViewController.m
//  MindChange
//
//  Created by Xululabs on 01/12/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "MiscTableViewController.h"
#import "DAAppsViewController.h"
#import <AudioToolbox/AudioServices.h>
#import "Constant.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Foundation/Foundation.h>

@interface MiscTableViewController () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *sectionFirstArray;
@property (nonatomic, strong) NSMutableArray *sectionSecondArray;
@property (nonatomic, strong) NSMutableArray *sectionThirdArray;
@property (nonatomic, strong) NSMutableArray *sectionFourthArray;

@end

@implementation MiscTableViewController

#pragma mark - Default Init Method -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Misc"];

    self.sectionFirstArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.sectionSecondArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.sectionSecondArray addObject:@"Feedback and Bug Reporting"];
    
    self.sectionThirdArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.sectionThirdArray addObject:@"Tell a Friend"];
    [self.sectionThirdArray addObject:@"Share on Twitter"];
    [self.sectionThirdArray addObject:@"Share on Facebook"];
    [self.sectionThirdArray addObject:@"Invite FB Friends"];
    
    self.sectionFourthArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.sectionFourthArray addObject:@"Rate and Review"];
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource Method -

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
       
        case 0: {
            UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.sectionSecondArray objectAtIndex:indexPath.row]];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
            
            break;
        }
        case 1: {
            UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.sectionThirdArray objectAtIndex:indexPath.row]];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            
            return cell;
            break;
        }
        case 2: {
            UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.sectionFourthArray objectAtIndex:indexPath.row]];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            
            return cell;
            break;
        }
        default:
            break;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate Method -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [self sendEmailForSelectedOption:indexPath.row];
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NSString *appNameString = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
            if ([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                mailViewController.mailComposeDelegate = self;
                [mailViewController performSelector:@selector(setSubject:) withObject:[NSString stringWithFormat:@"Please Try %@ for iPhone/iPad", appNameString]];
                [mailViewController performSelector:@selector(setToRecipients:) withObject:[NSArray arrayWithObject:@""]];
                [mailViewController performSelector:@selector(setMessageBody:isHTML:) withObject:[NSString stringWithFormat:@"My Dear Friend, I am using %@, and it's really useful.\n%@", appNameString, kLinkAppFree] withObject:NO];
                
                if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
                    [mailViewController setModalPresentationStyle:UIModalPresentationFormSheet];
                    [self presentViewController:mailViewController animated:YES completion:NULL];
                }
                else {
                    [self presentViewController:mailViewController animated:YES completion:NULL];
                }
            }
        }
        else if (indexPath.row == 1) {
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                [tweet setInitialText:@"I just downloaded this awesome app."];
                [tweet addURL:[NSURL URLWithString:kLinkAppFree]];
                [tweet setCompletionHandler:^(SLComposeViewControllerResult result) {
                    if (result == SLComposeViewControllerResultCancelled) {
                        NSLog(@"The user cancelled.");
                    }
                    else if (result == SLComposeViewControllerResultDone) {
                        NSLog(@"The user sent the tweet");
                    }
                }];
                [self presentViewController:tweet animated:YES completion:nil];
            }
            else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter"
                                                                message:@"Twitter integration is not available.  A Twitter account must be set up on your device."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        } else if (indexPath.row == 2){
            FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
            NSString *shareLinkApp = kLinkAppFree;
            content.contentURL = [NSURL URLWithString:shareLinkApp];
            [FBSDKShareDialog showFromViewController:self
                                         withContent:content
                                            delegate:nil];
        } else if (indexPath.row == 3){
            FBSDKAppInviteContent *content =[[FBSDKAppInviteContent alloc] init];
            NSString *inviteLinkApp = kFBAppLinkFree;
            content.appLinkURL = [NSURL URLWithString:inviteLinkApp];
            // present the dialog. Assumes self implements protocol `FBSDKAppInviteDialogDelegate`
            [FBSDKAppInviteDialog showFromViewController:self
                                             withContent:content
                                                delegate:self];
            
        }
    }
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            NSString *linkApp = kLinkAppReviewFree_New;
            if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
                linkApp = kLinkAppReviewFree_Old;
            }
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkApp]];
        }
        if (indexPath.row == 1) {
            [self performSegueWithIdentifier:@"DAAppsViewController" sender:nil];
        }
    }
}

#pragma mark - Class Instance Method -

-(void) sendEmailForSelectedOption:(NSInteger)selectedRow {
    NSString *appNameString = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        
        if (selectedRow == 0) {
            [mailViewController performSelector:@selector(setSubject:) withObject:@"Feedback and Bug Reporting"];
            [mailViewController performSelector:@selector(setToRecipients:) withObject:[NSArray arrayWithObject:kAppFeedback]];
            [mailViewController performSelector:@selector(setMessageBody:isHTML:) withObject:
             [NSString stringWithFormat:@"\n\n\nIn order for us to better help you, please provide the following information:\n\n\n Device Model: %@ \nOS Version: %@ %@ \nApp Name: %@ \nApp Version: %@ ",
              [[UIDevice currentDevice] model],
              [[UIDevice currentDevice] systemName],
              [[UIDevice currentDevice] systemVersion],
              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"],
              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
                                     withObject:NO];
        }
        else if (selectedRow == 1) {
            [mailViewController performSelector:@selector(setSubject:) withObject:[NSString stringWithFormat:@"Please Try %@ for iPhone/iPad", appNameString]];
            [mailViewController performSelector:@selector(setToRecipients:) withObject:[NSArray arrayWithObject:@""]];
            [mailViewController performSelector:@selector(setMessageBody:isHTML:) withObject:[NSString stringWithFormat:@"My Dear Friend, I am using %@, and it's really useful.\n%@", appNameString, kLinkAppFree] withObject:NO];
        }
        
        // the following should be fully backwards compatible.
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
            [mailViewController setModalPresentationStyle:UIModalPresentationFormSheet];
            [self presentViewController:mailViewController animated:YES completion:NULL];
        }
        else {
            [self presentViewController:mailViewController animated:YES completion:NULL];
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - FBSDKSharingDelegate -

- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
    NSLog(@"completed share:%@", results);
}

- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
    NSLog(@"sharing error:%@", error);
    NSString *message = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?:
    @"There was a problem sharing, please try again later.";
    NSString *title = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops!";
    
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
    NSLog(@"share cancelled");
}

#pragma mark - FBSDKAppInviteDialogDelegate

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didCompleteWithResults:(NSDictionary *)results {
}

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didFailWithError:(NSError *)error {
}

#pragma mark - Navigation Based Method -

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DAAppsViewController"]) {
        DAAppsViewController *appsViewController = segue.destinationViewController;
        
       // [appsViewController loadAppsWithArtistId:kArtistID completionBlock:nil];
    }
}

#pragma mark - Default De-Init Method -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
