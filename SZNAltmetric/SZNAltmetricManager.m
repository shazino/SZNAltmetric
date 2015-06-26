//
// SZNAltmetricManager.m
//
// Copyright (c) 2013-2015 shazino (shazino SAS), http://www.shazino.com/
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

#import "SZNAltmetricManager.h"

#import "SZNAltmetricArticle.h"
#import "SZNAltmetricRequestSerializer.h"
#import "SZNAltmetricResponseSerializer.h"


@interface SZNAltmetricManager ()

- (NSURLSessionDataTask *)fetchPaginatedArticlesWithPath:(NSString *)path
                                              parameters:(NSDictionary *)parameters
                                                 success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                                 failure:(SZNAltmetricFetchArticleFailureBlock)failure;
- (NSURLSessionDataTask *)fetchArticleWithPath:(NSString *)path
                                    identifier:(NSString *)identifier
                                       success:(SZNAltmetricFetchArticleSuccessBlock)success
                                       failure:(SZNAltmetricFetchArticleFailureBlock)failure;

@end


@implementation SZNAltmetricManager

+ (SZNAltmetricManager *)sharedManager {
    static SZNAltmetricManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *URL = [NSURL URLWithString:@"http://api.altmetric.com/v1/"];
        _sharedClient = [[self alloc] initWithBaseURL:URL];
    });

    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];

    if (self) {
        self.requestSerializer  = [SZNAltmetricRequestSerializer serializer];
        self.responseSerializer = [SZNAltmetricResponseSerializer serializer];
    }

    return self;
}


#pragma mark -

- (void)setAPIKey:(NSString * __nullable)APIKey {
    [(SZNAltmetricRequestSerializer *)self.requestSerializer setAPIKey:APIKey];
}

- (NSString *)APIKey {
    return [(SZNAltmetricRequestSerializer *)self.requestSerializer APIKey];
}


#pragma mark -

- (NSURLSessionDataTask *)fetchArticleWithAltmetricIdentifier:(NSString *)altmetricIdentifier
                                                      success:(SZNAltmetricFetchArticleSuccessBlock)success
                                                      failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:@"id" identifier:altmetricIdentifier success:success failure:failure];
}

- (NSURLSessionDataTask *)fetchArticleWithDOI:(NSString *)DOI
                                      success:(SZNAltmetricFetchArticleSuccessBlock)success
                                      failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:@"doi" identifier:DOI success:success failure:failure];
}

- (NSURLSessionDataTask *)fetchArticleWithPubMedIdentifier:(NSString *)pubMedIdentifier
                                                   success:(SZNAltmetricFetchArticleSuccessBlock)success
                                                   failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:@"pmid" identifier:pubMedIdentifier success:success failure:failure];
}

- (NSURLSessionDataTask *)fetchArticleWithArXivIdentifier:(NSString *)arXivIdentifier
                                                  success:(SZNAltmetricFetchArticleSuccessBlock)success
                                                  failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:@"arxiv" identifier:arXivIdentifier success:success failure:failure];
}

- (NSURLSessionDataTask *)fetchArticleWithADSBibcode:(NSString *)ADSBibcode
                                             success:(SZNAltmetricFetchArticleSuccessBlock)success
                                             failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:@"ads" identifier:ADSBibcode success:success failure:failure];
}

- (NSURLSessionDataTask *)fetchArticlesCitationsWithTimeframe:(NSString *)timeframe
                                                      success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                                      failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticlesCitationsWithTimeframe:timeframe
                                                page:0
                                     numberOfResults:0
                                             citedIn:nil
                                           DOIPrefix:nil
                                      NLMIdentifiers:nil
                                            subjects:nil
                                             success:success
                                             failure:failure];
}

- (NSURLSessionDataTask *)fetchArticlesCitationsWithTimeframe:(NSString *)timeframe
                                                         page:(NSUInteger)page
                                              numberOfResults:(NSUInteger)numberOfResults
                                                      citedIn:(NSString *)citedIn
                                                    DOIPrefix:(NSString *)DOIPrefix
                                               NLMIdentifiers:(NSString *)NLMIdentifiers
                                                     subjects:(NSString *)subjects
                                                      success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                                      failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    if (page > 0) {
        parameters[@"page"] = @(page);
    }

    if (numberOfResults > 0) {
        parameters[@"num_results"] = @(numberOfResults);
    }

    if (citedIn) {
        parameters[@"cited_in"] = citedIn;
    }

    if (DOIPrefix) {
        parameters[@"doi_prefix"] = DOIPrefix;
    }

    if (NLMIdentifiers) {
        parameters[@"nlmid"] = NLMIdentifiers;
    }

    if (subjects) {
        parameters[@"subject"] = subjects;
    }

    return [self fetchPaginatedArticlesWithPath:[@"citations" stringByAppendingPathComponent:timeframe]
                                     parameters:parameters
                                        success:success
                                        failure:failure];
}

- (NSURLSessionDataTask *)fetchArticleDetailsWithIdentifierType:(NSString *)identifierType
                                                     identifier:(NSString *)identifier
                                                        success:(SZNAltmetricFetchArticleSuccessBlock)success
                                                        failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self fetchArticleWithPath:[@"fetch" stringByAppendingPathComponent:identifierType]
                           identifier:identifier
                              success:success
                              failure:failure];
}

- (NSURLSessionDataTask *)fetchPaginatedArticlesWithPath:(NSString *)path
                                                parameters:(NSDictionary *)parameters
                                                   success:(SZNAltmetricFetchPaginatedArticlesSuccessBlock)success
                                                   failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    NSURLSessionDataTask *operation =
    [self
     GET:path
     parameters:parameters
     success:^(NSURLSessionDataTask *task, id responseObject) {
         if (![responseObject isKindOfClass:NSDictionary.class]) {
             if (failure) {
                 failure(nil);
             }
             return;
         }

         if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
             NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)task.response;

             NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
             numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
             self.dailyRateLimit      = [numberFormatter numberFromString:HTTPResponse.allHeaderFields[@"X-DailyRateLimit-Limit"]];
             self.dailyRateRemaining  = [numberFormatter numberFromString:HTTPResponse.allHeaderFields[@"X-DailyRateLimit-Remaining"]];
             self.hourlyRateLimit     = [numberFormatter numberFromString:HTTPResponse.allHeaderFields[@"X-HourlyRateLimit-Limit"]];
             self.hourlyRateRemaining = [numberFormatter numberFromString:HTTPResponse.allHeaderFields[@"X-HourlyRateLimit-Remaining"]];
         }

         if (responseObject[@"results"] && responseObject[@"query"]) {
             NSNumber *page  = responseObject[@"query"][@"page"];
             NSNumber *total = responseObject[@"query"][@"total"];

             NSMutableArray *results = [NSMutableArray array];
             for (NSDictionary *result in responseObject[@"results"]) {
                 SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:result];
                 if (article) {
                     [results addObject:article];
                 }
             }

             if (success) {
                 success(results, total.unsignedIntegerValue, page.unsignedIntegerValue);
             }
         }
         else {
             SZNAltmetricArticle *article = [SZNAltmetricArticle articleWithAPIResponseObject:responseObject];

             if (success) {
                 success(article ? @[article] : @[], NSNotFound, NSNotFound);
             }
         }
     }
     failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];

    return operation;
}

- (NSURLSessionDataTask *)fetchArticleWithPath:(NSString *)path
                                    identifier:(NSString *)identifier
                                       success:(SZNAltmetricFetchArticleSuccessBlock)success
                                       failure:(SZNAltmetricFetchArticleFailureBlock)failure {
    return [self
            fetchPaginatedArticlesWithPath:[path stringByAppendingPathComponent:identifier]
            parameters:nil
            success:^(NSArray *results, NSUInteger total, NSUInteger page) {
                if (success) {
                    success(results.lastObject);
                }
            }
            failure:failure];
}

@end
