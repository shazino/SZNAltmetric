//
// SZNAltmetricAPIClient.h
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

#import <AFNetworking.h>

@class SZNAltmetricArticle;

typedef void (^SZNAltmetricFetchArticleSuccessBlock)(SZNAltmetricArticle * __nullable);
typedef void (^SZNAltmetricFetchPaginatedArticlesSuccessBlock)(NSArray * __nullable, NSUInteger, NSUInteger);
typedef void (^SZNAltmetricFetchArticleFailureBlock)(NSError * __nullable);

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
@property (copy, nonatomic, nullable) NSString *APIKey;

/**
 Daily API rate limit.
 */
@property (strong, nonatomic, nullable) NSNumber *dailyRateLimit;

/**
 Daily API rate limit remaining calls.
 */
@property (strong, nonatomic, nullable) NSNumber *dailyRateRemaining;

/**
 Hourly API rate limit.
 */
@property (strong, nonatomic, nullable) NSNumber *hourlyRateLimit;

/**
 Hourly API rate limit remaining calls.
 */
@property (strong, nonatomic, nullable) NSNumber *hourlyRateRemaining;

/**
 Creates and initializes if needed a singleton instance of a `SZNAltmetricAPIClient` object configured with Altmetric API URL.

 @return The newly-initialized client
 */
+ (nullable SZNAltmetricAPIClient *)sharedClient;

/**
 Sends a fetch article request based on the ADS Bibcode.

 @param ADSBibcode The ADS Bibcode of the article.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithADSBibcode:(nonnull NSString *)ADSBibcode
                           success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                           failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the Altmetric Identifier.

 @param altmetricIdentifier The Altmetric Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithAltmetricIdentifier:(nonnull NSString *)altmetricIdentifier
                                    success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                                    failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the ArXiv Identifier.

 @param arXivIdentifier The arXiv Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithArXivIdentifier:(nonnull NSString *)arXivIdentifier
                                success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                                failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the DOI.

 @param DOI The DOI of the article.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithDOI:(nonnull NSString *)DOI
                    success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                    failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Sends a fetch article request based on the PubMed Identifier.

 @param pubMedIdentifier The PubMed Identifier of the article.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticleWithPubMedIdentifier:(nonnull NSString *)pubMedIdentifier
                                 success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                                 failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Fetches articles with activity in a given timeframe.

 @param timeframe The citations timeframe (for instance: at, 1d, 1w 1m, 1y)
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes three arguments: an array of `SZNAltmetricArticle` objects created from the data response, the total number of results, and the current page index.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticlesCitationsWithTimeframe:(nonnull NSString *)timeframe
                                    success:(nullable SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                    failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Fetches articles with activity in a given timeframe.

 @param timeframe The citations timeframe (for instance: at, 1d, 1w 1m, 1y)
 @param page Page number, used to paginate through results. First page is page 1. 
  Altmetric will return an error if you ask for a page number beyond (number of matched articles / num_results).
 @param numberOfResults Number of articles per page. Defaults to 25.
 @param citedIn Include only articles mentioned in the supplied list of sources.
 @param DOIPrefix Include only articles with a DOI that contains the given prefix.
 @param NLMIdentifiers Include only articles from journals with the supplied NLM journal IDs (only journals indexed in PubMed have NLM IDs).
 @param subjects Include only articles from journals matching any of the supplied NLM subject ontology term(s).
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes three arguments: an array of `SZNAltmetricArticle` objects created from the data response, the total number of results, and the current page index.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.
 */
- (void)fetchArticlesCitationsWithTimeframe:(nonnull NSString *)timeframe
                                       page:(NSUInteger)page
                            numberOfResults:(NSUInteger)numberOfResults
                                    citedIn:(nullable NSString *)citedIn
                                  DOIPrefix:(nullable NSString *)DOIPrefix
                             NLMIdentifiers:(nullable NSString *)NLMIdentifiers
                                   subjects:(nullable NSString *)subjects
                                    success:(nullable SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                    failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

/**
 Fetches detailed information about an article or dataset.

 @param identifierType A valid identifier type. Types currently accepted are: `doi`, `handle`, `pmid`, `arxiv_id`, `ads_id`, `ssrn`, `repec`, `id`.
 @param identifier A valid identifier of the type specified by identifier type.	_e.g._ the actual DOI, PubMed ID etc.
 @param success A block object to be executed when the request operation finishes successfully. 
  This block has no return value and takes one argument: the `SZNAltmetricArticle` object created from the data response.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. 
  This block has no return value and takes one argument: the `NSError` object describing the network or parsing error that occurred.

 @warning This call is only available to commercial license holders. If you call it without an authorized API key you’ll get a 403 error. 
 */
- (void)fetchArticleDetailsWithIdentifierType:(nonnull NSString *)identifierType
                                   identifier:(nonnull NSString *)identifier
                                      success:(nullable SZNAltmetricFetchArticleSuccessBlock)success
                                      failure:(nullable SZNAltmetricFetchArticleFailureBlock)failure;

@end
