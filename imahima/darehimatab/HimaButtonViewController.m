//
//  HimaButtonViewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/04.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HimaButtonViewController.h"

@implementation HimaButtonViewController
@synthesize HimaWebView,mylatitude,mylongitude;

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
    cancelButton.hidden =YES;
    NSURL *myURL_fake
    =[NSURL URLWithString:@"http://49.212.4.124:3000"];
    NSURLRequest *myURLReq_fake = [NSURLRequest requestWithURL:myURL_fake];
    [HimaWebView loadRequest:myURLReq_fake]; 
    
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


- (void)viewDidUnload
{
    
    [self setHimaWebView:nil];
    [himaButton release];
    himaButton = nil;
    [cancelButton release];
    cancelButton = nil;
    [self HimaCancel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

   


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
//newLocationがポインターになっている
          fromLocation:(CLLocation *)oldLocation {
    self.mylatitude = [NSString stringWithFormat:@"%g",
                     newLocation.coordinate.latitude];
    self.mylongitude = [NSString stringWithFormat:@"%g",
                     newLocation.coordinate.longitude];
    //インスタンスを生成したくないのでクラス宣言の関数 
}

- (IBAction)HimaDeclare:(id)sender {

    
    NSUserDefaults*defaults =[NSUserDefaults standardUserDefaults];
    NSURL *myURL
    =[NSURL URLWithString:[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima?access_token=%@&latitude=%@&longitude=%@",[defaults stringForKey:@"accesstoken"],self.mylatitude,self.mylongitude]];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [HimaWebView loadRequest:myURLReq]; 
    cancelButton.hidden = NO;

}

- (IBAction)HimaCancel:(id)sender {
    NSUserDefaults*defaults =[NSUserDefaults standardUserDefaults];
    NSURL *myURL
    =[NSURL URLWithString:[NSString stringWithFormat:@"http://49.212.4.124:3000/top/cancel?access_token=%@",[defaults stringForKey:@"accesstoken"]]];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [HimaWebView loadRequest:myURLReq]; 
    cancelButton.hidden = YES;
    
}
- (void)dealloc {
    [HimaWebView release];
    [lm release];
    [himaButton release];
    [cancelButton release];
    [super dealloc];
}
@end
