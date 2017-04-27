//
//  ViewController.m
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/18/17.
//
//

#import "ViewController.h"
#import "DigitView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *second1;
@property (weak, nonatomic) IBOutlet UILabel *second2;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@property (weak, nonatomic) IBOutlet UILabel *amLabel;

@property (weak, nonatomic) IBOutlet UILabel *colonLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property NSArray *imageNames;

@property NSInteger currentImageNumber;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //background image directory
    self.imageNames = @[@"captain_falcon", @"fox_mccloud", @"black", @"sheik", @"falco"];
    
    //if no user defaults set, set everything to default
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"color"] == nil){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"blue" forKey:@"color"];
    }
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"timeZone"] == nil){
        
        [[NSUserDefaults standardUserDefaults]setObject:@"EDT" forKey:@"timeZone"];
    }
    
    
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"background"] == nil){
        self.currentImageNumber = (self.imageNames.count - 1);

        self.backgroundImage.image = [UIImage imageNamed: self.imageNames[self.currentImageNumber]];
    }
    else{
        
    self.backgroundImage.image = [UIImage imageNamed: [[NSUserDefaults standardUserDefaults]objectForKey:@"background"]];
    
    self.currentImageNumber = [self.imageNames indexOfObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"background"]];
    }
    
    //instantiate UITapGestureRecognizer and set number of taps and such
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapped)];
    tapped.numberOfTapsRequired = 1;
    tapped.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:tapped];
    
    //set gestureRecognizers
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedLeft)];
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(userSwipedRight)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    
    //set NSTimer
    [self setClock];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setClock) userInfo:nil repeats:YES];
    
    
    //set date to label
    NSDate *date = [[NSDate alloc] init];

    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    
}

-(void) userSwipedLeft{
    
    if(self.currentImageNumber == 0){
        
        self.currentImageNumber = (self.imageNames.count - 1);
    }
    else{
        
        self.currentImageNumber = self.currentImageNumber - 1;
    }
    
    self.backgroundImage.image = [UIImage imageNamed: self.imageNames[self.currentImageNumber]];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@", self.imageNames[self.currentImageNumber]] forKey:@"background"];
    
}

-(void) userSwipedRight{
    
    if(self.currentImageNumber == (self.imageNames.count - 1)){
        
        self.currentImageNumber = 0;
    }
    else{
        
        self.currentImageNumber = self.currentImageNumber + 1;
    }

    self.backgroundImage.image = [UIImage imageNamed: self.imageNames[self.currentImageNumber]];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@", self.imageNames[self.currentImageNumber]] forKey:@"background"];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self changeColors:[[NSUserDefaults standardUserDefaults] objectForKey:@"color"]];
}

-(void) changeColors: (NSString*) color{
    
    if([color  isEqual: @"green"]){
        self.dateLabel.textColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
        self.second1.textColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
        self.second2.textColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
        self.amLabel.textColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
        self.colonLabel.textColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
    }
    
    if([color  isEqual: @"red"]){
        self.dateLabel.textColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
        self.second1.textColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
        self.second2.textColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
        self.amLabel.textColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
        self.colonLabel.textColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
    }

    if([color  isEqual: @"blue"]){
        self.dateLabel.textColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
        self.second1.textColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
        self.second2.textColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
        self.amLabel.textColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
        self.colonLabel.textColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
    }

    if([color  isEqual: @"yellow"]){
        self.dateLabel.textColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
        self.second1.textColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
        self.second2.textColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
        self.amLabel.textColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
        self.colonLabel.textColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
    }

    //[self.firstDigitView changeColor:[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]];
    
    //[self.secondDigitView changeColor:[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]];
    
    //[self.thirdDigitView changeColor:[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]];
    
    //[self.fourthDigitView changeColor:[[NSUserDefaults standardUserDefaults]objectForKey:@"color"]];
}

-(void) userTapped{
    
    if(self.settingsButton.hidden == YES){
        self.settingsButton.hidden = NO;
    }
    else{
        self.settingsButton.hidden = YES;
    }
    
}


- (void)setClock {
    //NSLog(@"timer fired");
    
    
    
    NSDate *date = [[NSDate alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSString *timeZone = [[NSUserDefaults standardUserDefaults]objectForKey:@"timeZone"];
    
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:timeZone]];
    
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
    
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger seconds = [components second];
    
    
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"24hour"]  isEqual: @"ON"]){
        
        
        self.amLabel.hidden = YES;
        
    }
    else{
        
        self.amLabel.hidden = NO;
        
        if(hour > 12){
            hour = hour - 12;
        }
        
        if(hour >= 12){
            self.amLabel.text = @"PM";
        }

        
        if(hour < 12){
            self.amLabel.text = @"AM";
        }

        
    }
    
    NSInteger hour1 = hour / 10;
    NSInteger hour2 = hour % 10;
    
    NSInteger min1 = minute / 10;
    NSInteger min2 = minute % 10;
    
    NSInteger sec1 = seconds / 10;
    NSInteger sec2 = seconds % 10;
    
//    if(hour1 == 0){
//        hour1 = -1;
//    }
    
    [self.firstDigitView changeDigit:hour1];
    [self.secondDigitView changeDigit:hour2];
    
    [self.thirdDigitView changeDigit:min1];
    [self.fourthDigitView changeDigit:min2];
    
    [self changeSeconds:sec1 :sec2];
    
    
    
}

-(void) changeSeconds: (NSInteger) num1 :(NSInteger) num2{
    
    self.second1.text = [NSString stringWithFormat:@"%ld", (long)num1];
    self.second2.text = [NSString stringWithFormat:@"%ld", (long)num2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
