//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Tarini Singh on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"


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
    self.retweet_label.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.fav_label.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
    
    self.image_view.image = nil;
    if (tweet.user.profile_URL != nil){
        [self.image_view setImageWithURL:self.tweet.user.profile_URL];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
