CC  = gcc 
CXX = g++ 
CFLAGS = -g -O2 -Wall -fPIC -D_GNU_SOURCE -std=c++0x

SRC=.
PROTO_DIR= proto/
PROTO_CC_DIR= proto_cc/
INC  = -I include/ -I $(PROTO_CC_DIR) 
LIB  = -L src -ldl -L lib/ -lprotobuf

PROTO_CC_OBJECTS = $(patsubst %.cc, %.o, $(notdir $(wildcard $(PROTO_CC_DIR)*.cc)))

OBJS = $(PROTO_CC_OBJECTS) test.o  
BIN  = test.run

all: compile_pb $(BIN)

$(BIN): $(OBJS)
	$(CXX) $(CFLAGS) -o $@ $^ $(INC) $(LIB)

%.o: src/%.cc 
	$(CXX) $(CFLAGS) $(INC) -c -o $@ $<
	
%.o: $(PROTO_CC_DIR)%.cc
	$(CXX) $(CFLAGS) $(INC) -c -o $@ $<

compile_pb:
	@echo -e "\033[1;33m\nCompiling pb struct $< ==> $@ \033[0m..."
	cd $(PROTO_DIR);make;cd ..      

clean:
	rm -rf $(BIN)
	rm -rf $(OBJS)
