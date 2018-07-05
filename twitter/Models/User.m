//
//  User.m
//  twitter
//
//  Created by Tarini Singh on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        self.name = dictionary[@"name"];
        self.screen_name = dictionary[@"screen_name"];
        self.profile_URL = [NSURL URLWithString: dictionary[@"profile_image_url_https"]];
    }
    return self;
}



@end
