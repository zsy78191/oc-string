//
//  NSString+ios_foundation.h
//  ios-foundation
//
//  Created by 张超 on 2018/6/4.
//  Copyright © 2018年 gerinn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ios_foundation)

@property (nonatomic,readonly) NSString* (^l)(void);
@property (nonatomic,readonly) NSString* (^localized)(void);
@property (nonatomic,readonly) NSString* (^localizedFromTable)(NSString* table);
@property (nonatomic,readonly) NSArray* (^split)(NSString* table);


#pragma mark - hash

@property (nonatomic,readonly) NSString* (^md5)(void);
@property (nonatomic,readonly) NSString* (^sha1)(void);
@property (nonatomic,readonly) NSString* (^sha512)(void);

@property (nonatomic,readonly) NSString* (^hmac_md5)(NSString* sault);
@property (nonatomic,readonly) NSString* (^hmac_sha1)(NSString* sault);
@property (nonatomic,readonly) NSString* (^hmac_sha512)(NSString* sault);

#pragma mark - encode

@property (nonatomic,readonly) NSString* (^base64)(void);
@property (nonatomic,readonly) NSString* (^URLEncode)(void);
@property (nonatomic,readonly) NSString* (^URLDecode)(void);

#pragma mark - regex

@property (nonatomic,readonly) BOOL (^match)(NSString* regex);
@property (nonatomic,readonly) BOOL (^matchWithOptions)(NSString* regex,NSRegularExpressionOptions options);
@property (nonatomic,readonly) NSArray* (^splitWithRegex)(NSString* regex);
@property (nonatomic,readonly) NSArray* (^matchWithRegex)(NSString* regex);


#pragma mark - other

@property (nonatomic,readonly) NSString* (^trim)(void);
@property (nonatomic,readonly,class) NSString* (^UUID)(void);
@property (nonatomic,readonly) NSData* (^data)(void);
@property (nonatomic,readonly) id (^jsonDecode)(void);

#pragma mark - substring

@property (nonatomic,readonly) NSString* (^subString)(NSInteger b,NSInteger e);

#pragma mark - path

@property (nonatomic,readonly) NSString* (^expanding)(void);
@property (nonatomic,readonly) NSString* (^appending)(NSString*);
@property (nonatomic,readonly) NSString* (^appendingComponent)(NSString*);

@end

NS_ASSUME_NONNULL_END
