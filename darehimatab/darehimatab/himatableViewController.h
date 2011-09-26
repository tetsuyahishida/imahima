
//
//  himatableViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HimaDetailViewController;

@interface HimatableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView*himatableView;
    NSMutableArray *himaArray;
    HimaDetailViewController *himaDetailViewController;
}
@property(nonatomic,retain) HimaDetailViewController *himaDetailViewController;
@property(nonatomic,retain) NSMutableArray *himaArray;
@end
