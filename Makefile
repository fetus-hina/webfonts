SOURCE_FONT_FILES := \
	fonts/src/BIZUDGothic-Bold.ttf \
	fonts/src/BIZUDGothic-Regular.ttf \
	fonts/src/BIZUDPGothic-Bold.ttf \
	fonts/src/BIZUDPGothic-Regular.ttf \
	fonts/src/BIZUDPMincho-Regular.ttf \
	fonts/src/FORMUDPGothic-Bold.ttf \
	fonts/src/FORMUDPGothic-Regular.ttf \
	fonts/src/IBMPlexSansJP-Bold.ttf \
	fonts/src/IBMPlexSansJP-Regular.ttf \
	fonts/src/LINESeedJP_OTF_Bd.otf \
	fonts/src/LINESeedJP_OTF_Eb.otf \
	fonts/src/LINESeedJP_OTF_Rg.otf \
	fonts/src/LINESeedJP_OTF_Th.otf \
	fonts/src/LINESeedSans_Bd.otf \
	fonts/src/LINESeedSans_He.otf \
	fonts/src/LINESeedSans_Rg.otf \
	fonts/src/LINESeedSans_Th.otf \
	fonts/src/LINESeedSans_XBd.otf \
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
split-fonts: source-fonts node_modules
	@rm -rf fonts/dist/*
	tools/create_subset_ttfs

.PHONY: clean
clean:
	rm -rf \
		fonts/dist/* \
		fonts/src/BIZUD* \
		fonts/src/IBMPlexSans* \
		fonts/src/LINESeed* \
		fonts/src/Mplus*

.PHONY: source-fonts
source-fonts: $(SOURCE_FONT_FILES)

fonts/src/BIZUDGothic%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-gothic/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDPGothic%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-gothic/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDMincho%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-mincho/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/BIZUDPMincho%.ttf:
	curl -fsSL -o $@ 'https://github.com/googlefonts/morisawa-biz-ud-mincho/raw/main/fonts/ttf/$(notdir $@)'

fonts/src/FORMUDPGothic-%.ttf:
	curl -fsSL -o $@ 'https://github.com/jz5/FORM-UDPGothic/raw/refs/heads/main/release/$(notdir $@)'

fonts/src/IBMPlexSansJP-%.ttf:
	curl -fsSL -o $@ 'https://github.com/IBM/plex/raw/refs/heads/master/packages/plex-sans-jp/fonts/complete/ttf/unhinted/$(notdir $@)'

fonts/src/LINESeedJP_OTF_%.otf: fonts/src/LINE_Seed_Sans_JP.zip
	@rm -f $@
	cd $(dir $<) && unzip -j $(notdir $<) */Desktop/OTF/$(notdir $@)
	@touch $@

fonts/src/LINESeedSans_%.otf: fonts/src/LINE_Seed_Sans_EN.zip
	@rm -f $@
	cd $(dir $<) && unzip -j $(notdir $<) */Desktop/OTF/$(notdir $@)

fonts/src/LINE_Seed_Sans_JP.zip:
	curl -fsSL -o $@ 'https://seed.line.me/src/images/fonts/LINE_Seed_Sans_JP.zip'

fonts/src/LINE_Seed_Sans_EN.zip:
	curl -fsSL -o $@ 'https://seed.line.me/src/images/fonts/LINE_Seed_Sans_EN.zip'

fonts/src/Mplus%.otf:
	curl -fsSL -o $@ 'https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/otf/$(notdir $@)'

fonts/src/Mplus%.ttf:
	curl -fsSL -o $@ 'https://github.com/coz-m/MPLUS_FONTS/raw/master/fonts/ttf/$(notdir $@)'

node_modules: package-lock.json
	npm clean-install
	@touch $@
