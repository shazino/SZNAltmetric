//
//  SZNArticleViewController.h
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 28/03/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZNAltmetricArticle;

@interface SZNArticleViewController : UIViewController

@property (strong, nonatomic) SZNAltmetricArticle *article;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
