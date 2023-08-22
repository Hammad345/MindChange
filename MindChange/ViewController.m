//
//  ViewController.m
//  MindChange
//
//  Created by Xululabs on 08/04/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "DataModelShareClass.h"
#import "Constant.h"

@interface ViewController () {
    UIImage *resultImage;
    NSDate *currentDate;
    NSDate *dateCompare;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Important Notice", nil)
                                                    message:NSLocalizedString(@"Read tutorial before you start", nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                                          otherButtonTitles:nil];
    [alert show];
    UIView * viewForPickerView1 = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, _pickerView.frame.size.width, _pickerView.frame.size.height)];
    [_pickerView addSubview:viewForPickerView1];

    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:29/400.0f green:38/400.0f blue:48/400.0f alpha:0];
    self.tabBarController.tabBar.tintColor = [UIColor orangeColor];

    _colorArray = [[NSArray alloc] initWithObjects:@"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight",@"Nine",@"Ten",@"Jack",@"Queen",@"King",@"Ace", nil];
    
    _alphaArray  = [[NSArray alloc] initWithObjects:@"♣️",@"♦️",@"♥️",@"♠️", nil];
    
    _cardNamesArray = [[NSMutableArray alloc]initWithObjects:@"2clubs.png",@"2diamonds.png",@"2hearts.png",@"2spades.png",@"3clubs.png",@"3diamonds.png",@"3hearts.png",@"3spades.png",@"4clubs.png",@"4diamonds.png",@"4hearts.png",@"4spades.png",@"5clubs.png",@"5diamonds.png",@"5hearts.png",@"5spades.png",@"6clubs.png",@"6diamonds.png",@"6hearts.png",@"6spades.png",@"7clubs.png",@"7diamonds.png",@"7hearts.png",@"7spades.png",@"8clubs.png",@"8diamonds.png",@"8hearts.png",@"8spades.png",@"9clubs.png",@"9diamonds.png",@"9hearts.png",@"9spades.png",@"10clubs.png",@"10diamonds.png",@"10hearts.png",@"10spades.png",@"jackClubs.png",@"jackDiamonds.png",@"jackHearts.png",@"jackSpades.png",@"queenClubs.png",@"queenDiamonds.png",@"queenHearts.png",@"queenSpades.png",@"kingClubs.png",@"kingDiamonds.png",@"kingHearts.png",@"kingSpades.png",@"aceClubs.png",@"aceDiamonds.png",@"aceHearts.png",@"aceSpades.png",nil];
    
    resultImage = [UIImage imageNamed:[_cardNamesArray objectAtIndex:0]];
}

#pragma mark - deful Methods -

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];

    UIImage *img = [UIImage imageNamed:@"logo2.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [imgView setImage:img];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:29/400.0f green:38/400.0f blue:48/400.0f alpha:0];
    [[UINavigationBar appearance] setTintColor:[UIColor orangeColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //Two columns
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    if(component== 0)
    {
        return [self.alphaArray count];
    }
    else
    {
        return [self.colorArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return [_alphaArray objectAtIndex:row];
    }
    else
    {
        return [_colorArray objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger firstComponentRow = [_pickerView selectedRowInComponent:0];
    NSInteger secondComponentRow = [_pickerView selectedRowInComponent:1];
    float alphaValue = 0;
    
    switch(firstComponentRow) {
        case 0:
            alphaValue = 0;
            break;
        case 1:
            alphaValue = 1;
            break;
        case 2:
            alphaValue = 2;
            break;
        case 3:
            alphaValue = 3;
            break;
       // case 4:
       //     alphaValue = 250.0f/255.0f;
       //     break;
        default:
            alphaValue = 250.0f/255.0f;
            break;
    }
    
    if (alphaValue == 0) {
        
        UIImage *imageFromTableview;
    switch(secondComponentRow)
    {
        case 0:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:0]];
        }break;
        case 1:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:4]];
        }break;
        case 2:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:8]];
        }break;
        case 3:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:12]];
        }break;
        case 4:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:16]];
        }break;
        case 5:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:20]];
        }break;
        case 6:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:24]];
        }break;
        case 7:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:28]];
        }break;
        case 8:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:32]];
        }break;
        case 9:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:36]];
        }break;
        case 10:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:40]];
        }break;
        case 11:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:44]];
        }break;
        case 12:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:48]];
        }break;
    }
        resultImage = imageFromTableview;
    }
    
    else if (alphaValue == 1){
    
        UIImage *imageFromTableview;
        switch(secondComponentRow)
        {
        case 0:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:1]];
        }break;
        case 1:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:5]];
        }break;
        case 2:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:9]];
        }break;
        case 3:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:13]];
        }break;
        case 4:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:17]];
        }break;
        case 5:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:21]];
        }break;
        case 6:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:25]];
        }break;
        case 7:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:29]];
        }break;
        case 8:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:33]];
        }break;
        case 9:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:37]];
        }break;
        case 10:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:41]];
        }break;
        case 11:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:45]];
        }break;
        case 12:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:49]];
        }break;
        }
        resultImage = imageFromTableview;
    }

    else if (alphaValue == 2){
        UIImage *imageFromTableview;
        switch(secondComponentRow) {
        case 0:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:2]];
        }break;
        case 1:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:6]];
        }break;
        case 2:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:10]];
        }break;
        case 3:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:14]];
        }break;
        case 4:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:18]];
        }break;
        case 5:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:22]];
        }break;
        case 6:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:26]];
        }break;
        case 7:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:30]];
        }break;
        case 8:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:34]];
        }break;
        case 9:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:38]];
        }break;
        case 10:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:42]];
        }break;
        case 11:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:46]];
        }break;
        case 12:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:50]];
        }break;
        }
        resultImage = imageFromTableview;
    }
    
    else if (alphaValue == 3){
        UIImage *imageFromTableview;
        switch(secondComponentRow)
        {
        case 0:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:3]];
        }break;
        case 1:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:7]];
        }break;
        case 2:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:11]];
        }break;
        case 3:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:15]];
        }break;
        case 4:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:19]];
        }break;
        case 5:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:23]];
        }break;
        case 6:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:27]];
        }break;
        case 7:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:31]];
        }break;
        case 8:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:35]];
        }break;
        case 9:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:39]];
        }break;
        case 10:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:43]];
        }break;
        case 11:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:47]];
        }break;
        case 12:{
        imageFromTableview = [UIImage imageNamed:[self.cardNamesArray objectAtIndex:51]];
        }break;
        }
        resultImage = imageFromTableview;
    }
}

- (IBAction)imageSendingButtonAction:(UIButton *)sender {
    DataModelShareClass *manager = [DataModelShareClass sharedDataMethode];
    NSArray* imageArray = manager.imageDataDict.allValues;
    if (imageArray.count == 0) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Sorry", nil)
                                                    message:NSLocalizedString(@"Select a background image First from Setting", nil)
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"Done", nil)
                                          otherButtonTitles:nil];
    [alert show];

    }
    else {
        [self performSegueWithIdentifier:@"DetailViewController" sender:nil];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImage *)sender {
    if ([[segue identifier] isEqualToString:@"DetailViewController"]) {
        DetailViewController *destinationView = (DetailViewController*)segue.destinationViewController;
        destinationView.recviedImage = resultImage;
    }
}

@end
