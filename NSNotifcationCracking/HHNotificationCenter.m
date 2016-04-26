//
//  HHNotificationCenter.m
//  NSNotifcationCracking
//
//  Created by Daniel_Hu on 4/23/16.
//  Copyright © 2016 mask. All rights reserved.
//

#import "HHNotificationCenter.h"

typedef void(^OperationBlock)(HHNotification *notification);

@interface HHObserverModel : NSObject

@property (nonatomic, strong) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, copy) NSString *notificationName;
@property (nonatomic, strong) id object;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, copy) OperationBlock block;

@end

@implementation HHObserverModel


@end

@interface HHNotificationCenter ()

@property (nonatomic, strong) NSMutableArray *observers;

@end

@implementation HHNotificationCenter

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Cannot be involked" reason:@"Singleton" userInfo:nil];
}

+ (HHNotificationCenter *)defaultCenter
{
    static HHNotificationCenter *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] initSingleton];
    });
    return singleton;
}

- (instancetype)initSingleton
{
    if ([super init]) {
        _observers = [NSMutableArray array];
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    HHObserverModel *observerModel = [[HHObserverModel alloc] init];
    observerModel.observer = observer;
    observerModel.selector = aSelector;
    observerModel.notificationName = aName;
    observerModel.object = anObject;
    [self.observers addObject:observerModel];
}

- (void)postNotification:(HHNotification *)notification
{
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HHObserverModel *observerModel = obj;
        id observer = observerModel.observer;
        SEL selector = observerModel.selector;
        if (!observerModel.operationQueue) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [observer performSelector:selector withObject:notification];
#pragma clang diagnostic pop
        } else {
            NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                observerModel.block(notification);
            }];
            NSOperationQueue *operationQueue = observerModel.operationQueue;
            [operationQueue addOperation:operation];
        }
    }];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject
{
    [self postNotificationName:aName object:anObject userInfo:nil];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    HHNotification *notification = [[HHNotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotification:notification];
}

- (void)removeObserver:(id)observer
{
    [self removeObserver:observer name:nil object:nil];
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject
{
    [self.observers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HHObserverModel *observerModel = obj;
        if (observerModel.observer == observer && [observerModel.notificationName isEqualToString:aName] && observerModel.object == anObject) {
            [self.observers removeObject:observerModel];
            *stop = YES;
        }
    }];
}

- (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(HHNotification * _Nonnull))block
{
    HHObserverModel *observerModel = [[HHObserverModel alloc] init];
    observerModel.notificationName = name;
    observerModel.object = obj;
    observerModel.operationQueue = queue;
    observerModel.block = block;
    [self.observers addObject:observerModel];
    return nil;
}
@end
