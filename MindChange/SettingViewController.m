//
//  SettingViewController.m
//  MindChange
//
//  Created by Xululabs on 25/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "SettingViewController.h"
#import "DataModelShareClass.h"
#import "Constant.h"

@interface SettingViewController ()
{
    NSDate *currentDate;
    NSDate *dateCompare;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:29/400.0f green:38/400.0f blue:48/400.0f alpha:0];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
}

#pragma mark - deful Methods -


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)imageFromLaibrary:(UIButton *)sender{
    UIButton *localButton = (UIButton *)sender;
    localButton.tag = 20;
    [self selectImageFromLibrary:localButton.frame];
}

-(void)selectImageFromLibrary:(CGRect)frameRect {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.imageData = [info objectForKey:UIImagePickerControllerOriginalImage];
     [picker dismissViewControllerAnimated:YES completion:^{
         [self recentImage];
     }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

- (void)recentImage {
    DataModelShareClass *manager = [DataModelShareClass sharedDataMethode];
    [manager.imageDataDict setObject:self.imageData forKey:@"image"];
}

@end
