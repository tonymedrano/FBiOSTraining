//
//  FBookViewController.h
//  FBLogin
//
//  Created by Medrano, Tony (NYC-MRM) on 2/6/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBookViewController : UIViewController<FBLoginViewDelegate>

@property (strong, nonatomic) IBOutlet FBLoginView *fbLoginView;

@property (strong, nonatomic) IBOutlet FBProfilePictureView *fbProfilePictureView;

@end
