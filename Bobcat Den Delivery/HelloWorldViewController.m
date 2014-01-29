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
@property (weak, nonatomic) IBOutlet UITextView *order;
@property (weak, nonatomic) IBOutlet UILabel *orderComplete;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *phoneNumber;
@property (nonatomic, retain) IBOutlet UITextField *location;


-(IBAction)textFieldDoneEditing:(id)sender;



- (IBAction)placeOrder:(id)sender;

    - (void)connection:(NSURLConnection *)nsUrlConnection didReceiveResponse:(NSURLResponse *)response;
    - (void)connection:(NSURLConnection *)nsUrlConnection didReceiveData:(NSData *)data;
    - (void)connectionDidFinishLoading:(NSURLConnection *)nsUrlConnection;
    - (void)connection:(NSURLConnection *)nsUrlConnection didFailWithError:(NSError *)error;
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
    
    NSURL *nsURL = [[NSURL alloc] initWithString:@"http://bobcat-den-delivery.herokuapp.com/orders.json"];
    NSMutableURLRequest *nsMutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:nsURL];
    
    // Set the request's content type to application/x-www-form-urlencoded
    [nsMutableURLRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // Set HTTP method to POST
    [nsMutableURLRequest setHTTPMethod:@"POST"];
    
    // Set up the parameters to send.
    NSString *jsonString = [NSString stringWithFormat:@"{ \"order\":{ \"name\":\"%@\", \"location\":\"%@\", \"phone_number\":\"%@\",  \"food\":\"%@\"}}", _name.text, _location.text, _phoneNumber.text, _order.text];
    
    // Encode the parameters to default for NSMutableURLRequest.
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Set the NSMutableURLRequest body data.
    [nsMutableURLRequest setHTTPBody: jsonData];
    
    // Create NSURLConnection and start the request.
    NSURLConnection *nsUrlConnection=[[NSURLConnection alloc]initWithRequest:nsMutableURLRequest delegate:self];
    
    // Order Completion Notification
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Order Recieved!" message:@"We'll be over with your delicious food as soon as we can." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
    
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

@end

