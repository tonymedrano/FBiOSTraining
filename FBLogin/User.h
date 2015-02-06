//
//  User.h
//  FBLogin
//
//  Created by Medrano, Tony (NYC-MRM) on 2/6/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
+(User*) currentUser;
@property (nonatomic,strong) id<FBGraphUser> currentFBUser;
@end

