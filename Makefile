TARGET := plparse
SRC_C  := src/*.c
SRC_H  := src/*.h
FLAGS  := -std=gnu17 -Wall -O3

ifndef HOST_OS
    ifeq ($(OS),Windows_NT)
        HOST_OS	:= Windows
    else
        HOST_OS	:= $(shell uname -s)
    endif
endif

ifneq ($(HOST_OS),Darwin)
    $(error plparse can only be built on Darwin)
endif

FLAGS += -framework CoreFoundation -framework IOKit -framework Security

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC_C) $(SRC_H)
	$(CC) -o $@ $(SRC_C) $(FLAGS) $(CFLAGS) $(LDFLAGS) $(LDLIBS)

clean:
	rm -f $(TARGET)
