//
//  SettingsViewController.m
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/24/17.
//
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property NSArray *pickerData;

@property (weak, nonatomic) IBOutlet UISwitch *hourSwitch;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pickerData = @[@"Eastern Daylight Time", @"Pacific Daylight Time", @"Central Daylight Time"];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"timeZone"]  isEqual: @"EDT"]){
        
        [self.pickerView selectRow:0 inComponent:0 animated:NO];
        
    }
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"timeZone"]  isEqual: @"PDT"]){
        
        [self.pickerView selectRow:1 inComponent:0 animated:NO];
        
    }
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"timeZone"]  isEqual: @"CDT"]){
        
        [self.pickerView selectRow:2 inComponent:0 animated:NO];
        
    }

    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"24hour"]  isEqual: @"ON"]){
        self.hourSwitch.on = YES;
    }
    else{
        self.hourSwitch.on = NO;
    }
}

- (IBAction)hourSwitchHit:(id)sender {
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"24hour"]  isEqual: @"ON"]){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"OFF" forKey:@"24hour"];

    }
    else{
        
        [[NSUserDefaults standardUserDefaults]setObject:@"ON" forKey:@"24hour"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    
    return self.pickerData[row];
}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    if([self.pickerData[row]  isEqual: @"Eastern Daylight Time"]){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"EDT" forKey:@"timeZone"];
    }
    
    if([self.pickerData[row]  isEqual: @"Pacific Daylight Time"]){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"PDT" forKey:@"timeZone"];
    }
    
    if([self.pickerData[row]  isEqual: @"Central Daylight Time"]){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"CDT" forKey:@"timeZone"];
    }

}


- (IBAction)greenPressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"green" forKey:@"color"];
    
}

- (IBAction)redPressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"red" forKey:@"color"];
    
}

- (IBAction)bluePressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"blue" forKey:@"color"];
    
}

- (IBAction)yellowPressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"yellow" forKey:@"color"];
    
}
@end
