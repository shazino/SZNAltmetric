//
//  SZNAppDelegate.m
//  SZNAltmetricDemoOSX
//
//  Created by Vincent Tourraine on 02/04/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import "SZNAppDelegate.h"
#import <SZNAltmetric.h>

@implementation SZNAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // [SZNAltmetricAPIClient sharedClient].APIKey = @"###";
}

- (IBAction)fetchArticle:(id)sender
{
    [[SZNAltmetricAPIClient sharedClient] fetchArticleWithDOI:self.DOITextField.stringValue success:^(SZNAltmetricArticle *article) {
        self.representedArticle = article;
        self.scoreImageView.image = [[NSImage alloc] initWithContentsOfURL:article.imageLargeURL];
    } failure:^(NSError *error) {
        NSLog(@"%s %@", __PRETTY_FUNCTION__, [error description]);
        [[NSAlert alertWithError:error] runModal];
    }];
}

@end
