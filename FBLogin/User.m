//
//  User.m
//  FBLogin
//
//  Created by Medrano, Tony (NYC-MRM) on 2/6/15.
//  Copyright (c) 2015 Tony Medrano. All rights reserved.
//

#import "User.h"
@interface User(){
    
}
@end
static User* _currentUser;
@implementation User

+(User*) currentUser{
    @synchronized([User class])
    {
        if(!_currentUser) {
            _currentUser = [[self alloc] init];
        }
        return _currentUser;
    }
    return nil;
}

@end
