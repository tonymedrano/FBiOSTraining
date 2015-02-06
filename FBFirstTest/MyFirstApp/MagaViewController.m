//
//  MagaViewController.m
//  MyFirstApp
//
//  Created by Medrano, Tony (NYC-MRM) on 2/5/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import "MagaViewController.h"

@interface MagaViewController ()

@end

@implementation MagaViewController

- (IBAction)showIntegratedDialog:(id)sender {
    [FBDialogs presentOSIntegratedShareDialogModallyFrom:self initialText:@"" image:nil url:[NSURL URLWithString:@"http://www.tonymedrano.com"] handler:^(FBOSIntegratedShareDialogResult result, NSError *error) {
        
    }];
}

- (IBAction)showFacebookDialog:(id)sender {
    [FBDialogs presentShareDialogWithLink:[NSURL URLWithString:@"http://tonymedrano"] handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
