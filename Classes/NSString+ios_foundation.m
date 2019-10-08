//
//  NSString+ios_foundation.m
//  ios-foundation
//
//  Created by 张超 on 2018/6/4.
//  Copyright © 2018年 gerinn. All rights reserved.
//

#import "NSString+ios_foundation.h"
//@import YYKit;
@import RegexKitLite;
#import "NSString+YYAdd.h"

@implementation NSString (ios_foundation)

- (NSString *(^)(void))l
{
    return [self localized];
}

- (NSString *(^)(void))localized
{
    return ^ {
        return NSLocalizedString(self, nil);
    };
}

- (NSString *(^)(NSString *))localizedFromTable
{
    return ^ (NSString* table){
        return NSLocalizedStringFromTable(self, table, nil);
    };
}

- (NSArray *(^)(NSString *))split
{
    return ^ (NSString* s){
        return [self componentsSeparatedByString:s];
    };
}

#pragma mark - hash

- (NSString *(^)(void))md5
{
    return ^ {
        return [self md5String];
    };
}

- (NSString *(^)(void))sha1
{
    return ^ {
        return [self sha1String];
    };
}

- (NSString *(^)(void))sha512
{
    return ^ {
        return [self sha512String];
    };
}

- (NSString *(^)(NSString *))hmac_md5
{
    return ^(NSString * sault) {
        return [self hmacMD5StringWithKey:sault];
    };
}

- (NSString *(^)(NSString *))hmac_sha1
{
    return ^(NSString * sault) {
        return [self hmacSHA1StringWithKey:sault];
    };
}

- (NSString *(^)(NSString *))hmac_sha512
{
    return ^(NSString * sault) {
        return [self hmacSHA512StringWithKey:sault];
    };
}

#pragma mark - encode

- (NSString *(^)(void))base64
{
    return ^ {
        return [self base64EncodedString];
    };
}

- (NSString *(^)(void))URLEncode
{
    return ^ {
        return [self stringByURLEncode];
    };
}

- (NSString *(^)(void))URLDecode
{
    return ^ {
        return [self stringByURLDecode];
    };
}

#pragma mark - regex

- (BOOL (^)(NSString *))match
{
    return ^ (NSString * regex){
        return [self matchesRegex:regex options:NSRegularExpressionCaseInsensitive];
    };
}

- (BOOL (^)(NSString *,NSRegularExpressionOptions))matchWithOptions
{
    return ^ (NSString * regex,NSRegularExpressionOptions o){
        return [self matchesRegex:regex options:o];
    };
}

- (NSArray *(^)(NSString *))splitWithRegex
{
    return ^ (NSString * regex){
        return [self componentsSeparatedByRegex:regex];
    };
}

- (NSArray *(^)(NSString *))matchWithRegex
{
    return ^ (NSString * regex){
        return [self componentsMatchedByRegex:regex];
    };
}

#pragma mark - other

- (NSString *(^)(void))trim
{
    return ^  {
        return [self stringByTrim];
    };
}

+ (NSString *(^)(void))UUID
{
    return ^{
        return [NSString stringWithUUID];
    };
}

- (NSData *(^)(void))data
{
    return ^{
        return [self dataUsingEncoding:NSUTF8StringEncoding];
    };
}

- (id (^)(void))jsonDecode
{
    return ^{
        return [self jsonValueDecoded];
    };
}

#pragma mark - substring

- (NSString *(^)(NSInteger, NSInteger))subString
{
    return ^(NSInteger b, NSInteger e){
        NSInteger s = b;
        NSInteger f = e;
        if (s<0) {
            s = 0;
        }
        if (f>=self.length-1) {
            f = self.length - 1;
        }
        return [[self substringFromIndex:s] substringToIndex:f-s+1];
    };
}

#pragma mark - path

- (NSString *(^)(void))expanding
{
    return ^  {
        return [self stringByExpandingTildeInPath];
    };
}

- (NSString *(^)(NSString*))appending
{
    return ^ (NSString* a) {
        return [self stringByAppendingString:a];
    };
}

- (NSString *(^)(NSString*))appendingComponent
{
    return ^ (NSString* a) {
        return [self stringByAppendingPathComponent:a];
    };
}

@end
