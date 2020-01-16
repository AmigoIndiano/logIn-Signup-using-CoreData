//
//  AddFamilyDetailsViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "AddFamilyDetailsViewController.h"
#import <CoreData/CoreData.h>
#import  "QuartzCore/QuartzCore.h"
@interface AddFamilyDetailsViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
    NSArray *dictionaries;
}
@property(strong,nonatomic)NSArray *temp;
@end

@implementation AddFamilyDetailsViewController
@synthesize dataX,profession,ReadingCheckBox,WritingCheckBox,PaintingCheckBox;

- (void)viewDidLoad {

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.scrollView addGestureRecognizer:tap];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_tblView];
    
    self.professionDD.layer.borderWidth =1.0;
    self.tblView.layer.borderWidth = 1.0;
    self.txtFname.layer.borderWidth = 1.0;
    self.txtPickRelation.layer.borderWidth = 1.0;
    self.txtDOB.layer.borderWidth = 1.0;
    NSLog(@"AddFamily Contains: %@",dataX);
    [super viewDidLoad];
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        [[self navigationController] setNavigationBarHidden:NO animated:NO];
    }
    
    relations=@[@"Father",@"Mother",@"Wife",@"Husband",@"Son",@"Daughter"];
    pickerRelation = [[UIPickerView alloc]init];
    
    picker = [[UIDatePicker alloc]init];
    picker.datePickerMode = UIDatePickerModeDate;
    [self.txtDOB setInputView:picker];
    
    [pickerRelation setDataSource:self];
    [pickerRelation setDelegate:self];
    [self.txtPickRelation setInputView:pickerRelation];
    
    //toolbar
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(selectedDate)];
    [toolBar setItems:[NSArray arrayWithObject:doneBtn]];
    [self.txtDOB setInputAccessoryView:toolBar];
    UIToolbar *toolBar2 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *doneBtn2 = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissAction)];
    [toolBar2 setItems:[NSArray arrayWithObject:doneBtn2]];
    [self.txtPickRelation setInputAccessoryView:toolBar2];
    
    self.txtFname.delegate = self;
    self.txtPickRelation.delegate = self;
    self.txtDOB.delegate = self;
    NSString *Name,*relation,*date;
    Name=self.txtFname.text;
    relation= self.txtPickRelation.text;
    date = self.txtDOB.text;
    
    profession = [NSArray arrayWithObjects: @"Business",@"Job",@"Study",@"HouseHold",@"Retired",nil];
    self.tblView.delegate = self;
    self.tblView.dataSource = self;
    ReadingChecked=NO;
    WritingChecked=NO;
    PaintingChecked=NO;
    gender = @"";
    NSLog(@"AddFamilyVC Contains:%@", dataX);
    hobbies = [[NSMutableArray alloc]init];
}

-(void)dismissAction
{
    [[self view]endEditing:YES];
}
-(void)selectedDate
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    self.txtDOB.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:picker.date]];
    [self.txtDOB resignFirstResponder];
    [[self view]endEditing:YES];
}
- (IBAction)ReadingCheckBoxAction:(UIButton *)sender
{
    if (!ReadingChecked)
    {
        ReadingChecked = YES;
        ReadingCheckBox.selected=ReadingChecked;
        [hobbies addObject:@"Reading"];
        NSLog(@"%@",hobbies);
    }
    else if (ReadingChecked)
    {
        ReadingChecked = NO;
        ReadingCheckBox.selected=ReadingChecked;
        [hobbies removeObject:@"Reading"];
        NSLog(@"%@",hobbies);
        
    }
}

- (IBAction)WritingCheckBoxAction:(UIButton *)sender
{
    if (!WritingChecked)
    {
        WritingChecked = YES;
        WritingCheckBox.selected=WritingChecked;
        [hobbies addObject:@"Writing"];
        NSLog(@"%@",hobbies);
    }
    else if (WritingChecked)
    {
        WritingChecked = NO;
        WritingCheckBox.selected=WritingChecked;
        [hobbies removeObject:@"Writing"];
        NSLog(@"%@",hobbies);
    }
}

- (IBAction)PaintingCheckBoxAction:(UIButton *)sender
{
    if (!PaintingChecked)
    {
        PaintingChecked = YES;
        PaintingCheckBox.selected=PaintingChecked;
        [hobbies addObject:@"Painting"];
        NSLog(@"%@",hobbies);
        
    }
    else if (PaintingChecked)
    {
        PaintingChecked = NO;
        PaintingCheckBox.selected=PaintingChecked;
        [hobbies removeObject:@"Painting"];
        NSLog(@"%@",hobbies);
    }
}

- (IBAction)radioBtnMaleAction:(UIButton *)sender
{
    if (_radioBtnFemale.selected==YES) {
        _radioBtnFemale.selected = NO;
        _radioBtnMale.selected = YES;
        gender = @"Male";
        NSLog(@"Male");
    }
    else
    {
        _radioBtnMale.selected = YES;
        gender = @"Male";
        NSLog(@"Male");
    }
}

- (IBAction)radioBtnFemaleAction:(UIButton *)sender
{
    if (_radioBtnMale.selected == YES) {
        _radioBtnMale.selected = NO;
        _radioBtnFemale.selected=YES;
        gender = @"Female";
        NSLog(@"Female");
    } else {
        _radioBtnFemale.selected=YES;
        gender = @"Female";
        NSLog(@"Female");
    }
    
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self.profession objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.profession.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tblView cellForRowAtIndexPath:indexPath];
    [self.professionDD setTitle:cell.textLabel.text forState:UIControlStateNormal];
    self.tblView.hidden = YES;
    self.imgBtnOutlet.selected =NO;
}
- (IBAction)professionDDBtn:(UIButton *)sender
{
    if (self.tblView.hidden==YES)
    {
        CATransition *animat = [CATransition animation];
        animat.type = kCAGravityTop;
        animat.duration = 0.4;
        [self.tblView.layer addAnimation:animat forKey:nil];
        self.imgBtnOutlet.selected=YES;
        self.tblView.hidden=NO;
        
    }
    else
    {
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFromTop;
        animation.duration = 0.4;
        [self.tblView.layer addAnimation:animation forKey:nil];

        self.imgBtnOutlet.selected=NO;
        self.tblView.hidden=YES;
    }
}

- (IBAction)imgBtnAct:(UIButton *)sender
{
    if (self.tblView.hidden==YES)
    {
        CATransition *animat = [CATransition animation];
        animat.type = kCAGravityTop;
        animat.duration = 0.4;
        [self.tblView.layer addAnimation:animat forKey:nil];
        self.imgBtnOutlet.selected=YES;
        self.tblView.hidden=NO;
        
    }
    else
    {
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionFromTop;
        animation.duration = 0.4;
        [self.tblView.layer addAnimation:animation forKey:nil];

        self.imgBtnOutlet.selected=NO;
        self.tblView.hidden=YES;
    }
}

- (IBAction)submitBtn:(UIButton *)sender
{
    NSString *relationX= _txtPickRelation.text;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    NSFetchRequest *requestExamLocation = [NSFetchRequest fetchRequestWithEntityName:@"FamilyDetails"];
    NSArray *results = [context executeFetchRequest:requestExamLocation error:nil];
    NSArray *relat = [results valueForKey:@"relation"];
    
    if(![relat containsObject:relationX])
    {
        if (self.txtFname.text.length && self.txtPickRelation.text.length && self.txtDOB.text.length
            && gender.length > 0 && ![self.professionDD.titleLabel.text  isEqual: @"Select Profession"] && self->hobbies.count>0)
        {
            
            appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            context = appDelegate.persistentContainer.viewContext;
            // Save Data
            NSManagedObject *newMember = [NSEntityDescription insertNewObjectForEntityForName:@"FamilyDetails" inManagedObjectContext:context];
            //create new Member
            [newMember setValue:dataX forKey:@"email"];
            [newMember setValue:self.txtFname.text forKey:@"name"];
            [newMember setValue:self.txtDOB.text forKey:@"dob"];
            [newMember setValue:self.txtPickRelation.text forKey:@"relation"];
            [newMember setValue:gender forKey:@"gender"];
            [newMember setValue:hobbies forKey:@"hobbies"];
            [newMember setValue:self.professionDD.titleLabel.text forKey:@"profession"];
            
            //bloodgrp
            NSLog(@"NewData Added");
            [appDelegate saveContext];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
            NSError *error = nil;
            if (![context save:&error])
            {
                NSLog(@"Error in saving Data.%@ %@",error,[error localizedDescription] );
            }
            NSLog(@"BhaiBhai!");
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please Enter Valid Details." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                       {
                NSLog(@"Alert FDATA.");
            }];
            [alert addAction:actionOk];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }
    else
    {
        UIAlertController *alertX = [UIAlertController alertControllerWithTitle:@"Alert" message:@"This Relation already added" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOkX = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){NSLog(@"Alert FDATA.");}];
        [alertX addAction:actionOkX];
        [self presentViewController:alertX animated:YES completion:nil];
    }
    
}

//PickerView methods
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return relations.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [relations objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_txtPickRelation setText:[relations objectAtIndex:row]];
}
//Dismiss
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

[self resignFirstResponder];
    //[[self view]endEditing:YES];
    //_tblView.hidden=YES;
}
- (IBAction)temp:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dismissKeyboard
{
    [[self view]endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
  NSInteger nextTag = textField.tag + 1;
  UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
  if (nextResponder) {
    [nextResponder becomeFirstResponder];
  }
  else{
      [textField resignFirstResponder];
  }
  return NO;
}
@end
