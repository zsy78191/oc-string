//
//  NSArray+ios_foundation.h
//  ios-foundation
//
//  Created by 张超 on 2018/6/4.
//  Copyright © 2018年 gerinn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (ios_foundation)
{
    
}

@property (readonly) NSString* (^join)(NSString*);
@property (readonly) void (^each)(void (^)(id x));
@property (readonly) void (^eachWithindex)(void (^)(id x, NSUInteger idx));

- (NSArray*)reverse;
- (NSArray*)shuffle;
- (NSInteger)lenght;

@property (readonly) NSArray* (^map)(id (^)(id x));
@property (readonly) NSArray* (^filter)(BOOL (^)(id x));
@property (readonly) NSArray* (^flatten)(NSUInteger level);
@property (readonly) NSArray* (^ignore)(id x);
@property (readonly) NSArray* (^skip)(NSUInteger x);
@property (readonly) NSArray* (^take)(NSUInteger x);
@property (readonly) NSArray* (^push)(id);

- (id)pop;

@property (readonly) NSArray* (^insert)(id,NSUInteger);
@property (readonly) NSArray* (^remove)(id);
@property (readonly) NSArray* (^removeAt)(NSUInteger);

- (NSMutableArray*)m;

@end

@interface NSMutableArray (ios_foundation)

@property (readonly) void (^push)(id);
@property (readonly) id (^pop)(void);
@property (readonly) void (^reverse)(void);
@property (readonly) void (^insert)(id,NSUInteger);
@property (readonly) void (^remove)(id);
@property (readonly) void (^removeAt)(NSUInteger);

- (NSArray*)c;

@end

NS_ASSUME_NONNULL_END
