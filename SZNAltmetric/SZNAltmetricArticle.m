//
// SZNAltmetricArticle.m
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

#import "SZNAltmetricArticle.h"

@implementation SZNAltmetricArticle

+ (SZNAltmetricArticle *)articleWithAPIResponseObject:(id)responseObject
{
    SZNAltmetricArticle *article = [SZNAltmetricArticle new];
    article.addedOn             = [NSDate dateWithTimeIntervalSince1970:[responseObject[@"added_on"] doubleValue]];
    article.identifier          = [NSString stringWithFormat:@"%@", responseObject[@"altmetric_id"]];
    article.altmetricJournalIdentifier  = [NSString stringWithFormat:@"%@", responseObject[@"altmetric_jid"]];
    article.ADSBibcode          = responseObject[@"ads_id"];
    article.citedByAccountsCount        = responseObject[@"cited_by_accounts_count"];
    article.citedByFacebookWallsCount   = responseObject[@"cited_by_fbwalls_count"];
    article.citedByFeedsCount           = responseObject[@"cited_by_feeds_count"];
    article.citedByGooglePlusCount      = responseObject[@"cited_by_gplus_count"];
    article.citedByPostsCount           = responseObject[@"cited_by_posts_count"];
    article.citedByTweetersCount        = responseObject[@"cited_by_tweeters_count"];
    article.cohorts             = responseObject[@"cohorts"];
    article.context             = responseObject[@"context"];
    article.DOI                 = responseObject[@"citation"][@"doi"] ?: responseObject[@"doi"];
    article.arXiv               = responseObject[@"arxiv_id"];
    article.lastUpdated         = [NSDate dateWithTimeIntervalSince1970:[responseObject[@"last_updated"] doubleValue]];
    article.NLMIdentifier       = responseObject[@"nlmid"];
    article.PubMedIdentifier    = responseObject[@"pmid"];
    article.publishedOn         = [NSDate dateWithTimeIntervalSince1970:[responseObject[@"published_on"] doubleValue]];
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
    article.journal             = responseObject[@"citation"][@"journal"] ?: responseObject[@"journal"];
    article.title               = responseObject[@"title"];
    article.readersCount        = responseObject[@"readers_count"];
    article.readers             = responseObject[@"readers"];
    article.articleURL          = [NSURL URLWithString:responseObject[@"url"]];
    article.detailsURL          = [NSURL URLWithString:responseObject[@"details_url"]];
    return article;
}

@end
