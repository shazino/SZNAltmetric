//
// SZNAltmetricArticle.h
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

#import <Foundation/Foundation.h>

/**
 `SZNAltmetricArticle` represents an article, as described by Altmetric.
 */

@interface SZNAltmetricArticle : NSObject

/**
 The add date of the article.
 */
@property (strong, nonatomic, nullable) NSDate *addedOn;

/**
 The ADS Bibcode of the article.
 */
@property (copy, nonatomic, nullable) NSString *ADSBibcode;

/**
 The Altmetric journal identifier of the article.
 */
@property (copy, nonatomic, nullable) NSString *altmetricJournalIdentifier;

/**
 The URL of the article.
 */
@property (strong, nonatomic, nullable) NSURL *articleURL;

/**
 The arXiv identifier of the article.
 */
@property (copy, nonatomic, nullable) NSString *arXiv;

/**
 The cited by accounts count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByAccountsCount;

/**
 The cited by Facebook walls count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByFacebookWallsCount;

/**
 The cited by feeds count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByFeedsCount;

/**
 The cited by Google+ count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByGooglePlusCount;

/**
 The cited by posts count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByPostsCount;

/**
 The cited by tweeters count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *citedByTweetersCount;

/**
 The cohorts of the article.
 */
@property (strong, nonatomic, nullable) NSDictionary *cohorts;

/**
 The raw content of the article from the API response.
 */
@property (strong, nonatomic, nullable) NSDictionary *content;

/**
 The context of the article.
 */
@property (strong, nonatomic, nullable) NSDictionary *context;

/**
 The details URL of the article.
 */
@property (strong, nonatomic, nullable) NSURL *detailsURL;

/**
 The DOI of the article.
 */
@property (copy, nonatomic, nullable) NSString *DOI;

/**
 The history of the article.
 */
@property (strong, nonatomic, nullable) NSDictionary *history;

/**
 The Altmetric identifier of the article.
 */
@property (copy, nonatomic, nullable) NSString *identifier;

/**
 The Altmetric image URL of the article (large).
 */
@property (strong, nonatomic, nullable) NSURL *imageLargeURL;

/**
 The Altmetric image URL of the article (medium).
 */
@property (strong, nonatomic, nullable) NSURL *imageMediumURL;

/**
 The Altmetric image URL of the article (small).
 */
@property (strong, nonatomic, nullable) NSURL *imageSmallURL;

/**
 The ISSNs of the article.
 */
@property (strong, nonatomic, nullable) NSArray *ISSNs;

/**
 The journal of the article.
 */
@property (copy, nonatomic, nullable) NSString *journal;

/**
 The last update of the article.
 */
@property (strong, nonatomic, nullable) NSDate *lastUpdated;

/**
 The NLM (National Library of Medicine) identifier of the article.
 */
@property (copy, nonatomic, nullable) NSString *NLMIdentifier;

/**
 The Open Access status (boolean) of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *openAccess;

/**
 The publication date of the article.
 */
@property (strong, nonatomic, nullable) NSDate *publishedOn;

/**
 The PubMed identifier of the article.
 */
@property (copy, nonatomic, nullable) NSString *pubMedIdentifier;

/**
 The readers of the article.
 */
@property (strong, nonatomic, nullable) NSDictionary *readers;

/**
 The readers count of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *readersCount;

/**
 The schema of the article.
 */
@property (copy, nonatomic, nullable) NSString *schema;

/**
 The Scopus subjects of the article.
 */
@property (strong, nonatomic, nullable) NSArray *scopusSubjects;

/**
 The Altmetric score of the article.
 */
@property (strong, nonatomic, nullable) NSNumber *score;

/**
 The subjects of the article.
 */
@property (strong, nonatomic, nullable) NSArray *subjects;

/**
 The title of the article.
 */
@property (copy, nonatomic, nullable) NSString *title;

/**
 The quotes of the article (a.k.a. tweet quotes, selected quotes).
 */
@property (strong, nonatomic, nullable) NSArray *quotes;


/**
 Creates a `SZNAltmetricArticle` and initializes its properties from the API response object.

 @param responseObject The API response object

 @return  The newly-initialized article.
 */
+ (nullable SZNAltmetricArticle *)articleWithAPIResponseObject:(nonnull id)responseObject;

@end
