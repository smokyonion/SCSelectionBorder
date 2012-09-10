//
//  SCSelectionBorder+CTQuartz2D.m
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "SCSelectionBorder+CTQuartz2D.h"
#import <objc/runtime.h>

CGColorRef CGColorCreateFromNSColor(NSColor *color, CGColorSpaceRef colorSpace)
{
    NSColor *deviceColor = [color colorUsingColorSpaceName:NSDeviceRGBColorSpace];
    CGFloat components[4];
    [deviceColor getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
    
    return CGColorCreate (colorSpace, components);
}

@implementation SCSelectionBorder (CTQuartz2D)

- (void)drawCGContext:(CGContextRef)context
{
    // Get selectedRect from NSRect.
    CGRect selectedRect = NSRectToCGRect(self.selectedRect);

    // NSColor convert to CGColorRef ...
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef fillColor = CGColorCreateFromNSColor(self.fillColor, colorSpace);
    CGColorSpaceRelease(colorSpace);

    
    // Set the fill color.
    CGContextSetFillColorWithColor(context, fillColor);

    CGColorRelease(fillColor);
    
    // Save the current graphics state.
	CGContextSaveGState(context);
    
    // Fill the rect.
	CGContextFillRect(context, selectedRect);
    
    // Draw bolder on selectedRect.
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, 1);
    CGContextAddRect(context, selectedRect);
    CGContextStrokePath(context);
    
    
    // Restore the graphics state most recently saved .
	CGContextRestoreGState(context);
    
}

- (void)drawHandleInCGContext:(CGContextRef)context rect:(NSRect)rect
{
    if (self.canLockAspectRatio) {
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMinX(rect), NSMinY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMaxX(rect), NSMinY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMinX(rect), NSMaxY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMaxX(rect), NSMaxY(rect))];
    } else {
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMinX(rect), NSMinY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMidX(rect), NSMinY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMaxX(rect), NSMidY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMinX(rect), NSMidY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMaxX(rect), NSMinY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMinX(rect), NSMaxY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMidX(rect), NSMaxY(rect))];
        [self drawHandleInCGContext:context atPoint:CGPointMake(NSMaxX(rect), NSMaxY(rect))];
    }
}

- (void)drawHandleInCGContext:(CGContextRef)context atPoint:(CGPoint)point
{
    // Rect of handle.
    CGRect handle = CGRectMake(point.x - SCSelectionBorderHandleHalfWidth, point.y - SCSelectionBorderHandleHalfWidth,
                               SCSelectionBorderHandleWidth, SCSelectionBorderHandleWidth);
    
    // Drawing handle and shadow.
    CGSize shadowOffset = CGSizeMake(-1.5, 1.5);
    // Create shadow color.
    CGColorRef shadowColor = CGColorCreateGenericRGB(0, 0, 0, 1);
    CGContextSetShadowWithColor(context, shadowOffset, 1.5, shadowColor);

    // Drawing handle.
    CGContextSetRGBFillColor(context, 0.6, 0.6, 1, 1);
    CGContextFillRect(context, handle);
    
    CGColorRelease(shadowColor);
}

@end
