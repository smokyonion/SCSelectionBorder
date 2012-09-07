//
//  SCSelectionBorder+CTQuartz2D.h
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "SCSelectionBorder.h"

CGColorRef CGColorCreateFromNSColor(NSColor *color, CGColorSpaceRef colorSpace);

@interface SCSelectionBorder (CTQuartz2D)

- (void)drawCGContext:(CGContextRef)context;
- (void)drawHandleInCGContext:(CGContextRef)context rect:(NSRect)rect;
- (void)drawHandleInCGContext:(CGContextRef)context atPoint:(CGPoint)point;

@end
