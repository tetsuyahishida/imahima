//
//  mapviewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapviewController.h"
#import "himaDetailViewController.h"
#import "himatableViewController.h"


@implementation mapviewController
@synthesize mapView;

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
    lm = [[CLLocationManager alloc] init];
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    lm.distanceFilter = kCLDistanceFilterNone;
    [lm startUpdatingLocation];
    [lm startUpdatingHeading];
    //位置座標を中心に地図を表示
//    MKCoordinateRegion zoom = mapView.region;
//    zoom.span.latitudeDelta=0.005;
//    zoom.span.longitudeDelta=0.005;
//    [mapView setRegion:zoom animated:NO];
//    CLLocationCoordinate2D point;
//    point.latitude = [anArticle.lat doubleValue];
//    point.longitude = [anArticle.lon doubleValue];
//    [mapView setCenterCoordinate:point animated:NO];
//    
//    if(currentAnnotation){
//        [mapView removeAnnotation:currentAnnotation];
//        [currentAnnotation release];
//        currentAnnotation = nil;
//    }
//    
//    currentAnnotation = [[Annotation alloc]initWithCoordinate:point];
//    currentAnnotation.title = anArticle.title;
//    currentAnnotation.subtitle = 
    //変更すべき
    
    mapView.showsUserLocation = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
