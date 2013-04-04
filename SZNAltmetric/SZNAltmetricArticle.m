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
    article.ADSBibcode          = responseObject[@"ads_id"];
    article.DOI                 = responseObject[@"doi"];
    article.arXiv               = responseObject[@"arxiv_id"];
    article.lastUpdated         = [NSDate dateWithTimeIntervalSince1970:[responseObject[@"last_updated"] doubleValue]];
    article.PubMedIdentifier    = responseObject[@"pmid"];
    article.publishedOn         = [NSDate dateWithTimeIntervalSince1970:[responseObject[@"published_on"] doubleValue]];
    article.score               = responseObject[@"score"];
    article.imageLargeURL       = [NSURL URLWithString:responseObject[@"images"][@"large"]];
    article.imageMediumURL      = [NSURL URLWithString:responseObject[@"images"][@"medium"]];
    article.imageSmallURL       = [NSURL URLWithString:responseObject[@"images"][@"small"]];
    article.title               = responseObject[@"title"];
    article.articleURL          = [NSURL URLWithString:responseObject[@"url"]];
    article.detailsURL          = [NSURL URLWithString:responseObject[@"details_url"]];
    return article;
}

@end
