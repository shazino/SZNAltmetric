//
// SZNAltmetricArticle.h
//
// Copyright (c) 2013-2016 shazino (shazino SAS), http://www.shazino.com/
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

@import Foundation;

/**
 `SZNAltmetricArticle` represents an article, as described by Altmetric.
 */
@interface SZNAltmetricArticle : NSObject

/**
 The add date of the article.
 */
@property (nonatomic, copy, nullable) NSDate *addedOn;

/**
 The ADS Bibcode of the article.
 */
@property (nonatomic, copy, nullable) NSString *ADSBibcode;

/**
 The Altmetric journal identifier of the article.
 */
@property (nonatomic, copy, nullable) NSString *altmetricJournalIdentifier;

/**
 The URL of the article.
 */
@property (nonatomic, copy, nullable) NSURL *articleURL;

/**
 The arXiv identifier of the article.
 */
@property (nonatomic, copy, nullable) NSString *arXiv;

/**
 The cited by accounts count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByAccountsCount;

/**
 The cited by Facebook walls count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByFacebookWallsCount;

/**
 The cited by feeds count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByFeedsCount;

/**
 The cited by Google+ count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByGooglePlusCount;

/**
 The cited by posts count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByPostsCount;

/**
 The cited by tweeters count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *citedByTweetersCount;

/**
 The cohorts of the article.
 */
@property (nonatomic, strong, nullable) NSDictionary <NSString *, NSNumber *> *cohorts;

/**
 The raw content of the article from the API response.
 */
@property (nonatomic, strong, nullable) NSDictionary <NSString *, __kindof NSObject *> *content;

/**
 The context of the article.
 */
@property (nonatomic, strong, nullable) NSDictionary <NSString *, NSDictionary *> *context;

/**
 The details URL of the article.
 */
@property (nonatomic, copy, nullable) NSURL *detailsURL;

/**
 The DOI of the article.
 */
@property (nonatomic, copy, nullable) NSString *DOI;

/**
 The history of the article.
 */
@property (nonatomic, strong, nullable) NSDictionary <NSString *, NSNumber *> *history;

/**
 The Altmetric identifier of the article.
 */
@property (nonatomic, copy, nullable) NSString *identifier;

/**
 The Altmetric image URL of the article (large).
 */
@property (nonatomic, copy, nullable) NSURL *imageLargeURL;

/**
 The Altmetric image URL of the article (medium).
 */
@property (nonatomic, copy, nullable) NSURL *imageMediumURL;

/**
 The Altmetric image URL of the article (small).
 */
@property (nonatomic, copy, nullable) NSURL *imageSmallURL;

/**
 The ISSNs of the article.
 */
@property (nonatomic, strong, nullable) NSArray <NSString *> *ISSNs;

/**
 The journal of the article.
 */
@property (nonatomic, copy, nullable) NSString *journal;

/**
 The last update of the article.
 */
@property (nonatomic, copy, nullable) NSDate *lastUpdated;

/**
 The NLM (National Library of Medicine) identifier of the article.
 */
@property (nonatomic, copy, nullable) NSString *NLMIdentifier;

/**
 The Open Access status (boolean) of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *openAccess;

/**
 The publication date of the article.
 */
@property (nonatomic, copy, nullable) NSDate *publishedOn;

/**
 The PubMed identifier of the article.
 */
@property (nonatomic, copy, nullable) NSString *pubMedIdentifier;

/**
 The readers of the article.
 */
@property (nonatomic, strong, nullable) NSDictionary <NSString *, NSNumber *> *readers;

/**
 The readers count of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *readersCount;

/**
 The schema of the article.
 */
@property (nonatomic, copy, nullable) NSString *schema;

/**
 The Scopus subjects of the article.
 */
@property (nonatomic, strong, nullable) NSArray <NSString *> *scopusSubjects;

/**
 The Altmetric score of the article.
 */
@property (nonatomic, copy, nullable) NSNumber *score;

/**
 The subjects of the article.
 */
@property (nonatomic, strong, nullable) NSArray <NSString *> *subjects;

/**
 The title of the article.
 */
@property (nonatomic, copy, nullable) NSString *title;

/**
 The quotes of the article (a.k.a. tweet quotes, selected quotes).
 */
@property (nonatomic, strong, nullable) NSArray <NSString *> *quotes;


/**
 Creates a `SZNAltmetricArticle` and initializes its properties from the API response object.

 @param responseObject The API response object

 @return  The newly-initialized article.
 */
- (nullable instancetype)initWithAPIResponseObject:(nonnull NSDictionary <NSString *, __kindof NSObject *> *)responseObject;

@end
