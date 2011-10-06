//
//  himatableViewController.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/09/26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "himatableViewController.h"
#import "himaDetailViewController.h"
#import "darehimatabAppDelegate.h"
#import "Hima.h"

@class NSUserDefaults;

@implementation HimatableViewController
@synthesize xmlcont;
@synthesize himaArray;
@synthesize himaDetailViewController;
@synthesize current;
@synthesize defaults;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loginViewController:(LoginViewController *)sender request:(UIWebView *)aWebView andget:(NSString *)thecode
{
	[self dismissModalViewControllerAnimated:YES];
    //キーを保存
    defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:thecode forKey:@"accesstoken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *myurl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima_list.xml?access_token=%@",[defaults stringForKey:@"accesstoken"]];
    self.title=NSLocalizedString(@"hima",@"himajins");
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
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
//Facebookのaccesstokenを保管する 
   if(![defaults stringForKey:@"accesstoken"]){
       LoginViewController *asker = [[LoginViewController alloc] init];
       asker.delegate = self;
       [self presentModalViewController:asker animated:YES];
       [asker release];
   }    
    
    
    NSString *myurl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima_list.xml?access_token=%@",[defaults stringForKey:@"accesstoken"]];
    self.title=NSLocalizedString(@"hima",@"himajins");
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
  
    
/*とりあえずはローカルを見るようにする
    NSString *myurl
    =[NSString stringWithFormat:@"https://hoge/imahima.xml?facebookid=%d"];
    self.title=NSLocalizedString(@"hima",@"himajins");
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
*/
    for (Hima *t in [xmlcont himas]){
        NSLog(@"ID: %@ name: %@",[t facebook_id],[t time]);
        himaArray = [xmlcont himas];
    }


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView reloadData];
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
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSMutableArray *cont =[xmlcont himas];
    current = [cont objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [current time];
    cell.textLabel.text = [current facebook_name];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger row = [indexPath row];


        HimaDetailViewController *detailViewController = [[HimaDetailViewController alloc] initWithNibName:@"himaDetailView" bundle:nil];

        darehimatabAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.NavController pushViewController:himaDetailViewController animated:YES];
        NSMutableArray *cont =[xmlcont himas];
        current = [cont objectAtIndex:indexPath.row];
    
        detailViewController.the_facebook_name =[current facebook_name];
        detailViewController.title = [current facebook_id];
        detailViewController.the_facebook_image_url = [current facebook_photo_url];
        // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
                                        
    // Navigation logic may go here. Create and push another view controller.

}
-(void)dealloc{
    [himaDetailViewController release];
    [super dealloc];
    
}
@end
