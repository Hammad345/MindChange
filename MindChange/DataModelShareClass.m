//
//  DataModelShareClass.m
//  MindChange
//
//  Created by Xululabs on 10/05/2016.
//  Copyright © 2016 Xululabs. All rights reserved.
//

#import "DataModelShareClass.h"

@implementation DataModelShareClass
@synthesize imageDataDict , gestureValue , displayOptionValue;

+(DataModelShareClass *)sharedDataMethode
{
    static DataModelShareClass *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        imageDataDict = [[NSMutableDictionary alloc]init];
        gestureValue = [[NSMutableDictionary alloc]init];
        displayOptionValue = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)dealloc {
}

@end

