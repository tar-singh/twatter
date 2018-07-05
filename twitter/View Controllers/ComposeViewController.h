//
//  ComposeViewController.h
//  twitter
//
//  Created by Tarini Singh on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@protocol ComposeViewControllerDelegate
-(void)didTweet:(Tweet *)tweet;
@end;

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweet_textView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel_ButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweet_ButtonItem;
@property (weak, nonatomic) id<ComposeViewControllerDelegate> delegate;
@end


