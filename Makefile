OUTPUTDIR=$(shell pwd)/libsdl2

SDL2-2.0.14.tar.gz: 
	wget -c https://libsdl.org/release/SDL2-2.0.14.tar.gz
	
SDL2_image-2.0.5.tar.gz:
	wget -c https://libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz
	
SDL2_ttf-2.0.15.tar.gz:
	wget -c https://libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.15.tar.gz

unarchive: SDL2-2.0.14.tar.gz SDL2_image-2.0.5.tar.gz SDL2_ttf-2.0.15.tar.gz
	tar -xzvf SDL2-2.0.14.tar.gz 
	tar -xzvf SDL2_image-2.0.5.tar.gz 
	tar -xzvf SDL2_ttf-2.0.15.tar.gz

clean:
	rm -rf SDL2-2.0.14 SDL2_image-2.0.5 SDL2_ttf-2.0.15

build: unarchive
	cd SDL2-2.0.14 ; ./configure --prefix=$(OUTPUTDIR) --disable-shared; make install
	cd SDL2_image-2.0.5 ; ./configure --prefix=$(OUTPUTDIR) --disable-shared --with-sdl-prefix=$(OUTPUTDIR); make install
	cd SDL2_ttf-2.0.15 ; ./configure --prefix=$(OUTPUTDIR) --disable-shared --with-sdl-prefix=$(OUTPUTDIR); make install
	