//
//  darehimatabAppDelegate.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NavController;
@class AboutViewController;

@interface darehimatabAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    IBOutlet UITabBarController *rootController;
    IBOutlet NavController *NavController;
    IBOutlet AboutViewController *AboutViewController;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) NavController *NavController;
@property (nonatomic, retain) IBOutlet AboutViewController *AboutViewController;

@end
