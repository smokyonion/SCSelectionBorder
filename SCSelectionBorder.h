//
//  SCSelectionBorder.h
//  SCToolkit
//
//  Created by Vincent Wang on 12/8/11.
//  Copyright (c) 2011 Vincent S. Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const CGFloat SCSelectionBorderHandleWidth;
extern const CGFloat SCSelectionBorderHandleHalfWidth;

typedef enum {
    kSCSelectionBorderHandleNone        = 0, 
    kSCSelectionBorderUpperLeftHandle   = 1,
    kSCSelectionBorderUpperMiddleHandle = 2,
    kSCSelectionBorderUpperRightHandle  = 3,
    kSCSelectionBorderMiddleLeftHandle  = 4,
    kSCSelectionBorderMiddleRightHandle = 5,
    kSCSelectionBorderLowerLeftHandle   = 6,
    kSCSelectionBorderLowerMiddleHandle = 7,
    kSCSelectionBorderLowerRightHandle  = 8,
} SCSelectionBorderHandle;

enum
{
    kSCSelectionXResizeable     = 1U << 0,
    kSCSelectionYResizeable     = 1U << 1,
    kSCSelectionWidthResizeable = 1U << 2,
    kSCSelectionHeightResizeable= 1U << 3,
};

@interface SCSelectionBorder : NSObject
{
@private
    
    //unsigned int _resizingMask;
    NSColor *_borderColor;
    NSColor *_fillColor;
    BOOL _drawingFill;
    CGFloat _borderWidth;
    NSSize _aspectRatio;
    BOOL _lockAspectRatio;
    NSSize _minSize;
    NSRect _selectedRect;
    
    BOOL _drawingHandles;
    BOOL _drawingGrids;
    BOOL _drawingOffView;
    unsigned int _gridLineNumber;
    
}

@property(retain) NSColor *borderColor;
@property(retain) NSColor *fillColor;
@property(assign, getter = isDrawingFill) BOOL drawingFill;
@property(assign) NSSize aspectRatio;
@property(readonly, getter = canLockAspectRatio) BOOL lockAspectRatio;
@property(assign) NSSize minSize;
@property(nonatomic) NSRect selectedRect;
@property(nonatomic) CGFloat borderWidth;
@property(assign) unsigned int gridLineNumber;
@property(assign, getter = isDrawingGrids) BOOL drawingGrids;
@property(assign, getter = canDrawOffView) BOOL drawingOffView;


- (void)setColors:(NSColor *)aColor;

// Drawing
- (void)drawContentInView:(NSView *)aView;


// Handle checking
- (NSInteger)handleAtPoint:(NSPoint)point frameRect:(NSRect)bounds;
- (NSPoint)locationOfHandle:(SCSelectionBorderHandle)handle frameRect:(NSRect)bounds;

/**  track mouse event and decide whether to moving or resizing selection border itself
 @param theEvent a NSEvent
 @returns 
 @exception 
 */
- (void)selectAndTrackMouseWithEvent:(NSEvent *)theEvent atPoint:(NSPoint)mouseLocation inView:(NSView *)view;
- (void)setLockAspectRatio:(BOOL)yesOrNo;

@end
