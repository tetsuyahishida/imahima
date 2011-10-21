//
//  HimaUserList.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HimaUserList.h"
#import "himatableViewController.h"
#import "darehimatabAppDelegate.h"
#import "Hima.h"


@implementation HimaUserList
@synthesize userListTable,current;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIApplication*application =[UIApplication sharedApplication];application.networkActivityIndicatorVisible = YES;
    [self performSelector: @selector(reloadHimaUserList) 
               withObject: nil 
               afterDelay: 1];
    self.title=NSLocalizedString(@"イマヒマUSER!",@"HimaList");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{

    [super viewDidAppear:animated];

}

-(void)reloadHimaUserList
{

    NSUserDefaults*defaults=[NSUserDefaults standardUserDefaults];
    
    //Facebookのaccesstokenを保管する
    NSString *myurl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/user_list.xml?access_token=%@",[defaults stringForKey:@"accesstoken"]];
    //    self.title=NSLocalizedString(@"hima",@"himajins");
    
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title=NSLocalizedString(@"ダレヒマUSER",@"UserList");
    [self.tableView reloadData];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSMutableArray *ar =[xmlcont himas];
    return [ar count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSMutableArray *cont =[xmlcont himas];
    current = [cont objectAtIndex:indexPath.row];
    

    cell.textLabel.text = [current facebook_name];
    
    return cell;
}
- (void)dealloc {

    [userListTable release];
    [self.tableView autorelease];
    [super dealloc];
}
@end
