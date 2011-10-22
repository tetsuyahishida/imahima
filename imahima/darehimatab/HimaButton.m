//
//  HimaButton.m
//  darehimatab
//
//  Created by 田中丸 雄一郎 on 11/10/04.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HimaButton.h"

@implementation HimaButton

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)HimaPush:(id)sender {
    NSString *myurl
    =[NSString stringWithFormat:@"http://49.212.4.124:3000/top/imahima_list?access_token=%@",[defaults stringForKey:@"accesstoken"]];
    self.title=NSLocalizedString(@"hima",@"himajins");
    xmlcont = [[XMLReader alloc] loadXMLByURL:myurl];
}
@end
