TARGET=learn_cpp
SRC:=$(wildcard ./, *.cpp)

$(TARGET):$(SRC)
	g++ $^ -o $@

.PHONY:clean

clean:
	rm -fr $(TARGET)
