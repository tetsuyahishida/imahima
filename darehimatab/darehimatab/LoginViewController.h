//
//  LoginViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController<UIApplicationDelegate,UIWebViewDelegate>{
    NSString *currenturl;
    NSString *access_token;
    IBOutlet UIWebView *login_View;
	id <LoginViewControllerDelegate> delegate;
}
@property (assign) id <LoginViewControllerDelegate> delegate;
@property (nonatomic,retain) NSString *currenturl;
@property (nonatomic,retain) NSString *access_token;

@end
@protocol LoginViewControllerDelegate
- (void)loginViewController:(LoginViewController *)sender request:(UIWebView *)aWebView andget:(NSString *)thecode;
@end
