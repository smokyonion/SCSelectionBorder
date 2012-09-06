//
//  CTQuartz2DImageView.m
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "CTQuartz2DImageView.h"

@implementation CTQuartz2DImageView

@synthesize selectionBorader = _selectionBorder;

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
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    [_selectionBorder drawCGContext:context];
}

- (void)awakeFromNib
{
    self.image = [NSImage imageNamed:@"trails.jpg"];
    _selectionBorder.selectedRect = NSMakeRect(100, 100, 200, 200);
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint lastLocation = [self convertPoint:[theEvent locationInWindow] fromView:nil];

    // Need to Refactoring this method for Quartz 2D.
    [_selectionBorder selectAndTrackMouseWithEvent:theEvent atPoint:lastLocation inView:self];
    
}

- (IBAction)takeColorFrom:(id)sender
{
    [_selectionBorder setColors:[sender color]];
    [self setNeedsDisplay:YES];
}

- (IBAction)setAspectRatio:(id)sender
{
    if ([sender state] == NSOnState) {
        CGSize size = CGSizeMake(100, 100);
        _selectionBorder.aspectRatio = size;
        _selectionBorder.lockAspectRatio = YES;
    }
    else {
        _selectionBorder.lockAspectRatio = NO;
    }
    
    [self setNeedsDisplay:YES];
}

@end
