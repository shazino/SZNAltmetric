//
//  SZNArticleViewController.h
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013-2016 shazino. All rights reserved.
//

@import UIKit;

@class SZNAltmetricArticle;


@interface SZNArticleViewController : UIViewController

@property (nonatomic, strong, nullable) SZNAltmetricArticle *article;

@property (nonatomic, weak, nullable) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak, nullable) IBOutlet UIImageView *imageView;

@property (nonatomic, weak, nullable) IBOutlet UILabel *altmetricIdentifierLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *DOILabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *arXivLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *NLMIdentifierLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *pubMedIdentifierLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *ADSBibcodeLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *journalLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *publishedOnLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *lastUpdatedLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *addedOnLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *articleURLLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *detailsURLLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *tweetersLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *facebookUsersLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *scienceBlogsLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *googlePlusLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *readersMendeleyLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *readersCiteULikeLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *readersConnoteaLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *subjectsLabel;
@property (nonatomic, weak, nullable) IBOutlet UILabel *scopusSubjectsLabel;

@property (nonatomic, weak, nullable) IBOutlet UILabel *quotesLabel;

@end
