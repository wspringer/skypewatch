// skypewatch.m
// to build: clang -o skypewatch skypewatch.m -framework foundation

#import <Foundation/Foundation.h>

@interface Observer : NSObject

- (void)observeNotification:(NSNotification*)note;

@end

@implementation Observer

- (void)observeNotification:(NSNotification*)note
{
  NSLog(@"%@", note.userInfo[@"SKYPE_API_NOTIFICATION_STRING"]);
}

@end

int main (int argc, char const *argv[])
{
  @autoreleasepool {
    Observer* myObserver = [[Observer alloc] init];
    [[NSDistributedNotificationCenter defaultCenter] addObserver:myObserver selector:@selector(observeNotification:) name:@"SKSkypeAPINotification" object:nil];
    CFRunLoopRun();
  }
  return 0;
}