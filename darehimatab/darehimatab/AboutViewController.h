//
//  AboutViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AboutViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocationManager *lm;
    MKMapView *mapview;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapview;

@end

