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
    ((UIScrollView *)self.view).alwaysBounceVertical = YES;
    ((UIScrollView *)self.view).contentSize = CGSizeMake(self.view.frame.size.width, self.googlePlusLabel.frame.origin.y + 70);
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
    [self.imageView setImageWithURL:self.article.imageLargeURL];
    self.scoreLabel.text = [self.article.score stringValue];
    self.altmetricIdentifierLabel.text = article.identifier;
    self.DOILabel.text = article.DOI;
    self.arXivLabel.text = article.arXiv;
    self.NLMIdentifierLabel.text = article.NLMIdentifier;
    self.pubMedIdentifierLabel.text = article.pubMedIdentifier;
    self.ADSBibcodeLabel.text = article.ADSBibcode;
    self.journalLabel.text = article.journal;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    dateFormatter.doesRelativeDateFormatting = YES;
    self.publishedOnLabel.text = [dateFormatter stringFromDate:article.publishedOn];
    self.lastUpdatedLabel.text = [dateFormatter stringFromDate:article.lastUpdated];
    self.addedOnLabel.text = [dateFormatter stringFromDate:article.addedOn];
    
    self.articleURLLabel.text = [article.articleURL absoluteString];
    self.detailsURLLabel.text = [article.detailsURL absoluteString];
    
    self.tweetersLabel.text = [article.citedByTweetersCount stringValue];
    self.facebookUsersLabel.text = [article.citedByFacebookWallsCount stringValue];
    self.scienceBlogsLabel.text = [article.citedByFeedsCount stringValue];
    self.googlePlusLabel.text = [article.citedByGooglePlusCount stringValue];
}

@end
