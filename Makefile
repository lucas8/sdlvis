LDFLAGS=`sdl-config --libs` `pkg-config --libs SDLP_event SDLP_tools SDL_image SDL_gfx` -lboost_system -lboost_filesystem -lboost_program_options
CXXFLAGS=`sdl-config --cflags` `pkg-config --cflags SDLP_event SDLP_tools SDL_image SDL_gfx` -Wall -g
OBJS=main.o print.o config.o timer.o
PROG=sdlvis

all : $(OBJS)
	g++ $(CXXFLAGS)	   -o $(PROG)	$^ $(LDFLAGS)

main.o : main.cpp
	g++ $(CXXFLAGS)	-c -o $@	$<

%.o : %.cpp %.hpp
	g++ $(CXXFLAGS)	-c -o $@	$<

clean :
	@touch $(OBJS) $(PROG)
	@rm -v $(OBJS) $(PROG)

rec : clean all

doc :
	firefox ../../../Codesources/boost1.46-1.46.1/doc/html/program_options/tutorial.html > /dev/null 2>&1 &

example :
	@echo ../../../Codesources/boost1.46-1.46.1/libs/program_options/example/multiple_sources.cpp