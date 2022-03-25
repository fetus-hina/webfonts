SOURCE_FONT_FILES := \
	fonts/src/BIZUDPGothic-Bold.ttf \
	fonts/src/BIZUDPGothic-Regular.ttf \
	fonts/src/BIZUDPMincho-Regular.ttf \
	fonts/src/Mplus1-Black.otf \
	fonts/src/Mplus1-Bold.otf \
	fonts/src/Mplus1-ExtraBold.otf \
	fonts/src/Mplus1-ExtraLight.otf \
	fonts/src/Mplus1-Light.otf \
	fonts/src/Mplus1-Medium.otf \
	fonts/src/Mplus1-Regular.otf \
	fonts/src/Mplus1-SemiBold.otf \
	fonts/src/Mplus1-Thin.otf \
	fonts/src/Mplus2-Black.otf \
	fonts/src/Mplus2-Bold.otf \
	fonts/src/Mplus2-ExtraBold.otf \
	fonts/src/Mplus2-ExtraLight.otf \
	fonts/src/Mplus2-Light.otf \
	fonts/src/Mplus2-Medium.otf \
	fonts/src/Mplus2-Regular.otf \
	fonts/src/Mplus2-SemiBold.otf \
	fonts/src/Mplus2-Thin.otf

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
		fonts/src/*.otf \
		fonts/src/*.ttf

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
