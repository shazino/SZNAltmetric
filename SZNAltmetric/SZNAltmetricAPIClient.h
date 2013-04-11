//
// SZNAltmetricAPIClient.h
//
// Copyright (c) 2013 shazino (shazino SAS), http://www.shazino.com/
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

#import <AFNetworking.h>

@class SZNAltmetricArticle;

typedef void (^SZNAltmetricFetchArticleSuccessBlock)(SZNAltmetricArticle *);
typedef void (^SZNAltmetricFetchArticleFailureBlock)(NSError *);

/**
 `SZNAltmetricAPIClient` is an HTTP client preconfigured for accessing Altmetric API.
 */

@interface SZNAltmetricAPIClient : AFHTTPClient

/**
 Altmetric API Key.
 You don't need to register for an API key to use the Altmetric API. 
 That said all queries are rate limited by IP and the limit for queries without a key is fairly low.
 
 @see [Altmetric API documentation](http://api.altmetric.com)
 */
@property (copy, nonatomic) NSString *APIKey;

/**
 Creates and initializes if needed a singleton instance of a `SZNAltmetricAPIClient` object configured with Altmetric API URL.
 
 @return The newly-initialized client
 */
+ (SZNAltmetricAPIClient *)sharedClient;

/**
 Sends a fetch article request based on the ADS Bibcode.
 
 @param ADSBibcode The ADS Bibcode of the article.
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithADSBibcode:(NSString *)ADSBibcode success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the Altmetric Identifier.
 
 @param altmetricIdentifier The Altmetric Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithAltmetricIdentifier:(NSString *)altmetricIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the ArXiv Identifier.
 
 @param arXivIdentifier The arXiv Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithArXivIdentifier:(NSString *)arXivIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the DOI.
 
 @param DOI The DOI of the article.
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithDOI:(NSString *)DOI success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the PubMed Identifier.
 
 @param pubMedIdentifier The PubMed Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithPubMedIdentifier:(NSString *)pubMedIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

@end
