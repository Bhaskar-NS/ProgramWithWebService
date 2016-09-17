//
//  ViewController.m
//  ObjectiveCDataBaseTutorial
//
//  Created by test on 9/1/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UITextField *compName;
@property (strong, nonatomic) IBOutlet UITextField *compAddress;
@property (strong, nonatomic) IBOutlet UITextField *longitude;
@property (strong, nonatomic) IBOutlet UITextField *latitude;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

//    //fetching data form php server
//    
//    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
//    [request setURL:[NSURL URLWithString:@"http://localhost:8888/Service.php"]];
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    [[session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
//        
//        
//        NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@",[json objectForKey:@"Data"]);
//    }]resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitAction:(id)sender {
    

    [self performSegueWithIdentifier:@"go" sender:nil];
    NSMutableString *postString = [NSMutableString stringWithString:@"http://localhost:8888/tutorialTest.php"];
    
    [postString appendString:[NSString stringWithFormat:@"?Name=%@", self.compName.text]];
    
    [postString appendString:[NSString stringWithFormat:@"&Address=%@",self.compAddress.text]];
    
    [postString appendString:[NSString stringWithFormat:@"&Longitude=%@",self.longitude.text]];
    
    [postString appendString:[NSString stringWithFormat:@"&Latitude=%@",self.latitude.text]];
    [postString setString:[postString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    [request setHTTPMethod:@"POST"];
    NSLog(@"%@",request);
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            
            
        }];
    [dataTask resume];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}



@end

