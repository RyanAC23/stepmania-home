dependencies="build-essential" \
			"cmake" \
			"mesa-common-dev" \
			"libglu1-mesa-dev" \
			"libglew1.5-dev" \
			"libxtst-dev" \
			"libxrandr-dev" \
			"libpng-dev" \
			"libjpeg-dev" \
			"zlib1g-dev" \
			"libbz2-dev" \
			"libogg-dev" \
			"libvorbis-dev" \
			"libc6-dev" \
			"yasm" \
			"libasound-dev" \
			"libpulse-dev" \
			"binutils-dev" \
			"libgtk-3-dev" \
			"libmad0-dev" \
			"libudev-dev" \
			"libva-dev" \
			"nasm"

SyncFolders = "Announcers" \
			"BackgroundEffects" \
			"BackgroundTransitions" \
			"BGAnimations" \
			"Characters" \
			"NoteSkins" \
			"RandomMovies" \
			"Songs" \
			"Themes"

# Variables
SMLauncher = ~/bin/stepmania
PresentDirectory = $(CURDIR)
SMResources = $(PresentDirectory)/SM-Resources
SMMain = $(PresentDirectory)/stepmania

# Install necessary packages
dependencies:
	sudo apt install $(dependencies)

# Clone the SM repo and build it
StepMania:
	if [ ! -d ./stepmania ]; then \
		git clone --depth=1 https://github.com/stepmania/stepmania.git; \
	fi
	cd stepmania; \
	git submodule update --init; \
	cd Build; \
	cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release .. && cmake ..; \
	make -j8

launcher:
	if [ ! -f $(SMLauncher) ]; then \
		touch $(SMLauncher); \
		@echo "#!/bin/bash" >> $(SMLauncher); \
		@echo "$(PresentDirectory)/stepmania/stepmania" >> $(SMLauncher); \
		chmod +x $(SMLauncher); \
		@echo "stepmania command added. You need to reload for this to be active."; \
	fi

symlinks:
	if [ -d $(SMResources) ]; then \
		for i in $(SyncFolders); do \
			if [ -d $(SMMain)/$$i ]; then \
				cp -RT $(SMMain)/$$i $(SMResources)/$$i && rm -rf $(SMMain)/$$i; \
			fi; \
			if [ ! -d $(SMMain)/$$i ]; then \
				ln -s $(SMResources)/$$i $(SMMain)/$$i; \
			fi; \
		done; \
	fi

test:
	@echo $(PresentDirectory)

# Cleanup
cleanLauncher:
	if [ -f $(SMLauncher) ]; then \
		 rm $(SMLauncher); \
		 @echo "Removing $(SMLauncher)."; \
	fi

clean:
	if [ -d stepmania ]; then \
		rm -rf stepmania; \
	fi
