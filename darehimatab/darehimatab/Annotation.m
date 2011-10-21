//
//  Annotation.m
//  Nearby
//
//  Created by Yos Hashimoto.
//  Copyright 2009 Newton Japan Inc.. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation

@synthesize	coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	coordinate = coord;
	isMyAnnotation = YES;
	return self;
}


@end
