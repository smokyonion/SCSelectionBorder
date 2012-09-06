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
    CGRect rect = NSRectToCGRect(self.selectedRect);

    // NSColor convert to CGColorRef ...
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef fillColor = CGColorCreateFromNSColor(self.fillColor, colorSpace);
    CGColorSpaceRelease(colorSpace);
    
    
    // Set the fill color.
    CGContextSetFillColorWithColor(context, fillColor);

    CGColorRelease(fillColor);
    
    // Set context to transparent.
    //CGContextSetAlpha(context, 0.2);
    
    // Fill the rect.
	CGContextFillRect(context, rect);
    
    
	// Save the current graphics state.
	//CGContextSaveGState(context);
    
    // Restore the graphics state most recently saved .
	//CGContextRestoreGState(context);
    
}

@end
