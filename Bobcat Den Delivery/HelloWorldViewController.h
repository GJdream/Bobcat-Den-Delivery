//
//  HelloWorldViewController.h
//  Bobcat Den Delivery
//
//  Created by Matthew Perejda on 7/10/13.
//  Copyright (c) 2013 Matthew Perejda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface HelloWorldViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate, UIScrollViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate, UIAlertViewDelegate>

    {    
        NSMutableData *responseData;
    }

    @property (copy, nonatomic) NSString *greetingName;

@end











