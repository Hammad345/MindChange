//
//  ViewController.h
//  MindChange
//
//  Created by Xululabs on 08/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *sendImageButton;

@property (strong, nonatomic) IBOutlet UILabel      *color;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic)          NSArray      *colorArray;
@property (strong, nonatomic)          NSArray      *alphaArray;
@property (strong, nonatomic)          NSArray      *cardNamesArray;

@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;

- (IBAction)imageSendingButtonAction:(UIButton *)sender;

@end

