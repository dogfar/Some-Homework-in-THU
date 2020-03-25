/********************************************************
*	Strategy.h : 策略接口文件                           *
*	张永锋                                              *
*	zhangyf07@gmail.com                                 *
*	2010.8                                              *
*********************************************************/

#ifndef STRATEGY_H_
#define	STRATEGY_H_

#include "Point.h"

extern "C" __declspec(dllexport) Point* getPoint(const int M, const int N, const int* top, const int* _board, 
	const int lastX, const int lastY, const int noX, const int noY);

extern "C" __declspec(dllexport) void clearPoint(Point* p);

void clearArray(int M, int N, int** board);

void expand(int cnt,int u,int fath,int tpx,int tpy);
int choose(int idx);
void playchess(int idx);
void playchesspoint(int x,int y,int userid);
int calreward(int idx);
int calrewardpt(int x,int y,int userid);


#endif