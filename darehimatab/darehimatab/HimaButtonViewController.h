//
//  HimaButtonViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/04.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface HimaButtonViewController : UIViewController <UIWebViewDelegate,CLLocationManagerDelegate>{
    UIWebView *HimaWebView;
    CLLocationManager *lm;
    NSString *mylongitude;
    NSString *mylatitude;
    
    IBOutlet UIButton *cancelButton;
    IBOutlet UIButton *himaButton;
}

@property (nonatomic, retain) IBOutlet UIWebView *HimaWebView;
@property (nonatomic, retain) NSString *mylongitude;
@property (nonatomic, retain) NSString *mylatitude;


- (IBAction)HimaDeclare:(id)sender;
- (IBAction)HimaCancel:(id)sender;

@end
