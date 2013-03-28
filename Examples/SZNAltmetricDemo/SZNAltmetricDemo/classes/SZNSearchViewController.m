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

@implementation SZNSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[SZNArticleViewController class]])
    {
        [[SZNAltmetricAPIClient sharedClient] fetchArticleWithDOI:self.DOITextField.text success:^(SZNAltmetricArticle *article) {
            ((SZNArticleViewController *)segue.destinationViewController).article = article;
        } failure:^(NSError *error) {
            NSLog(@"%s %@", __PRETTY_FUNCTION__, [error description]);
        }];
    }
}

@end
