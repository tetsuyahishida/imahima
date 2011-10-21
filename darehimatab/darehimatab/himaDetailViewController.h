//
//  himaDetailViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@class Annotation;

@interface HimaDetailViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>{
    IBOutlet UILabel *nameLabel;
    NSString *the_facebook_name;
    IBOutlet UIImageView *facebook_image;
    NSString *the_facebook_image_url;
    IBOutlet MKMapView *himaMapView;
    CLLocationManager *lm;
    NSString *longitude;
    NSString *latitude;
	Annotation	*currentAnnotation;

}
@property(nonatomic, retain) NSString *longitude;
@property(nonatomic, retain) NSString *latitude;
@property(nonatomic, retain) NSString *the_facebook_name;
@property(nonatomic, retain) NSString *the_facebook_image_url;
@property (nonatomic, retain) Annotation*currentAnnotation;
@end
