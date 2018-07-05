//
//  ComposeViewController.m
//  twitter
//
//  Created by Tarini Singh on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)tweet:(id)sender {
    NSString *tweetText = self.tweet_textView.text;
    
    [[APIManager shared] postStatusWithText:tweetText completion:^(Tweet *tweet, NSError * _Nonnull error) {
        if(error)
        {
            NSLog(@"error");
        }
        else
        {
            [self.delegate didTweet:tweet];
            NSLog(@"no error log");
            [self dismissViewControllerAnimated:true completion:nil];
        }
            
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
