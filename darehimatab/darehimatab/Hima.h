//
//  Hima.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hima: NSObject{
    NSString *content;
    NSString *createdAt;
}
@property(nonatomic,retain) NSString *content;
@property(nonatomic,retain) NSString *createdAt;


@end
