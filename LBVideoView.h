//
//  LBVideoView.h
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "LBContentView.h"


@interface LBVideoView  : LBContentView {
	MPMoviePlayerController *player;
}
@property(nonatomic,retain)MPMoviePlayerController* player;
@end
