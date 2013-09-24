//
//  HelloWorldViewController.h
//  Bobcat Den Delivery
//
//  Created by Matthew Perejda on 7/10/13.
//  Copyright (c) 2013 Matthew Perejda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <iAd/iAd.h>



@interface HelloWorldViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate, ADBannerViewDelegate>

    {    
        NSMutableData *responseData;
        ADBannerView *adView;
        BOOL bannerIsVisible;
    }


    @property (copy, nonatomic) NSString *greetingName;
    @property (nonatomic, assign) BOOL bannerIsVisible;

@end











