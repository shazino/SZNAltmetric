# SZNAltmetric

**Objective-C client for the Altmetric API.**

![Platform](https://img.shields.io/cocoapods/p/SZNAltmetric.svg)
[![Build Status](https://travis-ci.org/shazino/SZNAltmetric.png?branch=master)](https://travis-ci.org/shazino/SZNAltmetric)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SZNAltmetric.svg)](https://img.shields.io/cocoapods/v/SZNAltmetric.svg)
[![CocoaPods documentation](https://img.shields.io/cocoapods/metrics/doc-percent/SZNAltmetric.svg)](http://cocoadocs.org/docsets/SZNAltmetric)
[![MIT license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/shazino/SZNAltmetric/raw/master/LICENSE)

SZNAltmetric is an [Altmetric API](http://api.altmetric.com) client for iOS and Mac OS X. It’s built on top of [AFNetworking](http://www.github.com/AFNetworking/AFNetworking) to deal with network operations, and based on `NSURLSession`.

## Getting Started

The easiest way to get started is to use [CocoaPods](http://cocoapods.org) to manage your dependencies. Follow the instructions on the CocoaPods site to install the gem, and specify SZNAltmetric as a dependency in your `Podfile`:

```
pod 'SZNAltmetric', '~> 2.1'
```


## Example Usage

We wanted to make it as simple as possible to fetch details about an article from the API, so here is how it looks like:

```objectivec
SZNAltmetricManager *manager = [SZNAltmetricManager sharedManager];

[manager
 fetchArticleWithDOI:@"###DOI###"
 success:^(SZNAltmetricArticle *article) {
     // We have the article,
     // we can log the Altmetric score
     NSLog(@"%@", [article.score stringValue]);
 }
 failure:nil];
```

As you can see, we have just requested an article based on its DOI. What you get is a `SZNAltmetricArticle` object, containing all the identifiers, the Altmetric score, and even the URLs to the “donuts” images.

Having a client API key is optional, and it’s easy to configure if you need it:

```objectivec
SZNAltmetricManager *manager = [SZNAltmetricManager sharedManager];
manager.APIKey = @"###key###";
```

With just a bit of user interface, here’s how it looks like on iOS and OS X:

![iOS demo app](https://github.com/shazino/SZNAltmetric/wiki/img/v0-3/screen-iOS-400px.png)

![OS X demo app](https://github.com/shazino/SZNAltmetric/wiki/img/v0-3/screen-OSX.png)

You can also search articles with different types of identifiers (Altmetric ID, PubMed ID, arXiv ID, and ADS Bibcode), or with a timeframe:

```objectivec
SZNAltmetricManager *manager = [SZNAltmetricManager sharedManager];

[manager
 fetchArticlesCitationsWithTimeframe:@"1d"
 success:^(NSArray *articles, NSUInteger total, NSUInteger page) {
     // We have an array of articles.
     NSLog(@"%@", articles);
 }
 failure:nil];
```


## References

- [Getting Started](https://github.com/shazino/SZNAltmetric/wiki/Getting-Started)
- [Documentation](http://cocoadocs.org/docsets/SZNAltmetric/)
- [Changelog](https://github.com/shazino/SZNAltmetric/wiki/Changelog)


## Requirements

SZNAltmetric requires Xcode 6.3 with either the iOS 7.0 or OS X 10.9, as well as [AFNetworking](https://github.com/AFNetworking/AFNetworking) and [ISO 8601 parser unparser](https://bitbucket.org/boredzo/iso-8601-parser-unparser/). Both SZNAltmetric and AFNetworking use [ARC](https://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html).

If you need to support older OS versions:

- [SZNAltmetric 1.x](https://github.com/shazino/SZNAltmetric/tree/1.0.3) supports iOS 5.0 and OS X 10.7
- [SZNAltmetric 2.0](https://github.com/shazino/SZNAltmetric/tree/2.0.) supports iOS 6.0 and OS X 10.8


## Credits

SZNAltmetric is developed by [Shazino](http://www.shazino.com).


## License

SZNAltmetric is available under the MIT license. See the LICENSE file for more info.
