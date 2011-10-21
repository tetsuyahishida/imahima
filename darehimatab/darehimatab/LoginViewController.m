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
    NSURL *myURL = [NSURL URLWithString:@"https://graph.facebook.com/oauth/authorize?client_id=232995166751084&redirect_uri=http://49.212.4.124:3000/oauth/redirect&scope=user_photos,friends_photos,offline_access,sms"];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    UIApplication *application = [UIApplication sharedApplication];

    [login_View loadRequest:myURLReq];
    application.networkActivityIndicatorVisible = NO;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    currenturl=[[[request URL] standardizedURL] absoluteString];
    NSRange searchResult = [currenturl rangeOfString:@"="];
    if(searchResult.location == NSNotFound){

//とりあえずaccess_tokenをリンクのURLから手作業で取得した
   access_token=@"AAADT6GomCWwBAOwZBAlCps0gxAyMyhiA476fG2KOpTZAITOewtcNnUUT1Shy1i6g81iIspH6gXfpBqhU46ZCDZB6N8DCbiYZD";
//        int startnum =searchResult.location+5;
//        int endnum =currenturl.length-4;
//        access_token=[[currenturl substringToIndex:endnum] substringFromIndex:startnum]; 
//        // みつかった場合の処理
        [self.delegate loginViewController:self request:login_View andget:access_token];
        return YES;
    }
    else{
    
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
