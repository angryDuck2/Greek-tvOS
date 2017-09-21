//
//  FirstViewController.m
//  Greek TV
//
//  Created by Aggelos Papageorgiou on 30/03/16.
//  Copyright © 2016 Aggelos Papageorgiou. All rights reserved.
//

#import "FirstViewController.h"
#import <AVKit/AVKit.h>
#import "ChannelCollectionViewCell.h"
#import "PlayerViewController.h"
@interface FirstViewController ()


@end

@implementation FirstViewController

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Channels" ofType:@"plist"]];
    NSArray* channelsArray=[dictionary objectForKey:@"Channels"];
    dictionary=[channelsArray objectAtIndex:[indexPath item]];
    
    ChannelCollectionViewCell* cell=(ChannelCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Channel" forIndexPath:indexPath];
    cell.streamAddress=[dictionary objectForKey:@"streamAddress"];
    [cell.channelImage setImage:[UIImage imageNamed:[dictionary objectForKey:@"Name"]]];
    
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Channels" ofType:@"plist"]];
        NSArray* channelsArray=[dictionary objectForKey:@"Channels"];

    return [channelsArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didUpdateFocusInContext:(UICollectionViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator{
    ChannelCollectionViewCell *nextCell=(ChannelCollectionViewCell*)[context nextFocusedView];
    ChannelCollectionViewCell *previousCell=(ChannelCollectionViewCell*)[context previouslyFocusedView];
    if([previousCell isKindOfClass:[ChannelCollectionViewCell class]])previousCell.channelImage.adjustsImageWhenAncestorFocused=false;
    if([nextCell isKindOfClass:[ChannelCollectionViewCell class]])nextCell.channelImage.adjustsImageWhenAncestorFocused=true;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ChannelCollectionViewCell* cell=(ChannelCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    PlayerViewController *avplayer=[[PlayerViewController alloc] init];
    [avplayer playVideo:cell.streamAddress];
    [self.parentViewController presentViewController:avplayer animated:YES completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
