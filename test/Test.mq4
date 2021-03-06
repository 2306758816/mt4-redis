//+------------------------------------------------------------------+
//|                                              DLLSampleTester.mq4 |
//|                 Copyright ｩ 2005-2014, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright ｩ 2005-2014, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net/"

#import "MT4RedisPlugin.dll"
string HelloWorld(string);
string RedisGet(string);
string RedisGetWithTimeout(string,int);
int RedisSet(string,string);
int RedisSetWithTimeout(string, string, int);
int RedisCommand(string);
int RedisCommandWithTimeout(string,int);
int RedisTest(string,int);
#import

#define TIME_INDEX   0
#define OPEN_INDEX   1
#define LOW_INDEX    2
#define HIGH_INDEX   3
#define CLOSE_INDEX  4
#define VOLUME_INDEX 5
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {   
   Print("GO GO GO");
   
   string hello;
   hello = HelloWorld("1234abc");
   Print("result is", hello);
   
   string test;
   test = RedisTest("127.0.0.1",6379);
   Print("test result is", test);
   
   int cmd1;
   cmd1 = RedisCommand("set KEYabc VALUE123");
   Print("RedisCommand test = ", cmd1);
   
   int cmd2;
   cmd2 = RedisCommandWithTimeout("set KEYabc VALUE123",10000);
   Print("RedisCommandWithTimeout test = ", cmd2);
   
   string key1 = "key1";
   string value1 = "value1";
   int set1 = RedisSet(key1,value1);
   Print("RedisSet test = ", set1);
   
   string key2 = "key2";
   string value2 = "value2";
   int timeout = 10000;
   int set2 = RedisSetWithTimeout(key2,value2,timeout);
   Print("RedisSetWithTimeout test = ", set2);

   string get1 = RedisGet(key1);
   Print("RedisGet test = ", get1);
   
   string get2 = RedisGetWithTimeout(key2,timeout);
   Print("RedisGetWithTimeout test = ", get2);
   
   string key3 = "key3";
   string get3 = RedisGet(key3);
   Print("RedisGet test = ", get3);
   
   string key4 = "key4";
   string get4 = RedisGet(key4);
   Print("RedisGet test = ", get4);
//---
   return(0);
  }
//+------------------------------------------------------------------+
//| array functions call                                             |
//+------------------------------------------------------------------+
int start()
  {
   return(0);
  }
//+------------------------------------------------------------------+
