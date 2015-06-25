//
//  SZNArticleViewController.h
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013-2015 shazino. All rights reserved.
//

@import UIKit;

@class SZNAltmetricArticle;

@interface SZNArticleViewController : UIViewController

@property (strong, nonatomic) SZNAltmetricArticle *article;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *altmetricIdentifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *DOILabel;
@property (weak, nonatomic) IBOutlet UILabel *arXivLabel;
@property (weak, nonatomic) IBOutlet UILabel *NLMIdentifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *pubMedIdentifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *ADSBibcodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *journalLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedOnLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastUpdatedLabel;
@property (weak, nonatomic) IBOutlet UILabel *addedOnLabel;

@property (weak, nonatomic) IBOutlet UILabel *articleURLLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsURLLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetersLabel;
@property (weak, nonatomic) IBOutlet UILabel *facebookUsersLabel;
@property (weak, nonatomic) IBOutlet UILabel *scienceBlogsLabel;
@property (weak, nonatomic) IBOutlet UILabel *googlePlusLabel;

@property (weak, nonatomic) IBOutlet UILabel *readersMendeleyLabel;
@property (weak, nonatomic) IBOutlet UILabel *readersCiteULikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *readersConnoteaLabel;

@property (weak, nonatomic) IBOutlet UILabel *subjectsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scopusSubjectsLabel;

@property (weak, nonatomic) IBOutlet UILabel *quotesLabel;

@end
