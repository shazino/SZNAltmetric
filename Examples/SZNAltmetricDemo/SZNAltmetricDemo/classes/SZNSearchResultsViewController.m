//
//  SZNSearchResultsViewController.m
//  SZNAltmetricDemo
//
//  Created by Vincent Tourraine on 23/04/13.
//  Copyright (c) 2013 shazino. All rights reserved.
//

#import "SZNSearchResultsViewController.h"
#import <SZNAltmetric.h>
#import "SZNArticleViewController.h"

@implementation SZNSearchResultsViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[SZNArticleViewController class]])
    {
        ((SZNArticleViewController *)segue.destinationViewController).article = self.searchResults[self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SZNArticleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SZNAltmetricArticle *article = self.searchResults[indexPath.row];
    cell.textLabel.text = article.title;
    cell.detailTextLabel.text = [article.articleURL absoluteString];
    [cell.imageView setImageWithURL:article.imageSmallURL];
    
    return cell;
}

@end
