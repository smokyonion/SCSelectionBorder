//
//  MyImageView.m
//  Demo
//
//  Created by Vincent Wang on 12/13/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import "MyImageView.h"
#import "SCSelectionBorder.h"

@implementation MyImageView

@synthesize cropMarker = _cropMarker;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _cropMarker = [[SCSelectionBorder alloc] init];
        self.cropMarker.selectedRect = NSMakeRect(100, 100, 200, 200);
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        _cropMarker = [[SCSelectionBorder alloc] init];
        self.cropMarker.selectedRect = NSMakeRect(100, 100, 200, 200);
    }
    return self;
}

- (void)awakeFromNib
{
    self.image = [NSImage imageNamed:@"trails.jpg"];
}

- (void)dealloc
{
    [_cropMarker release], _cropMarker = nil;
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    [self.cropMarker drawContentInView:self];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    NSPoint lastLocation = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    [self.cropMarker selectAndTrackMouseWithEvent:theEvent atPoint:lastLocation inView:self];
}

- (IBAction)takeColorFrom:(id)sender
{
    [self.cropMarker setColors:[sender color]];
    [self setNeedsDisplay:YES];
}

- (IBAction)setAspectRatio:(id)sender
{
    if ([sender state] == NSOnState) {
        NSSize s = NSMakeSize(100, 100);
        self.cropMarker.aspectRatio = s;
        self.cropMarker.isLockingAspectRatio = YES;
    }
    else {
        self.cropMarker.isLockingAspectRatio = NO;
    }
    
    [self setNeedsDisplay:YES];
}

@end
