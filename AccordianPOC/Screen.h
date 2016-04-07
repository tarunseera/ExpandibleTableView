//
//  Description.h
//  NetVelocityConsumer
//
//  Created by admin on 16/07/15.
//  Copyright (c) 2015 Arvind Patidar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Screen : NSObject <NSCoding>

@property (nonatomic, strong, readwrite) NSString       *parentName;
@property (nonatomic, strong)            NSString       *parentVersion;
@property (nonatomic, strong)            NSString       *name;
@property (nonatomic, strong)            NSString       *version;
@property (nonatomic, strong)            NSString       *imgPath;
@property (nonatomic, strong)            NSMutableArray *childs;
@property (nonatomic, strong)            NSString       *strDescription;
@property (nonatomic, strong)            NSMutableArray *arrTouchPoint;
@property (nonatomic, strong)            NSString       *strGroupId;

@end
