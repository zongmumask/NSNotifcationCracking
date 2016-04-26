//
//  HHNotificationCenter.h
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHNotification.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHNotificationCenter : NSObject

+ (HHNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)postNotification:(HHNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;

- (id <NSObject>)addObserverForName:(nullable NSString *)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(HHNotification *note))block NS_AVAILABLE(10_6, 4_0);

@end

NS_ASSUME_NONNULL_END
