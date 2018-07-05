//
//  User.h
//  twitter
//
//  Created by Tarini Singh on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screen_name;
@property (nonatomic, strong) NSURL *profile_URL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
