//
//  himaDetailViewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "himaDetailViewController.h"
#import "himatableViewController.h"
#import "Annotation.h"

@implementation HimaDetailViewController
@synthesize the_facebook_name;
@synthesize the_facebook_image_url;
@synthesize longitude;
@synthesize latitude;
@synthesize currentAnnotation;

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
 	currentAnnotation = nil;
	himaMapView.delegate = self;
    // Do any additional setup after loading the view from its nib.
    
    nameLabel.text = the_facebook_name;
    NSURL *imageurl = [NSURL URLWithString: the_facebook_image_url];
    NSData *myData = [NSData dataWithContentsOfURL:imageurl];
    UIImage *myImage = [UIImage imageWithData:myData];
    facebook_image.image = myImage;

    //Nearbyよりコピー
    
	MKCoordinateRegion zoom = himaMapView.region;
	zoom.span.latitudeDelta = 0.01;
	zoom.span.longitudeDelta = 0.01;
	[himaMapView setRegion:zoom animated:NO];
    
	CLLocationCoordinate2D point;
	point.latitude  = [latitude doubleValue];
	point.longitude = [longitude doubleValue];
	[himaMapView setCenterCoordinate:point animated:NO];	
	
	if(currentAnnotation) {
		[himaMapView removeAnnotation:currentAnnotation];
		[currentAnnotation release];
		currentAnnotation = nil;
	}
    else{
	currentAnnotation = [[Annotation alloc] initWithCoordinate:point];
	currentAnnotation.title = the_facebook_name;
	[himaMapView addAnnotation:currentAnnotation];
    }
}

- (MKAnnotationView *) himaMapView:(MKMapView *)himaMapView viewForAnnotation:(id <MKAnnotation>) annotation{
    
    // annotationの中身（クラス名）を調べる
    Class cl = [annotation class];
    NSString *desc = [cl description];
    
    // MKUserLocation or Annotation
    if ([desc compare:@"Annotation"] == NSOrderedSame) {
        // Annotationクラスだった場合には、目的地の情報を示すためにコールアウトを設定する
        MKPinAnnotationView *annotateView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentAnnotation"] autorelease];
        annotateView.pinColor = MKPinAnnotationColorRed;
        annotateView.animatesDrop=YES;
        annotateView.canShowCallout = YES;
        UIButton *myDetailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotateView.rightCalloutAccessoryView = myDetailButton;
        return annotateView;
    }
    else {
        // ユーザーロケーション用のアノテーションは必要ないので設定しない
        // システムデフォルトのロケーション表示（青い波紋のようなアニメーション）で表現される
        return nil;
    }
}

- (void)viewDidUnload
{
    [facebook_image release];
    facebook_image = nil;
    [himaMapView release];
    himaMapView = nil;
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
    [facebook_image release];
    [himaMapView release];
    [super dealloc];
}
@end
