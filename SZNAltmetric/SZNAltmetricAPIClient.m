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

- (void)fetchPaginatedArticlesWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure;
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

- (void)fetchArticleWithAltmetricIdentifier:(NSString *)altmetricIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"id" identifier:altmetricIdentifier success:success failure:failure];
}

- (void)fetchArticleWithDOI:(NSString *)DOI success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"doi" identifier:DOI success:success failure:failure];
}

- (void)fetchArticleWithPubMedIdentifier:(NSString *)pubMedIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"pmid" identifier:pubMedIdentifier success:success failure:failure];
}

- (void)fetchArticleWithArXivIdentifier:(NSString *)arXivIdentifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"arxiv" identifier:arXivIdentifier success:success failure:failure];
}

- (void)fetchArticleWithADSBibcode:(NSString *)ADSBibcode success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:@"ads" identifier:ADSBibcode success:success failure:failure];
}

- (void)fetchArticlesCitationsWithTimeframe:(NSString *)timeframe success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticlesCitationsWithTimeframe:timeframe page:0 numberOfResults:0 citedIn:nil DOIPrefix:nil NLMIdentifiers:nil subjects:nil success:success failure:failure];
}

- (void)fetchArticlesCitationsWithTimeframe:(NSString *)timeframe page:(NSUInteger)page numberOfResults:(NSUInteger)numberOfResults citedIn:(NSString *)citedIn DOIPrefix:(NSString *)DOIPrefix NLMIdentifiers:(NSString *)NLMIdentifiers subjects:(NSString *)subjects success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (page > 0)
        parameters[@"page"] = @(page);
    if (numberOfResults > 0)
        parameters[@"num_results"] = @(numberOfResults);
    if (citedIn)
        parameters[@"cited_in"] = citedIn;
    if (DOIPrefix)
        parameters[@"doi_prefix"] = DOIPrefix;
    if (NLMIdentifiers)
        parameters[@"nlmid"] = NLMIdentifiers;
    if (subjects)
        parameters[@"subject"] = subjects;
    [self fetchPaginatedArticlesWithPath:[@"citations" stringByAppendingPathComponent:timeframe] parameters:parameters success:success failure:failure];
}

- (void)fetchArticleDetailsWithIdentifierType:(NSString *)identifierType identifier:(NSString *)identifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchArticleWithPath:[@"fetch" stringByAppendingPathComponent:identifierType] identifier:identifier success:success failure:failure];
}

- (void)fetchPaginatedArticlesWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (self.APIKey)
        mutableParameters[@"key"] = self.APIKey;
    
    NSURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:mutableParameters];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *responseObject) {
        if (success)
        {
            if (responseObject[@"results"] && responseObject[@"query"])
            {
                NSNumber *page  = responseObject[@"query"][@"page"];
                NSNumber *total = responseObject[@"query"][@"total"];
                
                NSMutableArray *results = [NSMutableArray array];
                for (NSDictionary *result in responseObject[@"results"])
                    [results addObject:[SZNAltmetricArticle articleWithAPIResponseObject:result]];
                success(results, [total unsignedIntegerValue], [page unsignedIntegerValue]);
            }
            else
                success(@[[SZNAltmetricArticle articleWithAPIResponseObject:responseObject]], NSNotFound, NSNotFound);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure)
            failure(error);
    }];
    [operation start];
}

- (void)fetchArticleWithPath:(NSString *)path identifier:(NSString *)identifier success:(SZNAltmetricFetchArticleSuccessBlock)success failure:(SZNAltmetricFetchArticleFailureBlock)failure
{
    [self fetchPaginatedArticlesWithPath:[path stringByAppendingPathComponent:identifier] parameters:nil success:^(NSArray *results, NSUInteger total, NSUInteger page) {
        if (success)
            success([results lastObject]);
    } failure:failure];
}

@end
