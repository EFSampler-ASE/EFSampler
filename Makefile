CC = g++
CFLAGS = -Ibitwuzla/include -Idbg-macro -Iclipp/include -O3 -std=c++17 -Wall -Werror
LFLAGS = -Lbitwuzla/build -lbitwuzla -lgmp -lpthread

EFSampler: EFSampler.cpp
	$(CC) $(CFLAGS) $< -o $@ $(LFLAGS)
