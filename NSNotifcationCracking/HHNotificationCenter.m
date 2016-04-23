//
//  HHNotificationCenter.m
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import "HHNotificationCenter.h"

@implementation HHNotificationCenter

+ (HHNotificationCenter *)defaultCenter
{
    return nil;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    
}

- (void)postNotification:(NSNotification *)notification
{
    
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject
{
    [self postNotificationName:aName object:anObject userInfo:nil];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    
}

- (void)removeObserver:(id)observer
{
    
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject
{
    
}

- (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification * _Nonnull))block
{
    return nil;
}
@end
