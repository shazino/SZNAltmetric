//
//  SZNArticleViewController.m
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import "SZNArticleViewController.h"
#import <SZNAltmetric.h>
#import <AFNetworking.h>

@interface SZNArticleViewController ()

- (void)configureViewWithArticle:(SZNAltmetricArticle *)article;

@end


@implementation SZNArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureViewWithArticle:self.article];
}

- (void)setArticle:(SZNAltmetricArticle *)article
{
    _article = article;
    [self configureViewWithArticle:article];
}

- (void)configureViewWithArticle:(SZNAltmetricArticle *)article
{
    self.titleLabel.text = self.article.title;
    self.scoreLabel.text = [self.article.score stringValue];
    [self.imageView setImageWithURL:self.article.imageLargeURL];
}

@end
