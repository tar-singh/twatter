//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Tarini Singh on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image_view;
@property (weak, nonatomic) IBOutlet UILabel *firstLast_label;
@property (weak, nonatomic) IBOutlet UILabel *handle_label;
@property (weak, nonatomic) IBOutlet UILabel *date_label;
@property (weak, nonatomic) IBOutlet UILabel *tweet_label;
@property (weak, nonatomic) IBOutlet UIImageView *retweet_img;
@property (weak, nonatomic) IBOutlet UILabel *retweet_label;
@property (weak, nonatomic) IBOutlet UIImageView *fav_img;
@property (weak, nonatomic) IBOutlet UILabel *fav_label;
@property (weak, nonatomic) IBOutlet UIImageView *msg_img;

@property (strong, nonatomic) Tweet *tweet;

@end
