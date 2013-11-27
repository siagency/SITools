//
//  SIAImageButton.m
//  SIATools
//
//  Created by KUROSAKI Ryota on 2010/09/24.
//  Copyright (c) 2010 SI Agency Inc. All rights reserved.
//

#if !__has_feature(objc_arc)
#error This code needs compiler option -fobjc_arc
#endif

#import "SIAImageButton.h"
#import "SIAImageCache.h"
#import "SIAConnectionOperation.h"
#import "SIAToolsLogger.h"

@interface SIAImageButton ()
@property (nonatomic, weak) id observer;
@end

@implementation SIAImageButton

- (void)dealloc
{
    SIAToolsDLog(@">>");
    [SIAImageCache.sharedCache removeObserver:self.observer];
    [_indicatorView removeFromSuperview];
    SIAToolsDLog(@"<<");
}

- (void)setDownloadedImage:(UIImage *)image
{
    SIAToolsDLog(@">>image=%@", image);
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self stopIndicator];
    SIAToolsDLog(@"<<");
}

#pragma mark - property method

- (void)setImageURL:(NSURL *)URL
{
    SIAToolsDLog(@">>URL=%@", URL);
    if (![URL isEqual:_imageURL]) {
        _imageURL = URL;
        [self setBackgroundImage:nil forState:UIControlStateNormal];
        
        if ([URL isFileURL] || [[URL absoluteString] hasPrefix:@"/"]) {
            SIAToolsDLog(@"ローカルのファイルしていなのでそのまま読み込む");
            UIImage *image = [UIImage imageWithContentsOfFile:[URL path]];
            [self setBackgroundImage:image forState:UIControlStateNormal];
            SIAToolsDLog(@"<<");
            return;
        }
        
        [self startIndicator];
        
        self.observer = [SIAImageCache.sharedCache cacheImageForURL:_imageURL receiver:^(NSString *path) {
            SIAToolsDLog(@">>path=%@", path);
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            [self setDownloadedImage:image];
            [SIAImageCache.sharedCache removeObserver:self.observer];
            SIAToolsDLog(@"<<");
        }];
    }
    SIAToolsDLog(@"<<");
}

- (void)startIndicator
{
    SIAToolsDLog(@">>");
    if (!self.indicatorView) {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        [self addSubview:indicatorView];
        self.indicatorView   = indicatorView;
    }
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
    SIAToolsDLog(@"<<");
}

- (void)stopIndicator
{
    SIAToolsDLog(@">>");
    [self.indicatorView stopAnimating];
    self.indicatorView.hidden = YES;
    SIAToolsDLog(@"<<");
}

@end