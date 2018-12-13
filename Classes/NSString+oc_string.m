//
//  NSString+oc_string.m
//  oc-string
//
//  Created by 张超 on 2018/12/13.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "NSString+oc_string.h"
@import RegexKitLite;
@import YYKit;

@implementation NSString (oc_string)

- (NSString*)_md5String
{
    return [self md5String];
}

- (NSString*)_sha1String
{
    return [self sha1String];
}

- (NSString*)_base64EncodedString
{
    return [self base64EncodedString];
}

- (NSString*)_base64DecodedString;
{
    return [NSString stringWithBase64EncodedString:self];
}

- (NSString*)_urlEncodeString
{
    return [self stringByURLEncode];
}

- (NSString*)_urlDecodeString
{
    return [self stringByURLDecode];
}

- (NSString*)_escapingHTMLString
{
    return [self stringByEscapingHTML];
}

- (NSString*)_trimString
{
    return [self stringByTrim];
}

- (BOOL)_isNotBlank
{
    return [self isNotBlank];
}

- (BOOL)_containsString:(NSString*)string
{
    return [self containsString:string];
}

+ (NSString*)_uuidString
{
    return [NSString stringWithUUID];
}

- (NSArray*)_split:(NSString*)string
{
    return [self componentsSeparatedByString:string];
}





@end
