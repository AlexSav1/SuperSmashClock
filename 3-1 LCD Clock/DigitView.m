//
//  DigitView.m
//  3-1 LCD Clock
//
//  Created by Aditya Narayan on 1/18/17.
//
//

#import "DigitView.h"

@interface DigitView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *topLeftView;
@property (weak, nonatomic) IBOutlet UIView *topRightView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftView;
@property (weak, nonatomic) IBOutlet UIView *bottomRightView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end


@implementation DigitView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void) customInit{
    
    [[NSBundle mainBundle] loadNibNamed:@"DigitViewXIB" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.clipsToBounds = YES;
}

//-(void) changeColor: (NSString*) color{
//    
//    if([color  isEqual: @"green"]){
//        self.topView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.topLeftView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.topRightView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.middleView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.bottomLeftView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.bottomRightView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//        self.bottomView.backgroundColor = [UIColor colorWithRed:0.6 green:1 blue:0.6 alpha:1.0];
//    }
//    
//    if([color  isEqual: @"red"]){
//        self.topView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.topLeftView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.topRightView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.middleView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.bottomLeftView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.bottomRightView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//        self.bottomView.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:0.4 alpha:1.0];
//    }
//
//    if([color  isEqual: @"blue"]){
//        self.topView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.topLeftView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.topRightView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.middleView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.bottomLeftView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.bottomRightView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//        self.bottomView.backgroundColor = [UIColor colorWithRed:0.4 green:0.69 blue:1 alpha:1.0];
//    }
//
//    if([color  isEqual: @"yellow"]){
//        self.topView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.topLeftView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.topRightView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.middleView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.bottomLeftView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.bottomRightView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//        self.bottomView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0.4 alpha:1.0];
//    }
//
//    
//}

-(void) changeDigit: (NSInteger) num {
    
    if (num == 0){
        
        self.topView.hidden = NO;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = NO;
        self.middleView.hidden = YES;
        self.bottomLeftView.hidden = NO;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = NO;        
    }
    
    if (num == 1){
        self.topView.hidden = YES;
        self.topLeftView.hidden = YES;
        self.topRightView.hidden = NO;
        self.middleView.hidden = YES;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = YES;
    }

    if (num == 2){
        self.topView.hidden = NO;
        self.topLeftView.hidden = YES;
        self.topRightView.hidden = NO;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = NO;
        self.bottomRightView.hidden = YES;
        self.bottomView.hidden = NO;
    }

    if (num == 3){
        self.topView.hidden = NO;
        self.topLeftView.hidden = YES;
        self.topRightView.hidden = NO;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = NO;
    }

    if (num == 4){
        self.topView.hidden = YES;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = NO;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = YES;
    }
    
    if (num == 5){
        self.topView.hidden = NO;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = YES;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = NO;
    }

    if (num == 6){
        self.topView.hidden = NO;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = YES;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = NO;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = NO;
    }

    if (num == 7){
        self.topView.hidden = NO;
        self.topLeftView.hidden = YES;
        self.topRightView.hidden = NO;
        self.middleView.hidden = YES;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = YES;
    }

    if (num == 8){
        self.topView.hidden = NO;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = NO;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = NO;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = NO;
    }

    if (num == 9){
        self.topView.hidden = NO;
        self.topLeftView.hidden = NO;
        self.topRightView.hidden = NO;
        self.middleView.hidden = NO;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = NO;
        self.bottomView.hidden = YES;
    }

    if (num < 0){
        self.topView.hidden = YES;
        self.topLeftView.hidden = YES;
        self.topRightView.hidden = YES;
        self.middleView.hidden = YES;
        self.bottomLeftView.hidden = YES;
        self.bottomRightView.hidden = YES;
        self.bottomView.hidden = YES;
    }


}

@end
