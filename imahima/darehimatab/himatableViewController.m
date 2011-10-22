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
@synthesize himatableView;


-(void)darehimatabAppReload:(darehimatabAppDelegate *)sender
{
    himatableView.dataSource =self;
    himatableView.delegate =self;
    [self.tableView reloadData];
}

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
    NSString *userinfourl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/user_info.xml"];

    xmlcont = [[XMLReader alloc] loadXMLByURL:userinfourl];

//    NSMutableArray *cont =[xmlcont himas];
//    current = [cont objectAtIndex:0];
    
//    defaults =[NSUserDefaults standardUserDefaults];
//    [defaults setObject:thecode forKey:@"accesstoken"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    dispatch_queue_t downloadQueue = dispatch_queue_create("XMLDownloader", NULL);
    dispatch_async(downloadQueue, ^{
        dispatch_async(dispatch_get_main_queue(),^{
            UIApplication *application = [UIApplication sharedApplication];
            application.networkActivityIndicatorVisible = YES;
        });
    });
    [self performSelector: @selector(reloadHimaTableView) 
               withObject: nil 
               afterDelay: 0];
    return;
}

-(void)reloadHimaTableView
{
    NSString *myurl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima_list.xml?access_token=%@",[defaults stringForKey:@"accesstoken"]];
    self.title=NSLocalizedString(@"We Are ひま!",@"HimaList");
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
    [self.tableView reloadData];
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
    defaults=[NSUserDefaults standardUserDefaults];
    if(![defaults stringForKey:@"accesstoken"]){
       LoginViewController *asker = [[LoginViewController alloc] init];
       asker.delegate = self;
    UIApplication*application =[UIApplication sharedApplication];application.networkActivityIndicatorVisible = YES;
       [self presentModalViewController:asker animated:YES];
       [asker release];
    }
    else{
        UIApplication*application =[UIApplication sharedApplication];application.networkActivityIndicatorVisible = YES;
        self.title=NSLocalizedString(@"We Are ひま!",@"HimaList");
        [self performSelector: @selector(reloadHimaTableView) 
                   withObject: nil 
                   afterDelay: 2];
    }
    
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
//    [self.tableView reloadData];
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
//    [self.tableView reloadData];
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
    section = 1;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = [current time];
    cell.textLabel.text = [current facebook_name];
//    [super dataSourceDidFinishLoadingNewData];

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
    
        detailViewController.the_facebook_name =[current time];
        detailViewController.title = [current facebook_name];
        detailViewController.the_facebook_image_url = [current facebook_photo_url];
        detailViewController.latitude = [current latitude];
        detailViewController.longitude = [current longitude]; 
    
        // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
                                        
    // Navigation logic may go here. Create and push another view controller.

}
-(void)dealloc{
    [himaDetailViewController release];
    [self.tableView autorelease];
    [super dealloc];
    
}
@end
