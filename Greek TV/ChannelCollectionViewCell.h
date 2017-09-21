//
//  ChannelCollectionViewCell.h
//  Greek TV
//
//  Created by Aggelos Papageorgiou on 30/03/16.
//  Copyright © 2016 Aggelos Papageorgiou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *channelImage;
@property (strong,nonatomic) NSString *streamAddress;
@end
