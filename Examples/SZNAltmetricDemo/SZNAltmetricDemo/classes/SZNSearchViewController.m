//
//  SZNSearchViewController.m
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import "SZNSearchViewController.h"

#import <SZNAltmetric.h>
#import "SZNArticleViewController.h"
#import "SZNSearchResultsViewController.h"

@implementation SZNSearchViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[SZNArticleViewController class]]) {
        [[SZNAltmetricAPIClient sharedClient] fetchArticleWithDOI:self.searchTextField.text success:^(SZNAltmetricArticle *article) {
            ((SZNArticleViewController *)segue.destinationViewController).article = article;
        } failure:^(NSError *error) {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@\n(%@)", [error localizedDescription], [error localizedRecoverySuggestion]]
                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            NSLog(@"%s %@", __PRETTY_FUNCTION__, [error description]);
        }];
    }
    else if ([segue.destinationViewController isKindOfClass:[SZNSearchResultsViewController class]]) {
        [[SZNAltmetricAPIClient sharedClient] fetchArticlesCitationsWithTimeframe:self.searchTextField.text success:^(NSArray *articles, NSUInteger total, NSUInteger page) {
            ((SZNSearchResultsViewController *)segue.destinationViewController).searchResults = articles;
            [((SZNSearchResultsViewController *)segue.destinationViewController).tableView reloadData];
        } failure:^(NSError *error) {
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@\n(%@)", [error localizedDescription], [error localizedRecoverySuggestion]]
                                       delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            NSLog(@"%s %@", __PRETTY_FUNCTION__, [error description]);
        }];
    }
}

@end
