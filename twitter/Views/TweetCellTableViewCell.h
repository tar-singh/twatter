//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Tarini Singh on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TweetCellTableViewCell.h"

@protocol TweetCellDelegate;

@interface TweetCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image_view;
@property (weak, nonatomic) IBOutlet UILabel *firstLast_label;
@property (weak, nonatomic) IBOutlet UILabel *handle_label;
@property (weak, nonatomic) IBOutlet UILabel *date_label;
@property (weak, nonatomic) IBOutlet UILabel *tweet_label;
@property (weak, nonatomic) IBOutlet UILabel *retweet_label;
@property (weak, nonatomic) IBOutlet UILabel *fav_label;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;
@property (strong, nonatomic) Tweet *tweet;

@property (nonatomic, weak) id<TweetCellDelegate> delegate;

@end

@protocol TweetCellDelegate

-(void)tweetCell:(TweetCellTableViewCell *) tweetCell didTap: (User *)user;
@end
