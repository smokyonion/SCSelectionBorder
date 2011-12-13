//
//  MyImageView.h
//  Demo
//
//  Created by Vincent Wang on 12/13/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import <AppKit/AppKit.h>

@class SCSelectionBorder;

@interface MyImageView : NSImageView
{
    SCSelectionBorder *_cropMarker;
}

@property (readonly) SCSelectionBorder *cropMarker;

- (IBAction)takeColorFrom:(id)sender;
- (IBAction)setAspectRatio:(id)sender;

@end
