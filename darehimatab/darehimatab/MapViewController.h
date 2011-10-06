//
//  mapviewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface mapviewController :UIViewController<CLLocationManagerDelegate>{
    CLLocationManager *lm;
    MKMapView *mapView;

}

@property(nonatomic, retain) IBOutlet MKMapView *mapView;

@end

