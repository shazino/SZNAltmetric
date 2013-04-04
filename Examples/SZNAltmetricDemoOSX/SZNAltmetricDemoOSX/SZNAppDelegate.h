//
//  SZNAppDelegate.h
//  SZNAltmetricDemoOSX
//
//  Created by Vincent Tourraine on 02/04/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SZNAltmetricArticle;

@interface SZNAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, weak) IBOutlet NSTextField *DOITextField;
@property (nonatomic, weak) IBOutlet NSTextField *scoreTextField;
@property (nonatomic, weak) IBOutlet NSImageView *scoreImageView;
@property (nonatomic, weak) IBOutlet NSProgressIndicator *progressIndicator;

@property (nonatomic, strong) SZNAltmetricArticle *representedArticle;

- (IBAction)fetchArticle:(id)sender;
- (IBAction)openArticleURL:(id)sender;
- (IBAction)openDetailsURL:(id)sender;

@end
