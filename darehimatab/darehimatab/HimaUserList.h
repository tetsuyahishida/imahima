//
//  HimaUserList.h
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLReader.h"


@interface HimaUserList : UITableViewController<UITableViewDelegate,UITableViewDataSource> {

    UITableView *userListTable;
    Hima *current;
    XMLReader *xmlcont;
}
@property (retain) IBOutlet UITableView *userListTable;
@property (nonatomic, retain) Hima *current;

-(void)reloadHimaUserList;

@end
