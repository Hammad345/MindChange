//
//  Constant.h
//  DownloadManager
//
//  Created by Macbook Pro on 2/20/12.
//  Copyright (c) 2012 Jhay. All rights reserved.
//

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define RADIANS(degrees) ((degrees * M_PI) / 180.0) //used in upgradesviewcontroller

#define kKeyIsApproved @"keyApproved"

/* Settings Tab */
#define CELL_IMAGE_MAX_WIDTH 30.0f
#define CELL_IMAGE_MAX_HEIGHT 30.0f
#define CELL_IMAGE_CONRNER_RADIUS 8.0f

// AppID on iTunes Store
#define kAppIdFree @"1204293475" // done

#define kLinkAppFree @"https://itunes.apple.com/us/app/mind-change/id1204293475?ls=1&mt=8" // done
#define kLinkAppReviewFree_Old @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1204293475" // done
#define kLinkAppReviewFree_New @"itms-apps://itunes.apple.com/app/id1204293475" // done

//  Facebook Credentials
#define kFBAppLinkFree @"https://fb.me/661129247380510" // done

#define kAppFeedback @"test@gmail.com" // done


#define kUserHasOnboardedKey @"user_has_onboarded"

//
// Apps to promote
#define kPromoteeCount                  5
#define kFancyScreen_iTunes_ID          1100561713
#define kDesignYourScreen_iTunes_ID     1090633686
#define kiBrowserPlus_iTunes_ID         1084617321
#define kFancyLockScreen_iTunes_ID      1097454758
#define kKaranKhan_iTunes_ID            1105871584
