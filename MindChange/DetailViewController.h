//
//  DetailViewController.h
//  MindChange
//
//  Created by Xululabs on 24/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) UIImage *recviedImage;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;


-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;
-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;
-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;
-(void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

@end
