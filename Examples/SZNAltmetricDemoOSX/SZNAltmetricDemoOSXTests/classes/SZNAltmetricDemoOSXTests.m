//
//  SZNAltmetricDemoOSXTests.m
//  SZNAltmetricDemoOSXTests
//
//  Created by Vincent Tourraine on 02/04/13.
//  Copyright (c) 2013-2016 shazino. All rights reserved.
//

@import XCTest;

#import <SZNAltmetric.h>

@class SZNAltmetricAPIClient;

@interface SZNAltmetricDemoOSXTests : XCTestCase

@property (nonatomic, strong) SZNAltmetricManager *client;

@end


@implementation SZNAltmetricDemoOSXTests

- (void)setUp
{
    [super setUp];
    self.client = [[SZNAltmetricManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.altmetric.com/v1/"]];
}

- (void)tearDown
{
    self.client = nil;
    [super tearDown];
}

- (void)testInit
{
    XCTAssertNotNil(self.client, @"The API client should be initialized");
}

@end
