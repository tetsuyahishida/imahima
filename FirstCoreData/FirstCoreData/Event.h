//
//  Event.h
//  FirstCoreData
//
//  Created by 田中丸 雄一郎 on 11/10/06.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * timeStamp;

@end
