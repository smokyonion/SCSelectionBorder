//
//  SCSelectionBorder+CTQuartz2D.m
//  Demo
//
//  Created by Chun-Tang Wang on 9/4/12.
//  Copyright (c) 2012 Vincent S. Wang. All rights reserved.
//

#import "SCSelectionBorder+CTQuartz2D.h"

CGColorRef CGColorCreateFromNSColor(NSColor *color, CGColorSpaceRef colorSpace)
{
    NSColor *deviceColor = [color colorUsingColorSpaceName:NSDeviceRGBColorSpace];
    CGFloat components[4];
    [deviceColor getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
    
    return CGColorCreate (colorSpace, components);
}

@implementation SCSelectionBorder (CTQuartz2D)

- (void)setCGColors:(NSColor *)color
{
    if (_fillCGColor) {
        CGColorRelease(_fillCGColor), _fillCGColor = NULL;
    }
    
    // NSColor convert to CGColorRef ...
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    _fillCGColor = CGColorCreateFromNSColor(color, colorSpace);
    CGColorSpaceRelease(colorSpace);
}

- (void)drawCGContext:(CGContextRef)context
{
    // Set the fill color.
    CGContextSetFillColorWithColor(context, _fillCGColor);
    
    // Set context to transparent.
    CGContextSetAlpha(context, 0.2);
    
    // Fill the rect.
	CGContextFillRect(context, _selectedRect);
    
    
	// Save the current graphics state.
	//CGContextSaveGState(context);
    
    // Restore the graphics state most recently saved .
	//CGContextRestoreGState(context);
}

@end
