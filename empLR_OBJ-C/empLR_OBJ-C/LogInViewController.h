//
//  LogInViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface LogInViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextField *txtuName;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(UIButton *)sender;
//@property (strong)NSMutableArray *employeeArray;
@property (strong,nonatomic)AppDelegate *delegate;
@end

NS_ASSUME_NONNULL_END
