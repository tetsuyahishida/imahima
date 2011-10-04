
//
//  himatableViewController.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLReader.h"
#import "LoginViewController.h"

@class HimaDetailViewController;
@class Hima;


@interface HimatableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource,LoginViewControllerDelegate>{
    XMLReader *xmlcont;
    IBOutlet UITableView*himatableView;
    NSMutableArray *himaArray;
    HimaDetailViewController *himaDetailViewController;
    Hima *current;
    NSUserDefaults *defaults;

}
@property(nonatomic,retain) HimaDetailViewController *himaDetailViewController;
@property(nonatomic,retain) NSMutableArray *himaArray;
@property(nonatomic,retain) XMLReader *xmlcont;
@property(nonatomic,retain) Hima *current;
@property(nonatomic,retain) NSUserDefaults *defaults;
@end
