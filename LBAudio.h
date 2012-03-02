//
//  LBAudio.h
//  iPadProject
//
//  Created by Logan Gilmour on 11-05-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "LBView.h"

@interface LBAudio : LBView {
	AVAudioPlayer *player;
}
@property(nonatomic,retain)AVAudioPlayer* player;
@end
