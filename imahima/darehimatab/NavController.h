//
//  NavController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMLReader;

@interface NavController : UINavigationController{
//    NSString *facebook_id;
//    NSString *facebook_name;
//    NSString *facebook_photo_url;
//    NSString *latitude;
//    NSString *longitude;
//    NSString *time;
//
        XMLReader *xmlcont;

}
@property(nonatomic, retain)XMLReader *xmlcont;

@end
