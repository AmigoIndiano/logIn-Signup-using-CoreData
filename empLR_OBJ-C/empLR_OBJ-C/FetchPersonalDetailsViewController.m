//
//  FetchPersonalDetailsViewController.m
//  empLR_OBJ-C
//
//  Created by Jenis Shah on 18/12/19.
//  Copyright © 2019 Jenis Shah. All rights reserved.
//

#import "FetchPersonalDetailsViewController.h"
#import "FetchFamilyDetailsViewController.h"
#import <CoreData/CoreData.h>
@interface FetchPersonalDetailsViewController ()
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;
}
@end

@implementation FetchPersonalDetailsViewController
@synthesize data,temp;
- (void)viewDidLoad {
    [super viewDidLoad];
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        [[self navigationController] setNavigationBarHidden:NO animated:NO];
    }
    
    NSLog(@"FetchPersonalVC Contains:%@",data);
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email = %@", data];
    [request setPredicate:predicate];
    [request setReturnsObjectsAsFaults:NO];
    NSArray *results = [context executeFetchRequest:request error:nil];
    NSString *firstName,*lastName,*orgName,*departmentName,*phoneNO,*emailID;
    
    firstName = [[results valueForKey:@"fname"] firstObject];
    lastName = [[results valueForKey:@"lname"] firstObject];
    orgName=[[results valueForKey:@"orgname"] firstObject];
    departmentName=[[results valueForKey:@"department"] firstObject];
    phoneNO=[[results valueForKey:@"phone"] firstObject];
    emailID=[[results valueForKey:@"email"] firstObject];

    [self.lblName setText:[NSString stringWithFormat:@"%@ %@",firstName,lastName]];
    [self.lblOrg setText:[NSString stringWithFormat:@"%@",orgName]];
    [self.lblDepartment setText:[NSString stringWithFormat:@"%@",departmentName]];
    [self.lblEmail setText:[NSString stringWithFormat:@"%@",emailID]];
    [self.lblPhone setText:[NSString stringWithFormat:@"%@",phoneNO]];
    
    NSLog(@"firstName is %@",firstName);
    NSLog(@"lastName is %@",lastName);
    NSLog(@"Orgnization is %@",orgName);
    NSLog(@"Department is %@",departmentName);
    NSLog(@"Phone is %@",phoneNO);
    NSLog(@"Email is %@",emailID);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toFetchFData"])
    {
        FetchFamilyDetailsViewController *vc = [segue destinationViewController];
        vc.data = data;
    }
}

@end
