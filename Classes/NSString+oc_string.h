//
//  NSString+oc_string.h
//  oc-string
//
//  Created by 张超 on 2018/12/13.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (oc_string)

- (NSString*)_md5String;
- (NSString*)_sha1String;
- (NSString*)_base64EncodedString;
- (NSString*)_base64DecodedString;;
- (NSString*)_urlEncodeString;
- (NSString*)_urlDecodeString;
- (NSString*)_escapingHTMLString;
- (NSString*)_trimString;
- (BOOL)_isNotBlank;
- (BOOL)_containsString:(NSString*)string;
- (NSArray*)_split:(NSString*)string;

@end

NS_ASSUME_NONNULL_END
