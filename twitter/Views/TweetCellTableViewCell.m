//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Tarini Singh on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "DateTools.h"


@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setTweet:(Tweet *)tweet{
    _tweet = tweet;
    
    self.firstLast_label.text = self.tweet.user.name;
    self.handle_label.text = [NSString stringWithFormat:@"@%@", self.tweet.user.screen_name];
    self.date_label.text = self.tweet.createdAtString;
    self.tweet_label.text = self.tweet.text;
    [self k];
    self.image_view.image = nil;
    if (tweet.user.profile_URL != nil){
        [self.image_view setImageWithURL:self.tweet.user.profile_URL];
    }
    
}

-(void) k{
    if (self.tweet.retweetCount > 1000){
        NSLog(@"greater than 1000");
        double rounded = ((float) self.tweet.retweetCount) / 1000;
        self.retweet_label.text = [NSString stringWithFormat:@"%.1fk", rounded];
    }
    else{
        self.retweet_label.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    }
    
    if (self.tweet.favoriteCount > 1000){
        NSLog(@"greater than 1000");
        double rounded = ((float) self.tweet.favoriteCount) / 1000;
        self.fav_label.text = [NSString stringWithFormat:@"%.1fk", rounded];
    }
    else{
        self.fav_label.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    }
}


- (IBAction)didTapFav:(id)sender {
    if (self.tweet.favorited != YES){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        
        self.heartButton.selected = YES;
        [self k];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error)
            {
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        
        self.heartButton.selected = NO;
        [self k];
        
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapRT:(id)sender {
    if (self.tweet.retweeted != YES)
    {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        
        self.retweetButton.selected = YES;
        [self k];
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error)
            {
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    else {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        
        self.retweetButton.selected = NO;
        [self k];
        
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error)
            {
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
