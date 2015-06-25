# SZNAltmetric

**Objective-C client for the Altmetric API.**
[![Build Status](https://travis-ci.org/shazino/SZNAltmetric.png?branch=master)](https://travis-ci.org/shazino/SZNAltmetric)

SZNAltmetric is an [Altmetric API](http://api.altmetric.com) client for iOS and Mac OS X. It’s built on top of [AFNetworking](http://www.github.com/AFNetworking/AFNetworking) to deal with network operations.

## Getting Started

The easiest way to get started is to use [CocoaPods](http://cocoapods.org) to manage your dependencies. Follow the instructions on the CocoaPods site to install the gem, and specify SZNAltmetric as a dependency in your `Podfile`:

```
pod 'SZNAltmetric', '1.0.2'
```

If you want to install SZNAltmetric manually, you can read our [“Getting Started” guide](https://github.com/shazino/SZNAltmetric/wiki/Getting-Started).


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

With just a bit of user interface, here’s how it looks like on iOS and OS X:

![iOS demo app](https://github.com/shazino/SZNAltmetric/wiki/img/v0-3/screen-iOS-400px.png)

![OS X demo app](https://github.com/shazino/SZNAltmetric/wiki/img/v0-3/screen-OSX.png)


## References

- [Getting Started](https://github.com/shazino/SZNAltmetric/wiki/Getting-Started)
- [Documentation](http://shazino.github.io/SZNAltmetric/)
- [Changelog](https://github.com/shazino/SZNAltmetric/wiki/Changelog)


## Requirements

SZNAltmetric requires Xcode 4.4 with either the iOS 5.0 or Mac OS X 10.7, as well as [AFNetworking](https://github.com/AFNetworking/AFNetworking) and [ISO 8601 parser unparser](https://bitbucket.org/boredzo/iso-8601-parser-unparser/). Both SZNAltmetric and AFNetworking use [ARC](https://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html).


## Credits

SZNAltmetric is developed by [shazino](http://www.shazino.com).


## License

SZNAltmetric is available under the MIT license. See the LICENSE file for more info.
