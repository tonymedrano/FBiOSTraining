//
//  FBookTableViewController.m
//  FBLogin
//
//  Created by Medrano, Tony (NYC-MRM) on 2/6/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import "FBookTableViewController.h"
#import "FBookViewController.h"

@interface FBookTableViewController ()
{
    NSMutableArray* friends;
}

@end

@implementation FBookTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    FBRequest* req  =  [FBRequest requestForGraphPath:@"me/friends?fields=name,picture"];
    [req startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        NSDictionary* response = (NSDictionary*)result;
        friends = [NSMutableArray arrayWithArray: response[@"data"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            NSLog(@"Found: %i friends", friends.count);
        });
    }];
    
    //    NSURL* fbGraphURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/me/friends?fields=name,picture&access_token=%@",[FBSession activeSession].accessTokenData.accessToken]];
    //    NSURLRequest* request = [NSURLRequest requestWithURL:fbGraphURL];
    //    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *r, NSData *d, NSError *e) {
    //        NSDictionary* response = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingAllowFragments error:nil];
    //        friends = [NSMutableArray arrayWithArray: response[@"data"]];
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            [self.tableView reloadData];
    //        });
    //    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Friends";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSInteger idx = indexPath.row;
    NSDictionary* f = friends[idx];
    // Configure the cell...
    cell.textLabel.text = f[@"name"];
    UIImage* pic = f[@"pic"];
    if(pic==nil){
        cell.imageView.image = [UIImage imageNamed:@"defaultpic"];
        NSString* picURL = f[@"picture"][@"data"][@"url"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0
                                                 ), ^{
            NSMutableDictionary* newf = [NSMutableDictionary dictionaryWithDictionary:f];
            friends[idx] = newf;
            NSData* imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:picURL]];
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage* img =  [UIImage imageWithData:imgData];
                newf[@"pic"] = img;
                cell.imageView.image = img;
                
            });
        });
    }else{
        cell.imageView.image = pic;
    }
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
