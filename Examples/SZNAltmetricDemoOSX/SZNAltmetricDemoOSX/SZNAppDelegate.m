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
    [self.progressIndicator startAnimation:sender];
    [[SZNAltmetricAPIClient sharedClient] fetchArticleWithDOI:self.DOITextField.stringValue success:^(SZNAltmetricArticle *article) {
        self.representedArticle = article;
        self.scoreImageView.image = [[NSImage alloc] initWithContentsOfURL:article.imageLargeURL];
        [self.progressIndicator stopAnimation:sender];
    } failure:^(NSError *error) {
        NSLog(@"%s %@", __PRETTY_FUNCTION__, [error description]);
        [[NSAlert alertWithError:error] runModal];
        [self.progressIndicator stopAnimation:sender];
    }];
}

- (IBAction)openArticleURL:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:self.representedArticle.articleURL];
}

- (IBAction)openDetailsURL:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:self.representedArticle.detailsURL];
}

@end


@implementation SZNArrayToStringWithCommaTransformer

+ (Class)transformedValueClass
{
    return [NSArray class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    return (value == nil) ? nil : [(NSArray *)value componentsJoinedByString:@", "];
}

@end

@implementation SZNArrayToStringWithLineBreakTransformer

+ (Class)transformedValueClass
{
    return [NSArray class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    return (value == nil) ? nil : [(NSArray *)value componentsJoinedByString:@"\n"];
}

@end