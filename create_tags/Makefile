# ----------------------------------------------------
#  tagを生成する
# ----------------------------------------------------

# 言語
# see also `ctags --list-languages`
lang := PHP    \
		Ruby   \
		Python \
		JavaScript \
		Perl

lower_lang := $(shell echo $(lang) | tr A-Z a-z)

TARGET_PATH  = $(PWD)  # ここは基本的に書き換える
git_toplevel = $(shell cd $(TARGET_PATH);git rev-parse --show-toplevel 2>/dev/null)
seq = $(shell seq 1 $(words $(lang)))

ifeq ($(git_toplevel),)
	# gitリポジトリ管理ではない場合
	tags_save_dir = $(realpath $(TARGET_PATH))/.tags
	tags_target_dir = $(realpath $(TARGET_PATH))
else
	# gitリポジトリ管理である場合
	tags_save_dir = $(HOME)/.tags/$(shell basename $(git_toplevel))
	tags_target_dir = $(git_toplevel)
endif

.PHONY: create_tags $(seq)

create_tags: $(seq)

$(seq):
	mkdir -p $(tags_save_dir)
	ctags -R \
		--languages=$(word $@,$(lang)) \
		-f $(tags_save_dir)/$(word $@,$(lower_lang))_tags $(tags_target_dir)
