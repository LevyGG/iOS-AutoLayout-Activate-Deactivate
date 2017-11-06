//
//  ViewController.m
//  Activate-Deactivate
//
//  Created by LevyGG on 2017/11/6.
//  Copyright © 2017年 Levy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *TopStateContraints; // 处于顶部时的约束集合
    NSArray *CenStateContraints; // 处于底时的部约束集合
}
/**
 顶部约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Top_Constraint;

/**
 垂直中约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Center_Constraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Left_Constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Right_Constraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Height_Constaint;


@property (weak, nonatomic) IBOutlet UILabel *Main_Label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TopStateContraints = @[self.Top_Constraint,
                           self.Left_Constraint,
                           self.Right_Constraint,
                           self.Height_Constaint];
    
    CenStateContraints = @[self.Center_Constraint,
                           self.Left_Constraint,
                           self.Right_Constraint,
                           self.Height_Constaint];
    
    
}


/**
 满足顶部约束
 */
- (IBAction)Top_Action {
    [UIView animateWithDuration: 0.3
                     animations:^{
                         [NSLayoutConstraint deactivateConstraints: CenStateContraints];
                         [NSLayoutConstraint activateConstraints: TopStateContraints];
                         self.Main_Label.text = @"激活TopStateContraints约束集合，同时让CenStateContraints约束集合失效";
                         [self.view layoutIfNeeded];
                     }completion:^(BOOL finished) {
                     }];
}



/**
 满足中间约束
 */
- (IBAction)Center_Action {
    [UIView animateWithDuration: 0.3
                     animations:^{
                         [NSLayoutConstraint deactivateConstraints: TopStateContraints];
                         [NSLayoutConstraint activateConstraints: CenStateContraints];
                         self.Main_Label.text = @"激活CenStateContraints约束集合，同时让TopStateContraints约束集合失效";
                         [self.view layoutIfNeeded];
                     }completion:^(BOOL finished) {
                     }];
    
}



@end
