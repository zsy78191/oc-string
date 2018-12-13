//
//  oc_stringTests.m
//  oc-stringTests
//
//  Created by 张超 on 2018/12/13.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+oc_string.h"
#import "NSString+ios_foundation.h"
#import "NSArray+ios_foundation.h"

@interface oc_stringTests : XCTestCase

@end

@implementation oc_stringTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testString1 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString* string1 = @"sss";
    NSString* string2 = @"  \
    ";
    NSString* string3 = @"https://www.zhangzichuan.cn/asd/sdas?qweqwe=123123123#12353535";
    XCTAssertTrue([[string1 _md5String] isEqualToString:@"9f6e6800cfae7749eb6c486619254b9c"],"md5测试不相同");
    
    XCTAssertTrue([string1 _isNotBlank]);
    XCTAssertFalse([string2 _isNotBlank]);
    
    NSString* en = [string3 _urlEncodeString];
    NSString* af = [en _urlDecodeString];
    
    XCTAssertTrue([af isEqualToString:af]);
    
    NSString* b64 = [en _base64EncodedString];
    NSString* ab64 = [b64 _base64DecodedString];
    
    XCTAssertTrue([en isEqualToString:ab64]);
    
    NSString* html = @"<p>请在输入框内贴入你需要转换的HTML代码</p> <p>HTML转换工具，可以将HTML代码转换为HTML转义字符串</p> <p>直接将你所要用程序输出的大串HTML代码贴到输入框中，即可一键生成</p> <p>如果您觉得好用，请记得收藏我们的地址！</p>";
    XCTAssertTrue([[html _escapingHTMLString] isEqualToString:@"&lt;p&gt;请在输入框内贴入你需要转换的HTML代码&lt;/p&gt; &lt;p&gt;HTML转换工具，可以将HTML代码转换为HTML转义字符串&lt;/p&gt; &lt;p&gt;直接将你所要用程序输出的大串HTML代码贴到输入框中，即可一键生成&lt;/p&gt; &lt;p&gt;如果您觉得好用，请记得收藏我们的地址！&lt;/p&gt;"]);
    
    XCTAssertFalse([@"123asd" _containsString:@"13s"]);
    XCTAssertTrue([@"123asdfsd" _containsString:@"3a"]);
    
    XCTAssertTrue(@"nsstring@qq.com".match(@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"));
    
    XCTAssertTrue(@"18305207397".match(@"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$"));
    
    XCTAssertTrue(string3.match(@"[a-zA-z]+://[^\\s]*"));
    
    XCTAssertEqual(@"asd,123,123,asdf".matchWithRegex(@"\\d+").count, 2);
    
    XCTAssertTrue([@" asd ".trim() isEqualToString:@"asd"]);
    XCTAssertTrue([@"1324567".subString(1,3) isEqualToString:@"324"]);
}

- (void)testStirng2
{
    NSString* s = @"a";
    XCTAssertTrue([s.appending(@"123") isEqualToString:@"a123"]);
    XCTAssertTrue([s.appendingComponent(@"123") isEqualToString:@"a/123"]);
//    NSLog(@"%@", s.appendingComponent(@"424"));
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}
- (void)testArray
{
    NSString * t = @"1,3,4,5,3,2,6,3,3,4";
    XCTAssertEqual([t _split:@","].count, 10);
    
    NSArray* x = @[@"1",@"2",@"3"];
    XCTAssertTrue([x.join(@",") isEqualToString:@"1,2,3"]);
    
    XCTAssertTrue([x.reverse.join(@",") isEqualToString:@"3,2,1"]);
    
    XCTAssertTrue([x.map(^id _Nonnull(id  _Nonnull x) {
        return [NSString stringWithFormat:@"%@",@([x integerValue] * 2)];
    }).join(@"n") isEqualToString:@"2n4n6"]);
}

@end
