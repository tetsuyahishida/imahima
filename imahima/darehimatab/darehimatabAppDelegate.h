//
//  darehimatabAppDelegate.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NavController;
@class mapviewController;
@class XMLReader;
@class HimatableViewController;

@protocol DarehimatabAppReloadDelegate;

@interface darehimatabAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    IBOutlet UITabBarController *rootController;
    IBOutlet NavController *NavController;
    IBOutlet mapviewController *mapviewController;
    NSUserDefaults *defaults;
    XMLReader*xmlcont;
    HimatableViewController*htvc;
	id <DarehimatabAppReloadDelegate> delegate;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) NavController *NavController;
@property (nonatomic, retain) IBOutlet mapviewController *mapviewController;
@property (nonatomic, retain) HimatableViewController*htvc;
@property (assign) id <DarehimatabAppReloadDelegate> delegate;
-(IBAction)reloadList:(id)sender;

@end

@protocol DarehimatabAppReloadDelegate
-(void)darehimatabAppReload:(darehimatabAppDelegate *)sender;
@end
