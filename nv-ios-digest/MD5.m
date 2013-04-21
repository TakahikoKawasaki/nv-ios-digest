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
#import "MD5.h"


//----------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------
@implementation MD5
{
    CC_MD5_CTX _context;
    unsigned char _digest[CC_MD5_DIGEST_LENGTH];
    NSString *_description;
}


- (NSString *)description
{
    return _description;
}


- (void)reset
{
    CC_MD5_Init(&_context);

    memset(_digest, 0, sizeof(_digest));

    _description = @"'final' not called";
}


- (int)updateWith:(const void *)data length:(CC_LONG)length
{
    if (data == NULL)
    {
        return 0;
    }

    return CC_MD5_Update(&_context, data, length);
}


- (unsigned char *)final
{
    CC_MD5_Final(_digest, &_context);

    _description = [NSString stringWithFormat:
                    @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    _digest[ 0], _digest[ 1], _digest[ 2], _digest[ 3],
                    _digest[ 4], _digest[ 5], _digest[ 6], _digest[ 7],
                    _digest[ 8], _digest[ 9], _digest[10], _digest[11],
                    _digest[12], _digest[13], _digest[14], _digest[15]];

    return _digest;
}


- (unsigned char *)buffer
{
    return _digest;
}


- (size_t)bufferSize
{
    return sizeof(_digest);
}


+ (MD5 *)md5WithString:(NSString *)string
{
    MD5 *md = [[MD5 alloc] init];

    [md updateWithString:string];
    [md final];

    return md;
}


@end
