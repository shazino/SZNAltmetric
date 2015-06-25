//
//  SZNAltmetricArticleTests.m
//  SZNAltmetricDemoOSX
//
//  Created by Vincent Tourraine on 02/04/13.
//  Copyright (c) 2013-2015 shazino. All rights reserved.
//

#import "SZNAltmetricArticleTests.h"
#import <SZNAltmetric.h>

@implementation SZNAltmetricArticleTests

- (void)testArticleFromResponseDictionary
{
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"article" ofType:@"json"]];
    NSError *JSONError = nil;
    NSDictionary *JSONArticleDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&JSONError];
    SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:JSONArticleDictionary];
    
    XCTAssertNil(JSONError, @"Article deserialization failed");
    XCTAssertNotNil(article, @"Article not created");
    
    XCTAssertEqualObjects(article.addedOn, [NSDate dateWithTimeIntervalSince1970:1324491937], @"Added on not extracted");
    XCTAssertEqualObjects(article.identifier, @"502878", @"Identifier not extracted");
    XCTAssertEqualObjects(article.altmetricJournalIdentifier, @"4f6fa62f3cf058f6100082d3", @"Journal identifier not extracted");
    XCTAssertEqualObjects(article.ADSBibcode, @"2011natur.480..426v", @"ADS not extracted");
    XCTAssertEqualObjects(article.citedByAccountsCount, @(393), @"Cited by accounts not extracted");
    XCTAssertEqualObjects(article.citedByFacebookWallsCount, @(12), @"Cited by Facebook walls not extracted");
    XCTAssertEqualObjects(article.citedByFeedsCount, @(2), @"Cited by feeds not extracted");
    XCTAssertEqualObjects(article.citedByGooglePlusCount, @(20), @"Cited by Google+ not extracted");
    XCTAssertEqualObjects(article.citedByPostsCount, @(402), @"Cited by posts not extracted");
    XCTAssertEqualObjects(article.citedByTweetersCount, @(359), @"Cited by tweeters not extracted");
    NSDictionary *cohorts = @{@"pub": @(164), @"sci": @(166), @"com": @(20), @"doc": @(17)};
    XCTAssertEqualObjects(article.cohorts, cohorts, @"Cohorts not extracted");
    NSDictionary *context = @{@"journal": @{ @"count": @(252), @"rank": @(12), @"sparkline": @[@(1521.466), @(199.758)]}, @"all": @{@"count": @(1076294), @"rank": @(2), @"sparkline": @[@(1530.608), @(6.5)]}};
    XCTAssertEqualObjects(article.context, context, @"Context not extracted");
    XCTAssertEqualObjects(article.DOI, @"10.1038/480426a", @"DOI not extracted");
    XCTAssertEqualObjects(article.arXiv, @"arXiv-123", @"arXiv identifier not extracted");
    XCTAssertEqualObjects(article.lastUpdated, [NSDate dateWithTimeIntervalSince1970:1353885698], @"Last updated not extracted");
    XCTAssertEqualObjects(article.NLMIdentifier, @"0410462", @"NLM identifier not extracted");
    XCTAssertEqualObjects(article.pubMedIdentifier, @"22193080", @"PubMed identifier not extracted");
    XCTAssertEqualObjects(article.publishedOn, [NSDate dateWithTimeIntervalSince1970:1324512000], @"Published on not extracted");
    XCTAssertEqualObjects(article.schema, @"1.5.4", @"Schema not extracted");
    XCTAssertEqualObjects(article.score, @(353.626), @"Score not extracted");
    XCTAssertEqualObjects(article.subjects, @[@"science"], @"Subjects not extracted");
    XCTAssertEqualObjects(article.scopusSubjects, @[], @"Scopus subjects not extracted");
    NSArray *quotes = @[@"Take a look...", @"Third...", @"Nature..."];
    XCTAssertEqualObjects(article.quotes, quotes, @"Tweet quotes not extracted");
    NSArray *ISSNs = @[@"0028-0836", @"1744-7933"];
    XCTAssertEqualObjects(article.ISSNs, ISSNs, @"ISSNs not extracted");
    XCTAssertEqualObjects(article.imageSmallURL.absoluteString, @"http://fastly.altmetric.com/?size=64&score=354&types=bfgttttt", @"Image small URL not extracted");
    XCTAssertEqualObjects(article.imageMediumURL.absoluteString, @"http://fastly.altmetric.com/?size=100&score=354&types=bfgttttt", @"Image medium URL not extracted");
    XCTAssertEqualObjects(article.imageLargeURL.absoluteString, @"http://fastly.altmetric.com/?size=180&score=354&types=bfgttttt", @"Image large URL not extracted");
    XCTAssertEqualObjects(article.openAccess, @(NO), @"Open Access not extracted");
    NSDictionary *history = @{@"1d": @(0), @"2d": @(0), @"6m": @(77.35), @"1y": @(77.35), @"at": @(353.626)};
    XCTAssertEqualObjects(article.history, history, @"History not extracted");
    XCTAssertEqualObjects(article.journal, @"Nature", @"Journal not extracted");
    XCTAssertEqualObjects(article.title, @"365 days: 2011 in review", @"Title not extracted");
    XCTAssertEqualObjects(article.readersCount, @(0), @"Readers count not extracted");
    NSDictionary *readers = @{@"mendeley": @(0), @"connotea": @(0), @"citeulike": @(0)};
    XCTAssertEqualObjects(article.readers, readers, @"Readers not extracted");
    XCTAssertEqualObjects(article.articleURL.absoluteString, @"http://www.nature.com/news/365-days-2011-in-review-1.9684", @"Article URL not extracted");
    XCTAssertEqualObjects(article.detailsURL.absoluteString, @"http://www.altmetric.com/details.php?citation_id=502878", @"Details URL not extracted");
}


- (void)testArticleDetailsFromResponseDictionary
{
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"articleDetails" ofType:@"json"]];
    NSError *JSONError = nil;
    NSDictionary *JSONArticleDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&JSONError];
    SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:JSONArticleDictionary];
    
    XCTAssertNil(JSONError, @"Article deserialization failed");
    XCTAssertNotNil(article, @"Article not created");
    
    XCTAssertEqualObjects(article.identifier, @"194098", @"Altmetric identifier not extracted");
    XCTAssertEqualObjects(article.DOI, @"10.1038/srep00042", @"DOI not extracted");
    XCTAssertEqualObjects(article.imageSmallURL.absoluteString, @"https://altmetric-badges.a.ssl.fastly.net/?size=64&score=33&types=bgtttttt", @"Image small URL not extracted");
    XCTAssertEqualObjects(article.imageMediumURL.absoluteString, @"https://altmetric-badges.a.ssl.fastly.net/?size=100&score=33&types=bgtttttt", @"Image medium URL not extracted");
    XCTAssertEqualObjects(article.imageLargeURL.absoluteString, @"https://altmetric-badges.a.ssl.fastly.net/?size=180&score=33&types=bgtttttt", @"Image large URL not extracted");
    XCTAssertEqualObjects(article.journal, @"Scientific Reports", @"Journal not extracted");
    NSArray *quotes = @[@"Do you...", @"Findings...", @"New #research..."];
    XCTAssertEqualObjects(article.quotes, quotes, @"Selected quotes not extracted");
}

@end
