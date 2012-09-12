//
//  CTQuartz2DController.h
//  Demo
//
//  Created by Chun-Tang Wang on 9/3/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CTQuartz2DImageView;

@interface CTQuartz2DController : NSWindowController {
    IBOutlet CTQuartz2DImageView *_quartz2DImageView;
}


@property (assign) CTQuartz2DImageView *quartz2DImageView;

@end
