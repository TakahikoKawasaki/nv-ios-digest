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
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


//----------------------------------------------------------------------
// Protocol
//----------------------------------------------------------------------
@protocol MessageDigest


/**
 * Reset this MessageDigest instance.
 *
 * Implementations of MessageDigest will call CC_XX_Init() function
 * (e.g. CC_MD5_Init(CC_MD5_CTX *)) to initialize their own contexts.
 */
- (void)reset;


/**
 * Accumulate a data chunk.
 *
 * Implementations of MessageDigest will call CC_XX_Update() function
 * (e.g. CC_MD5_Update(CC_MD5_CTX *, const void *, CC_LONG)) to update.
 *
 * If data is NULL, this method does nothing and returns 0.
 */
- (int)updateWith:(const void *)data length:(CC_LONG)length;


/**
 * Accumulate a data chunk.
 *
 * This method is just a wrapper over updateWith:length:.
 * The given string is converted to a C string with encoding
 * NSUTF8StringEncoding and passed to updateWith:length.
 *
 * If nil is given, this method does nothing and returns 0.
 */
- (int)updateWithString:(NSString *)string;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(BOOL)].
 */
- (int)updateWithBool:(BOOL)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(char)].
 */
- (int)updateWithChar:(char)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(short)].
 */
- (int)updateWithShort:(short)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(int)].
 */
- (int)updateWithInt:(int)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(long)].
 */
- (int)updateWithLong:(long)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(long long)].
 */
- (int)updateWithLongLong:(long long)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(float)].
 */
- (int)updateWithFloat:(float)data;


/**
 * Accumulate a data chunk.
 *
 * This method is an alias of
 *[self updateWith:(const void *)&data length:sizeof(double)].
 */
- (int)updateWithDouble:(double)data;


/**
 * Compute the message digest value with data chunks accumulated so far.
 *
 * Implementations of MessageDigest will call CC_XX_Final() function
 * (e.g. CC_MD5_Final(unsigned char *, CC_MD5_CTX *)) to compute the
 * message digest value.
 *
 * After 'final' is called, 'description' returns an NSString instance
 * that represents the digest value with lower-case hexadecimal letters.
 *
 * @return
 *         The pointer to the internal buffer that holds the message
 *         digest value.
 */
- (unsigned char *)final;


/**
 * Get the pointer of the internal buffer.
 *
 * @return
 *         The pointer to the internal buffer that holds the message
 *         digest value.
 */
- (unsigned char *)buffer;


/**
 * Get the size of the internal buffer in bytes.
 *
 * Implementations of MessageDigest will return CC_XX_DIGEST_LENGTH
 * (e.g. MD5 returns CC_MD5_DIGEST_LENGTH).
 */
- (size_t)bufferSize;


@end


//----------------------------------------------------------------------
// Interface
//----------------------------------------------------------------------
@interface MessageDigest : NSObject <MessageDigest>

@end
