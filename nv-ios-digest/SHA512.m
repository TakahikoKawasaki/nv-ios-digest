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
#import "SHA512.h"


//----------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------
@implementation SHA512
{
    CC_SHA512_CTX _context;
    unsigned char _digest[CC_SHA512_DIGEST_LENGTH];
    NSString *_description;
}


- (NSString *)description
{
    return _description;
}


- (void)reset
{
    CC_SHA512_Init(&_context);

    memset(_digest, 0, sizeof(_digest));

    _description = @"'final' not called";
}


- (int)updateWith:(const void *)data length:(CC_LONG)length
{
    if (data == NULL)
    {
        return 0;
    }
    
    return CC_SHA512_Update(&_context, data, length);
}


- (unsigned char *)final
{
    CC_SHA512_Final(_digest, &_context);

    _description = [NSString stringWithFormat:
                    @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    _digest[ 0], _digest[ 1], _digest[ 2], _digest[ 3],
                    _digest[ 4], _digest[ 5], _digest[ 6], _digest[ 7],
                    _digest[ 8], _digest[ 9], _digest[10], _digest[11],
                    _digest[12], _digest[13], _digest[14], _digest[15],
                    _digest[16], _digest[17], _digest[18], _digest[19],
                    _digest[20], _digest[21], _digest[22], _digest[23],
                    _digest[24], _digest[25], _digest[26], _digest[27],
                    _digest[28], _digest[29], _digest[30], _digest[31],
                    _digest[32], _digest[33], _digest[34], _digest[35],
                    _digest[36], _digest[37], _digest[38], _digest[39],
                    _digest[40], _digest[41], _digest[42], _digest[43],
                    _digest[44], _digest[45], _digest[46], _digest[47],
                    _digest[48], _digest[49], _digest[50], _digest[51],
                    _digest[52], _digest[53], _digest[54], _digest[55],
                    _digest[56], _digest[57], _digest[58], _digest[59],
                    _digest[60], _digest[61], _digest[62], _digest[63]];

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


+ (SHA512 *)sha512WithString:(NSString *)string
{
    SHA512 *md = [[SHA512 alloc] init];

    [md updateWithString:string];
    [md final];

    return md;
}


@end
