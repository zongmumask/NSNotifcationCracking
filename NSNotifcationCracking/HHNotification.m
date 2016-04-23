//
//  HHNotification.m
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import "HHNotification.h"

@implementation HHNotification

- (instancetype)initWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    return nil;
}

+ (instancetype)notificationWithName:(NSString *)aName object:(id)anObject
{
    return [self notificationWithName:aName object:anObject userInfo:nil];
}

@end
