# SZNAltmetric
**Objective-C client for the Altmetric API.**
[![Build Status](https://travis-ci.org/shazino/SZNAltmetric.png?branch=master)](https://travis-ci.org/shazino/SZNAltmetric)

> _This is still in early stages of development, so proceed with caution when using this in a production application.
> Any bug reports, feature requests, or general feedback at this point would be greatly appreciated._

SZNAltmetric is an [Altmetric API](http://api.altmetric.com) client for iOS and Mac OS X. It’s built on top of [AFNetworking](http://www.github.com/AFNetworking/AFNetworking) to deal with network operations.

## Example Usage

We wanted to make it as simple as possible to fetch details about an article from the API, so here is how it looks like:

```objectivec
// Let’s specify an API key (optional)
SZNAltmetricAPIClient *client = [SZNAltmetricAPIClient sharedClient];
client.APIKey = @"###abc123###";

// Okay, now let’s fetch some data
[client fetchArticleWithDOI:@"###DOI###"
                    success:^(SZNAltmetricArticle *article) {
                        // We have the article, 
                        // we can log the Altmetric score
                        NSLog(@"%@", [article.score stringValue]);
                    } failure:nil];
```

As you can see, we have just requested an article based on its DOI (you can also use Altmetric ID, PubMed ID, arXiv ID, and ADS Bibcode). What you get is a `SZNAltmetricArticle` object, containing all the identifiers, the Altmetric score, and even the URLs to the “donuts” images.

## References

- [Changelog](https://github.com/shazino/SZNAltmetric/wiki/Changelog)

## Requirements

SZNAltmetric requires Xcode 4.4 with either the iOS 5.0 or Mac OS X 10.7, as well as [AFNetworking](https://github.com/AFNetworking/AFNetworking).

## Credits

SZNAltmetric is developed by [shazino](http://www.shazino.com).

## License

SZNAltmetric is available under the MIT license. See the LICENSE file for more info.
