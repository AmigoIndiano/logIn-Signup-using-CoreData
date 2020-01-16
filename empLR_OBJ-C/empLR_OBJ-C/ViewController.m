//
//  ViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signUpBtn:(id)sender
{
}
- (IBAction)logInBtn:(id)sender
{
    [self performSegueWithIdentifier:@"toLogIn" sender:self];

}

@end
