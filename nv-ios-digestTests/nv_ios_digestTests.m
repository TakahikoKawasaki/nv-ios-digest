/*
 * Copyright (C) 2013 Neo Visionaries Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


//----------------------------------------------------------------------
// Headers
//----------------------------------------------------------------------
#import "nv_ios_digestTests.h"
#import "MD5.h"
#import "SHA1.h"
#import "SHA224.h"
#import "SHA256.h"
#import "SHA384.h"
#import "SHA512.h"


//----------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------
@implementation nv_ios_digestTests


- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}


- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


- (void)doTest:(NSString *)input expected:(NSString *)expected md:(id)md
{
    // Get the digest value as string.
    NSString *output = [md description];

    // Message shown on failure.
    NSString *failure_description =
    [NSString stringWithFormat:@"expected='%@', output='%@'", expected, output];

    // Test
    STAssertEqualObjects(expected, output, failure_description);
}


- (void)testMD5
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"080aef839b95facf73ec599375e92d47";
    MD5 *md = [MD5 md5WithString:input];

    [self doTest:input expected:expected md:md];
}


- (void)testSHA1
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"2ae01472317d1935a84797ec1983ae243fc6aa28";
    SHA1 *md = [SHA1 sha1WithString:input];
    
    [self doTest:input expected:expected md:md];
}


- (void)testSHA224
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"8c542bb5ce6f0f7d14a923c0fa5fae295149953577f8506e095c5bda";
    SHA224 *md = [SHA224 sha224WithString:input];
    
    [self doTest:input expected:expected md:md];
}


- (void)testSHA256
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"f8c3bf62a9aa3e6fc1619c250e48abe7519373d3edf41be62eb5dc45199af2ef";
    SHA256 *md = [SHA256 sha256WithString:input];
    
    [self doTest:input expected:expected md:md];
}


- (void)testSHA384
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"4bb2e652882e450b2adc81c86745e19b98e3083a87eae5106ee9ae8f90a7ac814393e472056fdd5aeab312257898f681";
    SHA384 *md = [SHA384 sha384WithString:input];
    
    [self doTest:input expected:expected md:md];
}


- (void)testSHA512
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"ad0c37c31d69b315f3a81f13c8cde701094ad91725ba1b0dc3199ca9713661b8280d6ef7e68f133e6211e2e5a9a3150445d76f1708e04521b0ee034f0b0baf26";
    SHA512 *md = [SHA512 sha512WithString:input];
    
    [self doTest:input expected:expected md:md];
}


- (void)testChar
{
    NSString *input = @"Hello, world.";
    NSString *expected = @"080aef839b95facf73ec599375e92d47";

    MD5 *md = [[MD5 alloc] init];
    for (int i = 0; i < [input length]; ++i)
    {
        char c = (char)[input characterAtIndex:i];
        [md updateWithChar:c];
    }

    [md final];

    [self doTest:input expected:expected md:md];
}


@end
