//
//  SegmentView2.m
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/25/17.
//
//

#import "SegmentView2.h"

@implementation SegmentView2


- (void)drawRect:(CGRect)rect {
    
    //CGPoint yup = CGPointMake(self.bounds.origin.x + self.bounds.size.width, self.bounds.origin.y);
    
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    // Drawing code
    
    self.bezPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    
    [self.bezPath moveToPoint:CGPointMake(width/2, 0.0)];
    [self.bezPath addLineToPoint:CGPointMake(width, height/12)];
    [self.bezPath addLineToPoint:CGPointMake(width, height - (height/6))];
    
    [self.bezPath addLineToPoint:CGPointMake(width/2, height - (height/12))];
    [self.bezPath addLineToPoint:CGPointMake(0.0, height - (height/6))];
    [self.bezPath addLineToPoint:CGPointMake(0.0, height/12)];
    
    [self.bezPath closePath];
    
    
    //set render colors
    [[UIColor blackColor] setStroke];
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]  isEqual: @"green"]){
        [[UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0] setFill];
    }
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]  isEqual: @"red"]){
        [[UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0] setFill];
    }
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]  isEqual: @"blue"]){
        [[UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0] setFill];
    }
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]  isEqual: @"yellow"]){
        [[UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0] setFill];
    }
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"color"]  == nil){
        [[UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0] setFill];
    }

    
    //CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform.
    //CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    //CGContextTranslateCTM(aRef, 50, 50);
    
    
    // Adjust the drawing options as needed.
    self.bezPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [self.bezPath fill];
    //[self.bezPath stroke];
    
    // Restore the graphics state before drawing any other content.
    //CGContextRestoreGState(aRef);
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
