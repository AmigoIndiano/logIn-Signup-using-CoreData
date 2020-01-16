//
//  LogInViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"
#import "MainScreenViewController.h"

@interface LogInViewController ()<UITextFieldDelegate>
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}
@end

@implementation LogInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.txtuName.delegate = self;
    self.txtPassword.delegate = self;
}


- (IBAction)btnLogin:(UIButton *)sender
{
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    NSArray *results = [context executeFetchRequest:requestExamLocation error:nil];
    NSArray *uname = [results valueForKey:@"email"];
    NSArray *upass = [results valueForKey:@"password"];

    NSString *uName = self.txtuName.text;
    NSString *uPass = self.txtPassword.text;
        if(uName.length && uPass.length >0)
        {
            if ([uname containsObject:uName])
            {
                NSLog(@"UserName Found.");
                if ([upass containsObject:uPass])
                {
                    NSLog(@"Password Found.");
                }
                else
                {
                    NSLog(@"Pass Not Found");
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter Valid Pass." preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                    {
                        NSLog(@"Wrong ID/Pass.");
                    }];
                    [alert addAction:actionOk];
                    [self presentViewController:alert animated:YES completion:nil];
                }
            }
            else if (![uname containsObject:uName]&&![upass containsObject:uPass])
            {
            
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter Valid ID/Pass." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                {
                    NSLog(@"Wrong ID/Pass.");
                }];
                [alert addAction:actionOk];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
        }
    else
    {
        UIAlertController *alertEmpty = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter ID/Pass." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
        {
            NSLog(@"Wrong ID/Pass.");
        }];
        [alertEmpty addAction:actionOk];
        [self presentViewController:alertEmpty animated:YES completion:nil];
        NSLog(@"Alert Empty.");
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toMainScreen"])
    {
        
        NSString *data = _txtuName.text;
        MainScreenViewController *vc = [segue destinationViewController];
        vc.data = data;
    }
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
  NSInteger nextTag = textField.tag + 1;
  UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];

  if (nextResponder) {
    [nextResponder becomeFirstResponder];
  } else {
      
    [textField resignFirstResponder];
  }
    return NO;
}
@end
