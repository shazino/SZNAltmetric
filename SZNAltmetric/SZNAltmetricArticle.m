//
// SZNAltmetricself.m
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


@implementation SZNAltmetricArticle

- (nullable instancetype)initWithAPIResponseObject:(nonnull NSDictionary <NSString *, __kindof NSObject *> *)responseObject {
    self = [super init];

    if (self) {
        self.content = responseObject;

        NSDictionary *citationDictionary = responseObject[@"citation"] ?: responseObject;
        self.addedOn             = [SZNAltmetricArticle dateFromResponseObject:responseObject[@"added_on"]];
        self.identifier          = [NSString stringWithFormat:@"%@", responseObject[@"altmetric_id"]];
        self.altmetricJournalIdentifier  = [NSString stringWithFormat:@"%@", citationDictionary[@"altmetric_jid"]];
        self.ADSBibcode          = citationDictionary[@"ads_id"];
        self.citedByAccountsCount      = responseObject[@"cited_by_accounts_count"];
        self.citedByFacebookWallsCount = responseObject[@"cited_by_fbwalls_count"];
        self.citedByFeedsCount         = responseObject[@"cited_by_feeds_count"];
        self.citedByGooglePlusCount    = responseObject[@"cited_by_gplus_count"];
        self.citedByPostsCount         = responseObject[@"cited_by_posts_count"];
        self.citedByTweetersCount      = responseObject[@"cited_by_tweeters_count"];
        self.cohorts          = responseObject[@"cohorts"];
        self.context          = responseObject[@"context"];
        self.DOI              = citationDictionary[@"doi"];
        self.arXiv            = citationDictionary[@"arxiv_id"];
        self.lastUpdated      = [SZNAltmetricArticle dateFromResponseObject:responseObject[@"last_updated"]];
        self.NLMIdentifier    = citationDictionary[@"nlmid"];
        self.pubMedIdentifier = citationDictionary[@"pmid"];

        if (responseObject[@"published_on"]) {
            self.publishedOn     = [SZNAltmetricArticle dateFromResponseObject:responseObject[@"published_on"]];
        }

        if (citationDictionary[@"pubdate"]) {
            self.publishedOn     = [SZNAltmetricArticle dateFromResponseObject:citationDictionary[@"pubdate"]];
        }

        self.schema          = responseObject[@"schema"];
        self.score           = responseObject[@"score"];
        self.subjects        = responseObject[@"subjects"];
        self.scopusSubjects  = responseObject[@"scopus_subjects"];
        self.quotes          = responseObject[@"selected_quotes"] ?: responseObject[@"tq"];
        self.ISSNs           = responseObject[@"issns"];

        NSDictionary *images = responseObject[@"images"];
        self.imageLargeURL   = [NSURL URLWithString:images[@"large"]];
        self.imageMediumURL  = [NSURL URLWithString:images[@"medium"]];
        self.imageSmallURL   = [NSURL URLWithString:images[@"small"]];

        self.history         = responseObject[@"history"];
        self.openAccess      = responseObject[@"is_oa"];
        self.journal         = citationDictionary[@"journal"];
        self.title           = citationDictionary[@"title"];
        self.readersCount    = responseObject[@"readers_count"];
        self.readers         = responseObject[@"readers"];
        self.articleURL      = [NSURL URLWithString:responseObject[@"url"]];

        if ([citationDictionary[@"links"] isKindOfClass:[NSArray class]] &&
            [citationDictionary[@"links"] count] > 0) {
            self.detailsURL = [NSURL URLWithString:citationDictionary[@"links"][0]];
        }
        else {
            self.detailsURL = [NSURL URLWithString:responseObject[@"details_url"]];
        }
    }

    return self;
}

+ (nullable NSDate *)dateFromResponseObject:(nullable id)responseObject {
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
