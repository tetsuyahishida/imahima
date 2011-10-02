//
//  LoginViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/02.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController{

	id <LoginViewControllerDelegate> delegate;
}
@property (assign) id <LoginViewControllerDelegate> delegate;

@end
