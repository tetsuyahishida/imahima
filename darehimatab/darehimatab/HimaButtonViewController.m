//
//  HimaButtonViewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/04.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HimaButtonViewController.h"

@implementation HimaButtonViewController
@synthesize HimaWebView;

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

    NSURL *myURL_fake
    =[NSURL URLWithString:@"http://49.212.4.124:3000"];
    NSURLRequest *myURLReq_fake = [NSURLRequest requestWithURL:myURL_fake];
    [HimaWebView loadRequest:myURLReq_fake]; 
}

- (void)viewDidUnload
{
    [self setHimaWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)HimaDeclare:(id)sender {
    NSUserDefaults*defaults =[NSUserDefaults standardUserDefaults];
    NSURL *myURL
    =[NSURL URLWithString:[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima?access_token=%@&latitude=11.1&longtitude=12.2",[defaults stringForKey:@"accesstoken"]]];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [HimaWebView loadRequest:myURLReq]; 

}
- (void)dealloc {
    [HimaWebView release];
    [super dealloc];
}
@end
