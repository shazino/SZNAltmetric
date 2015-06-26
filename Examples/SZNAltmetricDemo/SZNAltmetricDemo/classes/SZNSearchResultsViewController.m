//
//  SZNSearchResultsViewController.m
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 23/04/13.
//  Copyright (c) 2013-2015 shazino. All rights reserved.
//

#import "SZNSearchResultsViewController.h"

#import <SZNAltmetric.h>

#import <AFNetworking/UIImageView+AFNetworking.h>

#import "SZNArticleViewController.h"

@interface SZNSearchResultsViewController ()

@property (strong, nonatomic) UIImage *placeholderImage;

@end


@implementation SZNSearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // UITableViewCell needs a placeholder image to layout its subviews before the actual image loads (async)
    UIGraphicsBeginImageContext(CGSizeMake(32, 32));
    self.placeholderImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[SZNArticleViewController class]]) {
        ((SZNArticleViewController *)segue.destinationViewController).article = self.searchResults[self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SZNArticleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    SZNAltmetricArticle *article = self.searchResults[indexPath.row];
    cell.textLabel.text = article.title;
    cell.detailTextLabel.text = [article.articleURL absoluteString];
    [cell.imageView setImageWithURL:article.imageSmallURL placeholderImage:self.placeholderImage];

    return cell;
}

@end
