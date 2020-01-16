//
//  SignUpViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "SignUpViewController.h"
#import  "QuartzCore/QuartzCore.h"
@interface SignUpViewController ()<UITextFieldDelegate>{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSArray *dictionaries;
}


@end

@implementation SignUpViewController


@synthesize employeeDB,departments;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    _pickerViewDepartment.layer.borderWidth=1.0;
    _departMentOutlet.layer.borderWidth=1.0;
    self.txtFname.layer.borderWidth=1.0;
    self.txtLname.layer.borderWidth=1.0;
    self.txtEmail.layer.borderWidth=1.0;
    self.txtPhone.layer.borderWidth=1.0;
    self.txtOrgname.layer.borderWidth=1.0;
    self.txtPassword.layer.borderWidth=1.0;
    departments=[[NSArray alloc]initWithObjects:@"Accounts",@"HR",@"Product Design",@"Product Devlopment",@"Admin",@"Security", nil];
    self.txtFname.delegate = self;
    self.txtLname.delegate = self;
    self.txtEmail.delegate = self;
    self.txtPhone.delegate = self;
    self.txtOrgname.delegate = self;
    self.txtPassword.delegate = self;
    [self.pickerViewDepartment setDelegate:self];
    [self.pickerViewDepartment setDataSource:self];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *nxtBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissAction)];
    [toolBar setItems:[NSArray arrayWithObject:nxtBtn]];
    [self.txtPhone setInputAccessoryView:toolBar];
    
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
- (BOOL)validatePassword:(NSString *)password
{
    NSString *passRegex = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}";
    NSPredicate *passTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passRegex];
    return [passTest evaluateWithObject:password];
}
- (BOOL)validatePhone:(NSString *)phone
{
    NSString *phoneRegex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

-(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    _delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([_delegate respondsToSelector:@selector(persistentContainer)]) {
        context = _delegate.persistentContainer.viewContext;
    }
    return context;
}



- (IBAction)btnSubmit:(UIButton *)sender
{
    NSString *fname,*lname,*phone,*depName,*orgName,*email,*pass;
    fname=_txtFname.text;
    lname=_txtLname.text;
    phone = _txtPhone.text;
    depName=_departMentOutlet.titleLabel.text;
    orgName=_txtOrgname.text;
    email=_txtEmail.text;
    pass=_txtPassword.text;
    if ([self validatePhone:phone])
    {
        if ([self validatePassword:pass])
        {
            if([self validateEmailWithString :email])
            {
                if (fname.length && lname.length && phone.length && depName.length && orgName.length && email.length && pass.length > 0 )
                {
                    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
                    context = appDelegate.persistentContainer.viewContext;
                    
                    // Save Data
                    NSManagedObject *newEmployee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
                               //create new Employee

                               [newEmployee setValue:self.txtFname.text forKey:@"fname"];
                               [newEmployee setValue:self.txtLname.text forKey:@"lname"];
                               [newEmployee setValue:self.txtEmail.text forKey:@"email"];
                               [newEmployee setValue:self.txtPhone.text forKey:@"phone"];
                               [newEmployee setValue:self.departMentOutlet.titleLabel.text forKey:@"department"];
                               [newEmployee setValue:self.txtOrgname.text forKey:@"orgname"];
                               [newEmployee setValue:self.txtPassword.text forKey:@"password"];
                               NSLog(@"NewData Added");
                               [appDelegate saveContext];
                               [self dismissViewControllerAnimated:YES completion:nil];
                               NSError *error = nil;
                                if (![context save:&error])
                                {
                                    NSLog(@"Error in saving Data.%@ %@",error,[error localizedDescription] );
                                }
                    
                                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Your Data Is Saved." preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){[self dismissViewControllerAnimated:YES completion:nil];
                                    NSLog(@"Saved.");}];
                            [alert addAction:actionOk];
                            [self presentViewController:alert animated:YES completion:nil];
        
                            }
                        else
                        {
                                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter Details." preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                {
                                    NSLog(@"Alert Empty!");
                                }];
                                [alert addAction:actionOk];
                                [self presentViewController:alert animated:YES completion:nil];
                            
                        }
            }
            else
            {
                NSLog(@"Alert Email!");
                UIAlertController *alertEmail = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Enter valid Email!" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
                [alertEmail addAction:actionOk];
                [self presentViewController:alertEmail animated:YES completion:nil];
            }
        }
        else
        {
            NSLog(@"AlertPass!");

            UIAlertController *alertPass = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Enter valid Password!" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
            [alertPass addAction:actionOk];
            [self presentViewController:alertPass animated:YES completion:nil];
        }
    }
    else
    {
        NSLog(@"AlertPhone!");

        UIAlertController *alertPhone = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Enter valid Phone!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        [alertPhone addAction:actionOk];
        [self presentViewController:alertPhone animated:YES completion:nil];
    }
}

- (IBAction)tmpButton:(UIButton *)sender
{
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    
        NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
           NSArray *results = [context executeFetchRequest:requestExamLocation error:nil];
           
           // Log data    
           NSLog(@"firstNames are %@",[results valueForKey:@"fname"]);
           NSLog(@"lastNames are %@",[results valueForKey:@"lname"]);
           NSLog(@"Orgnizations are %@",[results valueForKey:@"orgname"]);
           NSLog(@"Departments are %@",[results valueForKey:@"department"]);
           NSLog(@"Emails are %@",[results valueForKey:@"email"]);
           NSLog(@"Phones are %@",[results valueForKey:@"phone"]);
           NSLog(@"Passwords are %@",[results valueForKey:@"password"]);
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)departmentAction:(UIButton *)sender
{
    [[self view] endEditing:YES];
    if (self.pickerViewDepartment.hidden==YES)
       {
           self.pickerViewDepartment.hidden=NO;
           
       }
       else
       {
           self.pickerViewDepartment.hidden=YES;
       }
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.departments.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [departments objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_departMentOutlet setTitle:[departments objectAtIndex:row] forState:normal];
    [self.departMentOutlet resignFirstResponder];
    _pickerViewDepartment.hidden=YES;
}
-(void)dismissKeyboard
{
    [[self view]endEditing:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[self view]endEditing:YES];
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

-(void)dismissAction
{
    [[self view]endEditing:YES];
}
@end
