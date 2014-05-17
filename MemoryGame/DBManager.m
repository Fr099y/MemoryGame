//
//  DBManager.m
//  MemoryGame
//
//  Created by Fr099yz on 4/22/14.
//  Copyright (c) 2014 Fr099y. All rights reserved.
//

#import "DBManager.h"

//static DBManager *sharedInstance = nil;
//static sqlite3 *database = nil;
//static sqlite3_stmt *statement = nil;

@implementation DBManager


//+(DBManager*)getSharedInstance
//{
//    if (!sharedInstance) {
//        sharedInstance = [[super allocWithZone:NULL]init];
//        [sharedInstance createDB];
//    }
//    return sharedInstance;
//}
//
//-(BOOL)createDB
//{
//    NSString *docsDir;
//    NSArray *dirPaths;
//    // Get the documents directory
//    dirPaths = NSSearchPathForDirectoriesInDomains
//    (NSDocumentDirectory, NSUserDomainMask, YES);
//    docsDir = dirPaths[0];
//    // Build the path to the database file
//    databasePath = [[NSString alloc] initWithString:
//                    [docsDir stringByAppendingPathComponent: @"scores.db"]];
//    BOOL isSuccess = YES;
//    NSFileManager *filemgr = [NSFileManager defaultManager];
//    if ([filemgr fileExistsAtPath: databasePath ] == NO)
//    {
//        const char *dbpath = [databasePath UTF8String];
//        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
//        {
//            char *errMsg;
//            const char *sql_stmt ="create table if not exists scores (name text, score integer)";
//            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
//                != SQLITE_OK)
//            {
//                isSuccess = NO;
//                NSLog(@"Failed to create table");
//            }
//            sqlite3_close(database);
//            return  isSuccess;
//        }
//        else {
//            isSuccess = NO;
//            NSLog(@"Failed to open/create database");
//        }
//    }
//    return isSuccess;
//}
//
//- (BOOL) saveData:(NSString*)name score:(int)score;
//{
//    const char *dbpath = [databasePath UTF8String];
//    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
//    {
//        NSString *insertSQL = [NSString stringWithFormat:@"insert into scores (name, score) values (\"%@\",\"%i\")",name, score];
//        const char *insert_stmt = [insertSQL UTF8String];
//        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
//        if (sqlite3_step(statement) == SQLITE_DONE)
//        {
//            return YES;
//        }
//        else {
//            return NO;
//        }
//    sqlite3_reset(statement);
//    }
//    return NO;
//}
//
//-(NSMutableArray*)findByScore:(int)score
//{
//    const char *dbpath = [databasePath UTF8String];
//    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
//    {
//        NSString *querySQL = [NSString stringWithFormat: @"select name, score  from scores order by score ASC"];
//        const char *query_stmt = [querySQL UTF8String];
//        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
//        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK)
//        {
//            if (sqlite3_step(statement) == SQLITE_ROW)
//            {
//                NSString *name = [[NSString alloc] initWithUTF8String:
//                                  (const char *) sqlite3_column_text(statement, 0)];
//                [resultArray addObject:name];
//                NSString *score = [[NSString alloc] initWithUTF8String:
//                                        (const char *) sqlite3_column_text(statement, 1)];
//                [resultArray addObject:score];
//                return resultArray;
//            }
//            else{
//                NSLog(@"Not found");
//                return nil;
//            }
//            sqlite3_reset(statement);
//        }
//    }
//    return nil;
//}

@end
