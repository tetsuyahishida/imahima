//
//  LoginViewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize delegate;
@synthesize currenturl;
@synthesize access_token;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL *myURL = [NSURL URLWithString:@"http://49.212.4.124:3000/"];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [login_View loadRequest:myURLReq];

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    currenturl=[[[request URL] standardizedURL] absoluteString];
    NSRange searchResult = [currenturl rangeOfString:@"code="];

    if(searchResult.location == NSNotFound){
        return YES;
        // みつからない場合の処理
    }else{
        int startnum =searchResult.location+5;
        int endnum =currenturl.length-4;
        access_token=[[currenturl substringToIndex:endnum] substringFromIndex:startnum]; 
        // みつかった場合の処理
        [self.delegate loginViewController:self request:login_View andget:access_token];
        return YES;
    }
}





- (void)viewDidUnload
{
        
    login_View = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [login_View release];
    [super dealloc];
}
@end
