//
//  Annotation.h
//  Nearby
//
//  Created by Yos Hashimoto.
//  Copyright 2009 Newton Japan Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	<MapKit/MapKit.h>


@interface Annotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D	coordinate;
	NSString				*title;
	NSString				*subtitle;
	BOOL					isMyAnnotation;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;


@end
