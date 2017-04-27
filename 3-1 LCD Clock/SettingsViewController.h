//
//  SettingsViewController.h
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/24/17.
//
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)greenPressed:(id)sender;

- (IBAction)redPressed:(id)sender;

- (IBAction)bluePressed:(id)sender;

- (IBAction)yellowPressed:(id)sender;

@end
