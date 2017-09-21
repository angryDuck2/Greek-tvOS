//
//  PlayerViewController.m
//  Greek TV
//
//  Created by Aggelos Papageorgiou on 30/03/16.
//  Copyright © 2016 Aggelos Papageorgiou. All rights reserved.
//

#import "PlayerViewController.h"
@import AVKit;
@import UIKit;
#import "HCYoutubeParser-master/YoutubeParser/Classes/HCYoutubeParser.h"
@interface PlayerViewController ()


@end

@implementation PlayerViewController
int *AVPlayerItemStatusContext=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)playVideo:(NSString*)video{
    if([video containsString:@"youtube"]){
        NSDictionary *videos = [HCYoutubeParser h264videosWithYoutubeURL:[NSURL URLWithString:video]];
        video=[videos objectForKey:@"live"];
    }
    self.player=[[AVPlayer alloc] initWithURL:[NSURL URLWithString:video]];
    [self.player addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:&AVPlayerItemStatusContext];

    [self.player play];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    
    if (context == &AVPlayerItemStatusContext) {
        AVPlayer *thePlayer = (AVPlayer *)object;
        if ([thePlayer status] == AVPlayerStatusFailed) {
            NSError *error = [thePlayer error];
            // Respond to error: for example, display an alert sheet.
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Error" message:[error description] preferredStyle:UIAlertControllerStyleAlert] ;
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                                                                                                    handler:^(UIAlertAction * action) {}]];
            [self presentViewController:alert animated:YES completion:nil];
            
            return;
        }
        // Deal with other status change if appropriate.
    }
    // Deal with other change notifications if appropriate.
    //[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    return;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.player removeObserver:self forKeyPath:@"status"];
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
