//
//  MCSViewController.m
//  My Cool Spots
//
//  Created by Jaime Connor on 8/18/14.
//  Copyright (c) 2014 Jaime Connor. All rights reserved.
//

#import "MCSViewController.h"

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

#import "MCSAnnotation.h"

#import "MCSTableViewController.h"

@interface MCSViewController ()  <CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation MCSViewController
{
    MKMapView * myMapView;
    
    CLLocationManager * locationManager;
    
    MCSTableViewController * tableViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    myMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 2)];
    myMapView.showsUserLocation = YES;
    myMapView.delegate = self;
//    [mapView setUserTrackingMode:YES animated:YES];
    [self.view addSubview:myMapView];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    tableViewController = [[MCSTableViewController alloc] init];
    tableViewController.tableView.frame = CGRectMake(0, SCREEN_HEIGHT / 2 + 1, SCREEN_WIDTH, SCREEN_HEIGHT / 2);
    [self.view addSubview:tableViewController.tableView];
    

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    for (CLLocation * location in locations) {
        NSLog(@"%f %f",location.coordinate.latitude, location.coordinate.longitude);
        
        // call foursquarerequest and create annotations for each venue
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];
        
        for (int i = 0; i < 10; i++)
        {
            MCSAnnotation * annotation = [[MCSAnnotation alloc] init];
            
            //       annotation.coordinate = location.coordinate;
            
            float randomLat = (arc4random_uniform(100) - 50.0)/ 100.0 + location.coordinate.latitude;
            float randomLong = (arc4random_uniform(100) - 50.0) / 100.0 + location.coordinate.longitude;
            
            CLLocationCoordinate2D randomCoordinate = CLLocationCoordinate2DMake(randomLat, randomLong);
            
            [annotation setCoordinate:randomCoordinate];
            
            
            CLGeocoder * geocoder = [[CLGeocoder alloc] init];
            
            CLLocation * randomLocation = [[CLLocation alloc] initWithLatitude:randomCoordinate.latitude longitude:randomCoordinate.longitude];
            
            [geocoder reverseGeocodeLocation:randomLocation completionHandler:^(NSArray *placemarks, NSError *error) {
                for (CLPlacemark * placemark in placemarks)
                {
                  //  NSLog(@"%@",placemark.addressDictionary);
                    [annotation setTitle:placemark.name];
                }
            }];
            
            [annotation setTitle:@"Title"];
            
            [myMapView addAnnotation:annotation];
        
        }
        
        
    }
    [locationManager stopUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MCSAnnotation * ann = annotation;
    if (mapView.userLocation.location.coordinate.latitude == ann.coordinate.latitude && mapView.userLocation.location.coordinate.longitude == ann.coordinate.longitude)
    {
        
    } else {
        MKPinAnnotationView * annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
        
        annotationView.draggable = YES;
        
        
        
        NSArray * markers = @[
                              [UIImage imageNamed:@"blue"],
                              [UIImage imageNamed:@"green"],
                              [UIImage imageNamed:@"magenta"]
                              ];
        
        int randomMarker = arc4random_uniform((int)markers.count);
        annotationView.image = markers[randomMarker];
        
        annotationView.canShowCallout = YES;
        
        UIButton * rightCallout = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        [rightCallout addTarget:self action:@selector(showDetailVC) forControlEvents:UIControlEventTouchUpInside];
        
        annotationView.rightCalloutAccessoryView = rightCallout;
        
        return annotationView;

    }
    
    return nil;
}

- (void)showDetailVC
{
    UIViewController * detailVC = [[UIViewController alloc] init];
    
    detailVC.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

//- (void)setFriendInfo:(NSDictionary *)friendInfo
//{
//    _friendInfo = friendInfo;
//    
//    NSURL * purl = [NSURL URLWithString:friendInfo[@"html_url"]];
//    
//    NSURLRequest * request = [NSURLRequest requestWithURL:purl];
//    
//    [webView loadRequest:request];
//}



/*- (void)registerRegionWithCircularOverlay:(MKCircle*)overlay andIdentifier:(NSString*)atlanta {
    
    // If the overlay's radius is too large, registration fails automatically,
    // so clamp the radius to the max value.
    CLLocationDegrees radius = overlay.radius;
    if (radius > locationManager.maximumRegionMonitoringDistance) {
        radius = locationManager.maximumRegionMonitoringDistance;
    }
    
    // Create the geographic region to be monitored.
    CLCircularRegion *geoRegion = [[CLCircularRegion alloc]
                                   initWithCenter:overlay.coordinate
                                   radius:radius
                                   identifier:atlanta];
    [locationManager startMonitoringForRegion:geoRegion];
    
    
} */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
