SOURCE_FONT_FILES := \
	fonts/src/BIZUDGothic-Bold.ttf \
	fonts/src/BIZUDGothic-Regular.ttf \
	fonts/src/BIZUDPGothic-Bold.ttf \
	fonts/src/BIZUDPGothic-Regular.ttf \
	fonts/src/BIZUDPMincho-Regular.ttf \
	fonts/src/Mplus1-Bold.otf \
	fonts/src/Mplus1-Regular.otf \
	fonts/src/Mplus2-Bold.otf \
	fonts/src/Mplus2-Regular.otf \
	fonts/src/UDEVGothic-Bold.ttf \
	fonts/src/UDEVGothic-BoldItalic.ttf \
	fonts/src/UDEVGothic-Italic.ttf \
	fonts/src/UDEVGothic-Regular.ttf

.PHONY: all
all: split-fonts

.PHONY: split-fonts
split-fonts: $(SOURCE_FONT_FILES) node_modules
	@rm -rf fonts/dist/*
	tools/create_subset_ttfs

.PHONY: clean
clean:
	rm -rf \
		fonts/dist/* \
		fonts/src/BIZUD* \
		fonts/src/Mplus*

fonts/src/BIZUDGothic%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-gothic/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDPGothic%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-gothic/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDMincho%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-mincho/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDPMincho%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-mincho/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/Mplus%.otf:
	curl -fsSL -o $@ 'https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/otf/$(notdir $@)'

fonts/src/Mplus%.ttf:
	curl -fsSL -o $@ 'https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/$(notdir $@)'

node_modules: package-lock.json
	npm clean-install
	@touch $@
