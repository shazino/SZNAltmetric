//
// SZNAltmetricRequestSerializer.h
//
// Copyright (c) 2013-2015 shazino (shazino SAS), http://www.shazino.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFURLRequestSerialization.h"

/**
 `SZNAltmetricRequestSerializer` is a subclass of `AFHTTPRequestSerializer`
 for serializing requests for the Altemtric API.
 */
@interface SZNAltmetricRequestSerializer : AFHTTPRequestSerializer

/**
 Altmetric API Key.
 You don't need to register for an API key to use the Altmetric API.
 That said all queries are rate limited by IP and the limit for queries without a key is fairly low.

 @see [Altmetric API documentation](http://api.altmetric.com)
 */
@property (nonatomic, copy, nullable) NSString *APIKey;

@end
