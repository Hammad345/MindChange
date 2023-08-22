//
//  DetailViewController.m
//  MindChange
//
//  Created by Xululabs on 24/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "DetailViewController.h"
#import "DataModelShareClass.h"

@interface DetailViewController () {
    int gestureValueSelected;
    int displayOptionValue;
    int count;
    int condition;
    NSArray *imageArray;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    singleTapGestureRecognizer.numberOfTouchesRequired = 3;
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:YES];
    [self dataFromModelShareClassMethode];
    count = 0;
    condition = 0;
    [self gestureSelectionFunctionCheck];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dataFromModelShareClassMethode {
    DataModelShareClass *manager = [DataModelShareClass sharedDataMethode];
    imageArray = manager.imageDataDict.allValues;
    self.backGroundImageView.image = [imageArray objectAtIndex:0];
    NSArray *allValuesOfGesture = manager.gestureValue.allValues;
    NSArray *displayOptionAllValues = manager.displayOptionValue.allValues;
    if (allValuesOfGesture.count == 0) {
        gestureValueSelected = 0;
    }
    else {
    NSString *gestureString = [allValuesOfGesture objectAtIndex:0];
   gestureValueSelected = [gestureString intValue];
    }
    
    if (displayOptionAllValues.count == 0) {
        displayOptionValue = 0;

    } else {
        NSString *displayString = [displayOptionAllValues objectAtIndex:0];
        displayOptionValue = [displayString intValue];
    }
}

-(void)gestureSelectionFunctionCheck {
    int gesture = gestureValueSelected;
    switch(gesture)
    {
        case 0:{
            NSLog(@"Shake methode implemented just shake the device");

        }break;
         case 1:{
            NSLog(@"proxmity sensor");
            [self addProximitySensorControl];
        }break;
         case 2:{
            NSLog(@"double tap");
            [self doubleTapFunctionMethode];
        }break;
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self conditionMethode];
    }
}

-(void)proximityChanged:(NSString*)str
{
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
    [self conditionMethode];
}

-(void)addProximitySensorControl {
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
     BOOL state = device.proximityState;
    if(state)
    {
        NSLog(@"YES");
    }
    else
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(proximityChanged:)
                                                     name:@"UIDeviceProximityStateDidChangeNotification"
                                                   object:nil];
    }
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doubleTapFunctionMethode {
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 1;
    doubleTapGestureRecognizer.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:doubleTapGestureRecognizer];
}
-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self conditionMethode];
}

-(void)conditionMethode {
    if (gestureValueSelected == 0  && displayOptionValue == 0) {
        [self fadeInFunctionMethode];
    }
    else if (gestureValueSelected == 0  && displayOptionValue == 1) {
        [self flipTopFunctionMethode];
    }
    else if (gestureValueSelected == 0  && displayOptionValue == 2) {
        [self flipBottomFunctionMethode];
    }
    else if (gestureValueSelected == 0  && displayOptionValue == 3) {
        [self flipRightFunctionMethode];
    }
    else if (gestureValueSelected == 0  && displayOptionValue == 4) {
        [self flipLeftFunctionMethode];
    }
    else if (gestureValueSelected == 0  && displayOptionValue == 5) {
        [self curlFunctionMethode];
    }
    
    else if (gestureValueSelected == 1  && displayOptionValue == 0) {
        [self fadeInFunctionMethode];
    }
    else if (gestureValueSelected == 1  && displayOptionValue == 1) {
        [self flipTopFunctionMethode];
    }
    else if (gestureValueSelected == 1  && displayOptionValue == 2) {
        [self flipBottomFunctionMethode];
    }
    else if (gestureValueSelected == 1  && displayOptionValue == 3) {
        [self flipRightFunctionMethode];
    }
    else if (gestureValueSelected == 1  && displayOptionValue == 4) {
        [self flipLeftFunctionMethode];
    }
    else if (gestureValueSelected == 1  && displayOptionValue == 5) {
        [self curlFunctionMethode];
    }
    
    else if (gestureValueSelected == 2  && displayOptionValue == 0) {
        [self fadeInFunctionMethode];
    }
    else if (gestureValueSelected == 2  && displayOptionValue == 1) {
        [self flipTopFunctionMethode];
    }
    else if (gestureValueSelected == 2  && displayOptionValue == 2) {
        [self flipBottomFunctionMethode];
    }
    else if (gestureValueSelected == 2  && displayOptionValue == 3) {
        [self flipRightFunctionMethode];
    }
    else if (gestureValueSelected == 2  && displayOptionValue == 4) {
        [self flipLeftFunctionMethode];
    }
    else if (gestureValueSelected == 2  && displayOptionValue == 5) {
        [self curlFunctionMethode];
    }
}

-(void)fadeInFunctionMethode {
    [self.ImageView setAlpha:0.0f];
    //fade in
    [UIView animateWithDuration:3.0f animations:^{
        [self.ImageView setAlpha:3.0f];
        self.ImageView.image = self.recviedImage;
     } completion:^(BOOL finished) {
         //fade out
         [UIView animateWithDuration:1.0f animations:^{
          }
                          completion:nil];
     }];
}

-(void)flipTopFunctionMethode {
    [UIView transitionWithView:self.ImageView
                      duration:3.0
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations: ^{
                        self.ImageView.image = self.recviedImage;
                    }
                    completion:NULL];
}

-(void)flipBottomFunctionMethode {
    [UIView transitionWithView:self.ImageView
                      duration:3.0
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations: ^{
                        self.ImageView.image = self.recviedImage;
                    }
                    completion:NULL];
}

-(void)flipRightFunctionMethode {
    [UIView transitionWithView:self.ImageView
                      duration:3.0
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations: ^{
                        self.ImageView.image = self.recviedImage;
                    }
                    completion:NULL];
}

-(void)flipLeftFunctionMethode {
    [UIView transitionWithView:self.ImageView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations: ^{
                        self.ImageView.image = self.recviedImage;
                    }
                    completion:NULL];
}

-(void)curlFunctionMethode {
    [UIView transitionWithView:self.ImageView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionCurlDown
                    animations:^ {
                        self.ImageView.image = self.recviedImage;
                      //  self.textView.alpha = 1.0;
                        
                    }
                    completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
