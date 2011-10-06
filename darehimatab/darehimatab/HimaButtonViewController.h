//
//  HimaButtonViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/04.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HimaButtonViewController : UIViewController <UIWebViewDelegate>{
    UIWebView *HimaWebView;
}

@property (nonatomic, retain) IBOutlet UIWebView *HimaWebView;
- (IBAction)HimaDeclare:(id)sender;

@end
