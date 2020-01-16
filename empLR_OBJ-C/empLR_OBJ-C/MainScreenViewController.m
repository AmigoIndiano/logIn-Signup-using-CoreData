//
//  MainScreenViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "MainScreenViewController.h"
#import "FetchPersonalDetailsViewController.h"
#import "AddFamilyDetailsViewController.h"
@interface MainScreenViewController ()
@end

@implementation MainScreenViewController
@synthesize data;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"MainScreen Contains:%@",data);
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        [[self navigationController] setNavigationBarHidden:YES animated:YES];
    }
}
- (IBAction)showInfo:(UIButton *)sender {
}

- (IBAction)addFamilyData:(UIButton *)sender {
}
- (IBAction)logOutBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toShowInfo"])
    {
        FetchPersonalDetailsViewController *vc = [segue destinationViewController];
        vc.data = data;
    }
else if ([segue.identifier isEqualToString:@"toAddFamilyDetails"])
    {
        NSLog(@"Working!");
        AddFamilyDetailsViewController *vcX = [segue destinationViewController];
        vcX.dataX = data;
    }
}
@end
