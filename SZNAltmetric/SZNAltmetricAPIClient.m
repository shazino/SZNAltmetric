//
// SZNAltmetricAPIClient.m
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

#import "SZNAltmetricAPIClient.h"
#import "SZNAltmetricArticle.h"

@interface SZNAltmetricAPIClient ()

- (void)fetchArticleWithPath:(NSString *)path identifier:(NSString *)identifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;

@end


@implementation SZNAltmetricAPIClient

+ (SZNAltmetricAPIClient *)sharedClient
{
    static SZNAltmetricAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.altmetric.com/v1/"]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self)
        return nil;
    
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)fetchArticleWithAltmetricIdentifier:(NSString *)AltmetricIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"id" identifier:AltmetricIdentifier success:success failure:failure];
}

- (void)fetchArticleWithDOI:(NSString *)DOI success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"doi" identifier:DOI success:success failure:failure];
}

- (void)fetchArticleWithPubMedIdentifier:(NSString *)PubMedIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"pmid" identifier:PubMedIdentifier success:success failure:failure];
}

- (void)fetchArticleWithArXivIdentifier:(NSString *)arXivIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"arxiv" identifier:arXivIdentifier success:success failure:failure];
}

- (void)fetchArticleWithADSBibcode:(NSString *)ADSBibcode success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"ads" identifier:ADSBibcode success:success failure:failure];
}

- (void)fetchArticleWithPath:(NSString *)path identifier:(NSString *)identifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    NSURLRequest *request = [self requestWithMethod:@"GET" path:[path stringByAppendingPathComponent:identifier] parameters:self.APIKey ? @{@"key" : self.APIKey} : nil];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *responseObject) {
        SZNAltmetricArticle *article = [SZNAltmetricArticle new];
        article.identifier      = [NSString stringWithFormat:@"%@", responseObject[@"altmetric_id"]];
        article.DOI             = responseObject[@"doi"];
        article.arXiv           = responseObject[@"arxiv_id"];
        article.PubMedIdentifier = responseObject[@"pmid"];
        article.score           = responseObject[@"score"];
        article.imageLargeURL   = [NSURL URLWithString:responseObject[@"images"][@"large"]];
        article.imageMediumURL  = [NSURL URLWithString:responseObject[@"images"][@"medium"]];
        article.imageSmallURL   = [NSURL URLWithString:responseObject[@"images"][@"small"]];
        if (success)
            success(article);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure)
            failure(error);
    }];
    [operation start];
}

@end
