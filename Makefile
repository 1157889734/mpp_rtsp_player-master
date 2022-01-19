CXX = /home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/bin/aarch64-buildroot-linux-gnu-g++
CC = /home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/bin/aarch64-buildroot-linux-gnu-gcc
LINK = /home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/bin/aarch64-buildroot-linux-gnu-g++


LIBS = -lrockchip_mpp -lpthread -ldrm

CCFLAGS = -c -g -fPIC
C++FLAGS = -c -g -fPIC

C_FILES = rkdrm/bo.c \
	  rkdrm/dev.c \
	  rkdrm/modeset.c \
	  rkdrm/rkdrm.c \
	  main.c  mppdecoder.c  rtspprotocolutil.c 

#CPP_FILES = main.cpp Codec.cpp RGA.cpp Thread.cpp

OBJS = \
       $(patsubst %.c,%.o,$(wildcard rkdrm/*.c))\
       $(patsubst %.c,%.o,$(wildcard *.c))

INCLUDES += -I/home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/rockchip/ \
	   -I/home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/drm/
INCLUDES += -I/home/edgar/data/P77/trunk/M3/rk356x_linux/buildroot/output/rockchip_rk3568/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/

TARGET=mpp_rtsp_demo

all:$(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(CFLAGS) $(INCLUDE) $(LDFLAGS) -Wall -fPIC $(LIBS)


%.o:%.c
	$(CC) -c -o $@ $(@:.o=.c) $(CCFLAGS) $(INCLUDES)


clean:
	rm -f *.o

