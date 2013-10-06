//
//  FAQViewController.m
//  Bobcat Den Delivery
//
//  Created by Matthew Perejda on 10/6/13.
//  Copyright (c) 2013 Matthew Perejda. All rights reserved.
//

#import "FAQViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface FAQViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UIImageView *faq;

@end

@implementation FAQViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
