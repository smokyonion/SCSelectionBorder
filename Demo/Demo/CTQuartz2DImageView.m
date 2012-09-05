//
//  CTQuartz2DImageView.m
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "CTQuartz2DImageView.h"

@implementation CTQuartz2DImageView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        _selectionBorder = [[SCSelectionBorder alloc] init];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _selectionBorder = [[SCSelectionBorder alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_selectionBorder release], _selectionBorder = nil;
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [super drawRect:dirtyRect];
    
	// Obtain the Quartz context from the current NSGraphicsContext at the time the view's
	// drawRect method is called. This context is only appropriate for drawing in this invocation
	// of the drawRect method.
    //CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    
    //CGRect ourRect = CGRectMake(40, 40, 130, 100);
    
    
}

- (void)awakeFromNib
{
    self.image = [NSImage imageNamed:@"trails.jpg"];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    
}

- (IBAction)takeColorFrom:(id)sender
{
    // NSColor convert to CGColorRef ...
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreateFromNSColor([sender color], colorSpace);
    
    // Do something...
    
    
    [self setNeedsDisplay:YES];
    
    CGColorSpaceRelease(colorSpace);
    CGColorRelease(color);
}

- (IBAction)setAspectRatio:(id)sender
{
    
}

@end
