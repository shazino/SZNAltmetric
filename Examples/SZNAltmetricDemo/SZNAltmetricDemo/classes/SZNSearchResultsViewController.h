//
//  SZNSearchResultsViewController.h
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 23/04/13.
//  Copyright (c) 2013-2016 shazino. All rights reserved.
//

@import UIKit;

@class SZNAltmetricArticle;


@interface SZNSearchResultsViewController : UITableViewController

@property (nonatomic, strong, nullable) NSArray <SZNAltmetricArticle *> *searchResults;

@end
