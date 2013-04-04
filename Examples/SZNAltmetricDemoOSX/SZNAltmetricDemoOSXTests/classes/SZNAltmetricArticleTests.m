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
    SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:@{
                                    @"added_on" : @(1324491937),
                                    @"altmetric_id" : @(1),
                                    @"ads_id" : @"ADS-123",
                                    @"cited_by_accounts_count" : @(393),
                                    @"cited_by_fbwalls_count" : @(12),
                                    @"cited_by_feeds_count" : @(2),
                                    @"cited_by_gplus_count" : @(20),
                                    @"cited_by_posts_count" : @(402),
                                    @"cited_by_tweeters_count" : @(359),
                                    @"doi" : @"DOI-123",
                                    @"arxiv_id" : @"arXiv-123",
                                    @"last_updated" : @(1324491938),
                                    @"nlmid" : @"NLM-123",
                                    @"pmid" : @"pmid-123",
                                    @"published_on" : @(1324491939),
                                    @"score" : @(42),
                                    @"images" : @{@"small" : @"http://test.com/small.jpg", @"medium" : @"http://test.com/medium.jpg", @"large" : @"http://test.com/large.jpg"},
                                    @"is_oa" : @(YES),
                                    @"journal": @"Jou",
                                    @"title" : @"Article",
                                    @"details_url" : @"http://test.com/article/details",
                                    @"url" : @"http://test.com/article"}];
    
    STAssertNotNil(article, @"Article not created");
    
    STAssertEqualObjects(article.addedOn, [NSDate dateWithTimeIntervalSince1970:1324491937], @"Added on not extracted");
    STAssertEqualObjects(article.identifier, @"1", @"Identifier not extracted");
    STAssertEqualObjects(article.ADSBibcode, @"ADS-123", @"ADS not extracted");
    STAssertEqualObjects(article.citedByAccountsCount, @(393), @"Cited by accounts not extracted");
    STAssertEqualObjects(article.citedByFacebookWallsCount, @(12), @"Cited by Facebook walls not extracted");
    STAssertEqualObjects(article.citedByFeedsCount, @(2), @"Cited by feeds not extracted");
    STAssertEqualObjects(article.citedByGooglePlusCount, @(20), @"Cited by Google+ not extracted");
    STAssertEqualObjects(article.citedByPostsCount, @(402), @"Cited by posts not extracted");
    STAssertEqualObjects(article.citedByTweetersCount, @(359), @"Cited by tweeters not extracted");
    STAssertEqualObjects(article.DOI, @"DOI-123", @"DOI not extracted");
    STAssertEqualObjects(article.arXiv, @"arXiv-123", @"arXiv identifier not extracted");
    STAssertEqualObjects(article.lastUpdated, [NSDate dateWithTimeIntervalSince1970:1324491938], @"Last updated not extracted");
    STAssertEqualObjects(article.NLMIdentifier, @"NLM-123", @"NLM identifier not extracted");
    STAssertEqualObjects(article.pubMedIdentifier, @"pmid-123", @"PubMed identifier not extracted");
    STAssertEqualObjects(article.publishedOn, [NSDate dateWithTimeIntervalSince1970:1324491939], @"Published on not extracted");
    STAssertEqualObjects(article.score, @(42), @"Score not extracted");
    STAssertEqualObjects(article.imageSmallURL.absoluteString, @"http://test.com/small.jpg", @"Image small URL not extracted");
    STAssertEqualObjects(article.imageMediumURL.absoluteString, @"http://test.com/medium.jpg", @"Image medium URL not extracted");
    STAssertEqualObjects(article.imageLargeURL.absoluteString, @"http://test.com/large.jpg", @"Image large URL not extracted");
    STAssertEqualObjects(article.openAccess, @(YES), @"Open Access not extracted");
    STAssertEqualObjects(article.journal, @"Jou", @"Journal not extracted");
    STAssertEqualObjects(article.title, @"Article", @"Title not extracted");
    STAssertEqualObjects(article.articleURL.absoluteString, @"http://test.com/article", @"Article URL not extracted");
    STAssertEqualObjects(article.detailsURL.absoluteString, @"http://test.com/article/details", @"Details URL not extracted");
}

@end
