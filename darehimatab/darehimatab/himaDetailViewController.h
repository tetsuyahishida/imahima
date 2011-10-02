//
//  himaDetailViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HimaDetailViewController : UIViewController{
    IBOutlet UILabel *nameLabel;
    NSString *the_facebook_name;
    IBOutlet UIImageView *facebook_image;
    NSString *the_facebook_image_url;
    
}

@property(nonatomic, retain) NSString*the_facebook_name;
@property(nonatomic, retain) NSString *the_facebook_image_url;
@end
