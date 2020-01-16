//
//  SignUpViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface SignUpViewController : ViewController<UIPickerViewDelegate,UIPickerViewDataSource>
- (BOOL)validateEmailWithString:(NSString*)email;
- (BOOL)validatePassword:(NSString*)password;
- (BOOL)validatePhone:(NSString*)phone;
@property (strong, nonatomic) IBOutlet UITextField *txtFname;
@property (strong, nonatomic) IBOutlet UITextField *txtLname;
@property (strong, nonatomic) IBOutlet UITextField *txtOrgname;
//@property (strong, nonatomic) IBOutlet UITextField *txtDepName;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewDepartment;
@property (strong,nonatomic)NSArray *departments;
@property (strong, nonatomic) IBOutlet UIButton *departMentOutlet;

@property (strong, nonatomic)AppDelegate *delegate;
@property (strong)NSManagedObject *employeeDB;
- (IBAction)btnSubmit:(UIButton *)sender;
- (IBAction)tmpButton:(UIButton *)sender;
- (IBAction)departmentAction:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
