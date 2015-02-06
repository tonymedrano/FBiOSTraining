//
//  FBookViewController.m
//  FBLogin
//
//  Created by Medrano, Tony (NYC-MRM) on 2/6/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import "FBookViewController.h"

@interface FBookViewController ()

@end

@implementation FBookViewController

- (IBAction)loginClicked:(id)sender {
    [FBSession openActiveSessionWithReadPermissions:nil allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        
    }];
}
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    self.fbProfilePictureView.profileID = user.objectID;
}
-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fbLoginView.readPermissions = @[@"email"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
