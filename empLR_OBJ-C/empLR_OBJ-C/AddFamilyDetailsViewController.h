//
//  AddFamilyDetailsViewController.h
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
NS_ASSUME_NONNULL_BEGIN

@interface AddFamilyDetailsViewController : ViewController<UITableViewDelegate,UITableViewDataSource>
{
    BOOL ReadingChecked,WritingChecked,PaintingChecked;
    NSString *gender;
    NSMutableArray *hobbies;
    UIDatePicker *picker;
    UIPickerView *pickerRelation;
    NSArray *relations;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic)AppDelegate *delegate;
@property (strong)NSManagedObject *familyDB;
- (IBAction)temp:(UIButton *)sender;

@property(strong,nonatomic)NSString *dataX;
//textFields
@property (strong, nonatomic) IBOutlet UITextField *txtPickRelation;

@property (strong, nonatomic) IBOutlet UITextField *txtFname;
@property (strong, nonatomic) IBOutlet UITextField *txtDOB;

//RadioButtons
@property (strong, nonatomic) IBOutlet UIButton *radioBtnMale;
@property (strong, nonatomic) IBOutlet UIButton *radioBtnFemale;
- (IBAction)radioBtnMaleAction:(UIButton *)sender;
- (IBAction)radioBtnFemaleAction:(UIButton *)sender;

//CheckBoxes
@property (strong, nonatomic) IBOutlet UIButton *PaintingCheckBox;
@property (strong, nonatomic) IBOutlet UIButton *WritingCheckBox;
@property (strong, nonatomic) IBOutlet UIButton *ReadingCheckBox;
- (IBAction)ReadingCheckBoxAction:(UIButton *)sender;
- (IBAction)WritingCheckBoxAction:(UIButton *)sender;
- (IBAction)PaintingCheckBoxAction:(UIButton *)sender;
//DropDown :Profession
@property (strong, nonatomic) IBOutlet UIButton *professionDD;
@property (strong, nonatomic) IBOutlet UITableView *tblView;
@property (strong,nonatomic)NSArray *profession;
- (IBAction)professionDDBtn:(UIButton *)sender;
- (IBAction)imgBtnAct:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *imgBtnOutlet;
- (IBAction)submitBtn:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
