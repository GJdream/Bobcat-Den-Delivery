//
//  HelloWorldViewController.m
//  Bobcat Den Delivery
//
//  Created by Matthew Perejda on 7/10/13.
//  Copyright (c) 2013 Matthew Perejda. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "TPKeyboardAvoidingScrollView.h"




@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet ADBannerView *banner;
@property (weak, nonatomic) IBOutlet UILabel *orderComplete;


    @property (nonatomic, retain) IBOutlet UITextField *name;
    @property (nonatomic, retain) IBOutlet UITextField *order;
    @property (nonatomic, retain) IBOutlet UITextField *phoneNumber;
    @property (nonatomic, retain) IBOutlet UITextField *location;


-(IBAction)textFieldDoneEditing:(id)sender;

-(IBAction)backgroundClick:(id)sender;


- (IBAction)placeOrder:(id)sender;

    - (void)connection:(NSURLConnection *)nsUrlConnection didReceiveResponse:(NSURLResponse *)response;
    - (void)connection:(NSURLConnection *)nsUrlConnection didReceiveData:(NSData *)data;
    - (void)connectionDidFinishLoading:(NSURLConnection *)nsUrlConnection;
    - (void)connection:(NSURLConnection *)nsUrlConnection didFailWithError:(NSError *)error;

-(void)bannerViewDidLoadAd: (ADBannerView *) banner;

-(void)bannerView: (ADBannerView *) baner didFailToReceiveAdWithError:(NSError *)error;


@end



@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_name resignFirstResponder];
    [_location resignFirstResponder];
    [_phoneNumber resignFirstResponder];
    [_order resignFirstResponder];
}
 




-(IBAction)textFieldDoneEditing:(id)sender;
{
    [sender resignFirstResponder];
}



- (IBAction)placeOrder:(id)sender {
    
    NSURL *nsURL = [[NSURL alloc] initWithString:@"https://docs.google.com/spreadsheet/formResponse?formkey=dFItSzN2bnNUS2M0T01sb1U5Zmp3RlE6MA&amp;theme=0AX42CRMsmRFbUy1jZTMyMWExMy03YmU0LTQ2OTUtODBhNC00YjhlMTBjZTc3MGY&amp;ifq"];
    NSMutableURLRequest *nsMutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:nsURL];
    
    // Set the request's content type to application/x-www-form-urlencoded
    [nsMutableURLRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Set HTTP method to POST
    [nsMutableURLRequest setHTTPMethod:@"POST"];
    
    // Set up the parameters to send.
    NSString *paramDataString = [NSString stringWithFormat:@"%@=%@&%@=%@&%@=%@&%@=%@&pageNumber=0&backupCache=",@"entry.0.single", _name.text, @"entry.1.single", _location.text, @"entry.4.single", _phoneNumber.text, @"entry.2.single", _order.text];
    
    // Encode the parameters to default for NSMutableURLRequest.
    NSData *paramData = [paramDataString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Set the NSMutableURLRequest body data.
    [nsMutableURLRequest setHTTPBody: paramData];
    
    // Create NSURLConnection and start the request.
    NSURLConnection *nsUrlConnection=[[NSURLConnection alloc]initWithRequest:nsMutableURLRequest delegate:self];
    
    // Order Completion Notification
    NSString *greeting = [[NSString alloc] initWithFormat:@"Order Recieved! See you soon :)"];
    
    self.orderComplete.text = greeting;
    
    
}

// Checking the linkage between app and nsUrlConnection
- (void)connection:(NSURLConnection *)nsUrlConnection didReceiveResponse:(NSURLResponse *)response {
        responseData = [[NSMutableData alloc] init];
}
    
- (void)connection:(NSURLConnection *)nsUrlConnection didReceiveData:(NSData *)data {
        [responseData appendData:data];
}
    
- (void)connectionDidFinishLoading:(NSURLConnection *)nsUrlConnection {
        NSLog(@"RESPONSE: %@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
}
    
- (void)connection:(NSURLConnection *)nsUrlConnection didFailWithError:(NSError *)error {
        NSLog(@"CONNECTION ERROR: %@", [error localizedDescription]);
}




//iAd

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}



- (void)bannerView:(ADBannerView *) banner didFailToReceiveAdWithError:(NSError *)error

{
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}




@end

