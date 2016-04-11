//
// SZNAltmetricArticle.m
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

#import "SZNAltmetricArticle.h"
#import <ISO8601DateFormatter.h>

@interface SZNAltmetricArticle ()

+ (NSDate *)dateFromResponseObject:(id)responseObject;

@end


@implementation SZNAltmetricArticle

+ (SZNAltmetricArticle *)articleWithAPIResponseObject:(id)responseObject {
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return nil;
    }

    SZNAltmetricArticle *article = [SZNAltmetricArticle new];
    article.content = responseObject;

    NSDictionary *citationDictionary = responseObject[@"citation"] ?: responseObject;
    article.addedOn             = [self dateFromResponseObject:responseObject[@"added_on"]];
    article.identifier          = [NSString stringWithFormat:@"%@", responseObject[@"altmetric_id"]];
    article.altmetricJournalIdentifier  = [NSString stringWithFormat:@"%@", citationDictionary[@"altmetric_jid"]];
    article.ADSBibcode          = citationDictionary[@"ads_id"];
    article.citedByAccountsCount      = responseObject[@"cited_by_accounts_count"];
    article.citedByFacebookWallsCount = responseObject[@"cited_by_fbwalls_count"];
    article.citedByFeedsCount         = responseObject[@"cited_by_feeds_count"];
    article.citedByGooglePlusCount    = responseObject[@"cited_by_gplus_count"];
    article.citedByPostsCount         = responseObject[@"cited_by_posts_count"];
    article.citedByTweetersCount      = responseObject[@"cited_by_tweeters_count"];
    article.cohorts             = responseObject[@"cohorts"];
    article.context             = responseObject[@"context"];
    article.DOI                 = citationDictionary[@"doi"];
    article.arXiv               = citationDictionary[@"arxiv_id"];
    article.lastUpdated         = [self dateFromResponseObject:responseObject[@"last_updated"]];
    article.NLMIdentifier       = citationDictionary[@"nlmid"];
    article.pubMedIdentifier    = citationDictionary[@"pmid"];

    if (responseObject[@"published_on"]) {
        article.publishedOn     = [self dateFromResponseObject:responseObject[@"published_on"]];
    }

    if (citationDictionary[@"pubdate"]) {
        article.publishedOn     = [self dateFromResponseObject:citationDictionary[@"pubdate"]];
    }

    article.schema              = responseObject[@"schema"];
    article.score               = responseObject[@"score"];
    article.subjects            = responseObject[@"subjects"];
    article.scopusSubjects      = responseObject[@"scopus_subjects"];
    article.quotes              = responseObject[@"selected_quotes"] ?: responseObject[@"tq"];
    article.ISSNs               = responseObject[@"issns"];
    article.imageLargeURL       = [NSURL URLWithString:responseObject[@"images"][@"large"]];
    article.imageMediumURL      = [NSURL URLWithString:responseObject[@"images"][@"medium"]];
    article.imageSmallURL       = [NSURL URLWithString:responseObject[@"images"][@"small"]];
    article.history             = responseObject[@"history"];
    article.openAccess          = responseObject[@"is_oa"];
    article.journal             = citationDictionary[@"journal"];
    article.title               = citationDictionary[@"title"];
    article.readersCount        = responseObject[@"readers_count"];
    article.readers             = responseObject[@"readers"];
    article.articleURL          = [NSURL URLWithString:responseObject[@"url"]];

    if ([citationDictionary[@"links"] isKindOfClass:[NSArray class]] &&
        [citationDictionary[@"links"] count] > 0) {
        article.detailsURL      = [NSURL URLWithString:citationDictionary[@"links"][0]];
    }
    else {
        article.detailsURL      = [NSURL URLWithString:responseObject[@"details_url"]];
    }

    return article;
}

+ (NSDate *)dateFromResponseObject:(id)responseObject {
    if ([responseObject isKindOfClass:[NSNumber class]]) {
        return [NSDate dateWithTimeIntervalSince1970:[responseObject doubleValue]];
    }
    else if ([responseObject isKindOfClass:[NSString class]]) {
        return [[ISO8601DateFormatter new] dateFromString:responseObject];
    }
    else {
        return nil;
    }
}

@end
