// skypewatch.m
// to build: clang -o skypewatch skypewatch.m -framework foundation

#import <Foundation/Foundation.h>

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface Observer : NSObject

- (void)observeNotification:(NSNotification*)note;

@end

@implementation Observer

- (void)observeNotification:(NSNotification*)note
{
  printf("%s\n", [note.userInfo[@"SKYPE_API_NOTIFICATION_STRING"] UTF8String]);
  fflush(stdout);
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