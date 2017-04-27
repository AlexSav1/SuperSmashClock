//
//  ViewController.h
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/18/17.
//
//

#import <UIKit/UIKit.h> 
#import "DigitView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DigitView *firstDigitView;
@property (weak, nonatomic) IBOutlet DigitView *secondDigitView;
@property (weak, nonatomic) IBOutlet DigitView *thirdDigitView;
@property (weak, nonatomic) IBOutlet DigitView *fourthDigitView;


-(void) changeColors: (NSString*) color;

@end

