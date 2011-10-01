//
//  Hima.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hima: NSObject{
    NSString *facebook_id;
    NSString *facebook_name;
    NSString *facebook_photo_url;
    NSString *latitude;
    NSString *longitude;
    NSString *time;
       
}
@property(nonatomic,retain) NSString *facebook_id;
@property(nonatomic,retain) NSString *facebook_name;
@property(nonatomic,retain) NSString *facebook_photo_url;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *time;

@end
