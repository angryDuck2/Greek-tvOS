//
//  PlayerViewController.h
//  Greek TV
//
//  Created by Aggelos Papageorgiou on 30/03/16.
//  Copyright © 2016 Aggelos Papageorgiou. All rights reserved.
//

#import <AVKit/AVKit.h>

@interface PlayerViewController : AVPlayerViewController <AVPlayerViewControllerDelegate>
-(void)playVideo:(NSString*)video;
@end
