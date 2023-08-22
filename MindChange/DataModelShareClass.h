//
//  DataModelShareClass.h
//  MindChange
//
//  Created by Xululabs on 10/05/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataModelShareClass : NSObject

@property (nonatomic,strong) NSMutableDictionary   *imageDataDict;
@property (nonatomic,strong) NSMutableDictionary   *gestureValue;
@property (nonatomic,strong) NSMutableDictionary   *displayOptionValue;


+(DataModelShareClass *)sharedDataMethode;

@end