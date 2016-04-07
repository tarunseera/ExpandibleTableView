//
//  Description.m
//  NetVelocityConsumer
//
//  Created by admin on 16/07/15.
//  Copyright (c) 2015 Prabhat Tomar. All rights reserved.
//

#import "Screen.h"

#define KEY_PARENT_NAME @"parentName"
#define KEY_PARENT_VERSION @"parentVersion"
#define KEY_NAME @"name"
#define KEY_IMGPATH @"imgPath"
#define KEY_CHILDS @"childs"
#define KEY_DESCRIPTION @"description"
#define KEY_VERSION @"version"
#define KEY_TOUCH_POINT @"arrTouchPoint"
#define KEY_GROUP_ID @"groupId"

@implementation Screen

@synthesize parentName;
@synthesize parentVersion;
@synthesize name;
@synthesize version;
@synthesize imgPath;
@synthesize childs;
@synthesize strDescription;
@synthesize arrTouchPoint;
@synthesize strGroupId;
-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:parentName forKey:KEY_PARENT_NAME];
    [aCoder encodeObject:parentVersion forKey:KEY_PARENT_VERSION];
    [aCoder encodeObject:name forKey:KEY_NAME];
    [aCoder encodeObject:version forKey:KEY_VERSION];
    [aCoder encodeObject:imgPath forKey:KEY_IMGPATH];
    [aCoder encodeObject:childs forKey:KEY_CHILDS];
    [aCoder encodeObject:strDescription forKey:KEY_DESCRIPTION];
    [aCoder encodeObject:arrTouchPoint forKey:KEY_TOUCH_POINT];
    [aCoder encodeObject:strGroupId forKey:KEY_GROUP_ID];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super init]){
        parentName     = [aDecoder decodeObjectForKey:KEY_PARENT_NAME];
        parentVersion  = [aDecoder decodeObjectForKey:KEY_PARENT_VERSION];
        name           = [aDecoder decodeObjectForKey:KEY_PARENT_NAME];
        version        = [aDecoder decodeObjectForKey:KEY_VERSION];
        imgPath        = [aDecoder decodeObjectForKey:KEY_IMGPATH];
        childs         = [aDecoder decodeObjectForKey:KEY_CHILDS];
        strDescription = [aDecoder decodeObjectForKey:KEY_DESCRIPTION];
        arrTouchPoint  = [aDecoder decodeObjectForKey:KEY_TOUCH_POINT];
        strGroupId     = [aDecoder decodeObjectForKey:KEY_GROUP_ID];
    }
    return self;
}

@end
