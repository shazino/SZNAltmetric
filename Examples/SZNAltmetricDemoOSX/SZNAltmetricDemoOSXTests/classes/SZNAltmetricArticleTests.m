//
//  SZNAltmetricArticleTests.m
//  SZNAltmetricDemoOSX
//
//  Created by Vincent Tourraine on 02/04/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import "SZNAltmetricArticleTests.h"
#import <SZNAltmetric.h>

@implementation SZNAltmetricArticleTests

- (void)testArticleFromRespondeDictionary
{
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"article" ofType:@"json"]];
    NSError *JSONError = nil;
    NSDictionary *JSONArticleDictionary = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&JSONError];
    SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:JSONArticleDictionary];
    
    STAssertNil(JSONError, @"Article deserialization failed");
    STAssertNotNil(article, @"Article not created");
    
    STAssertEqualObjects(article.addedOn, [NSDate dateWithTimeIntervalSince1970:1324491937], @"Added on not extracted");
    STAssertEqualObjects(article.identifier, @"502878", @"Identifier not extracted");
    STAssertEqualObjects(article.altmetricJournalIdentifier, @"4f6fa62f3cf058f6100082d3", @"Journal identifier not extracted");
    STAssertEqualObjects(article.ADSBibcode, @"2011natur.480..426v", @"ADS not extracted");
    STAssertEqualObjects(article.citedByAccountsCount, @(393), @"Cited by accounts not extracted");
    STAssertEqualObjects(article.citedByFacebookWallsCount, @(12), @"Cited by Facebook walls not extracted");
    STAssertEqualObjects(article.citedByFeedsCount, @(2), @"Cited by feeds not extracted");
    STAssertEqualObjects(article.citedByGooglePlusCount, @(20), @"Cited by Google+ not extracted");
    STAssertEqualObjects(article.citedByPostsCount, @(402), @"Cited by posts not extracted");
    STAssertEqualObjects(article.citedByTweetersCount, @(359), @"Cited by tweeters not extracted");
    NSDictionary *cohorts = @{@"pub": @(164), @"sci": @(166), @"com": @(20), @"doc": @(17)};
    STAssertEqualObjects(article.cohorts, cohorts, @"Cohorts not extracted");
    NSDictionary *context = @{@"journal": @{ @"count": @(252), @"rank": @(12), @"sparkline": @[@(1521.466), @(199.758)]}, @"all": @{@"count": @(1076294), @"rank": @(2), @"sparkline": @[@(1530.608), @(6.5)]}};
    STAssertEqualObjects(article.context, context, @"Context not extracted");
    STAssertEqualObjects(article.DOI, @"10.1038/480426a", @"DOI not extracted");
    STAssertEqualObjects(article.arXiv, @"arXiv-123", @"arXiv identifier not extracted");
    STAssertEqualObjects(article.lastUpdated, [NSDate dateWithTimeIntervalSince1970:1353885698], @"Last updated not extracted");
    STAssertEqualObjects(article.NLMIdentifier, @"0410462", @"NLM identifier not extracted");
    STAssertEqualObjects(article.pubMedIdentifier, @"22193080", @"PubMed identifier not extracted");
    STAssertEqualObjects(article.publishedOn, [NSDate dateWithTimeIntervalSince1970:1324512000], @"Published on not extracted");
    STAssertEqualObjects(article.schema, @"1.5.4", @"Schema not extracted");
    STAssertEqualObjects(article.score, @(353.626), @"Score not extracted");
    STAssertEqualObjects(article.subjects, @[@"science"], @"Subjects not extracteds");
    STAssertEqualObjects(article.scopusSubjects, @[], @"Scopus subjects not extracteds");
    NSArray *quotes = @[@"Take a look...", @"Third...", @"Nature..."];
    STAssertEqualObjects(article.tweetQuotes, quotes, @"Tweet quotes not extracteds");
    NSArray *ISSNs = @[@"0028-0836", @"1744-7933"];
    STAssertEqualObjects(article.ISSNs, ISSNs, @"ISSNs not extracteds");
    STAssertEqualObjects(article.imageSmallURL.absoluteString, @"http://fastly.altmetric.com/?size=64&score=354&types=bfgttttt", @"Image small URL not extracted");
    STAssertEqualObjects(article.imageMediumURL.absoluteString, @"http://fastly.altmetric.com/?size=100&score=354&types=bfgttttt", @"Image medium URL not extracted");
    STAssertEqualObjects(article.imageLargeURL.absoluteString, @"http://fastly.altmetric.com/?size=180&score=354&types=bfgttttt", @"Image large URL not extracted");
    STAssertEqualObjects(article.openAccess, @(NO), @"Open Access not extracted");
    NSDictionary *history = @{@"1d": @(0), @"2d": @(0), @"6m": @(77.35), @"1y": @(77.35), @"at": @(353.626)};
    STAssertEqualObjects(article.history, history, @"History not extracted");
    STAssertEqualObjects(article.journal, @"Nature", @"Journal not extracted");
    STAssertEqualObjects(article.title, @"365 days: 2011 in review", @"Title not extracted");
    STAssertEqualObjects(article.readersCount, @(0), @"Readers count not extracted");
    NSDictionary *readers = @{@"mendeley": @(0), @"connotea": @(0), @"citeulike": @(0)};
    STAssertEqualObjects(article.readers, readers, @"Readers not extracted");
    STAssertEqualObjects(article.articleURL.absoluteString, @"http://www.nature.com/news/365-days-2011-in-review-1.9684", @"Article URL not extracted");
    STAssertEqualObjects(article.detailsURL.absoluteString, @"http://www.altmetric.com/details.php?citation_id=502878", @"Details URL not extracted");
}

@end
