//
//  SettingViewController.h
//  MindChange
//
//  Created by Xululabs on 25/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController  < UIImagePickerControllerDelegate, UINavigationControllerDelegate >


@property (weak, nonatomic) IBOutlet UIButton *chooseImageButton;
@property (weak, nonatomic) IBOutlet UIButton *gestureButton;
@property (weak, nonatomic) IBOutlet UIButton *displayOptionButton;

@property (nonatomic, retain) UIImage *imageData;

@end
