//
//  CTQuartz2DImageView.h
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "../../SCSelectionBorder+CTQuartz2D.h"

@interface CTQuartz2DImageView : NSImageView {
    SCSelectionBorder *_selectionBorder;
}

@property (readonly, retain) SCSelectionBorder *selectionBorader;

- (IBAction)takeColorFrom:(id)sender;
- (IBAction)setAspectRatio:(id)sender;

@end
