CONFIGURE = python3 configure.py

.PHONY: release debug

release:
	$(CONFIGURE) -b build release
	@cp libbitwuzla.mri build/libbitwuzla.mri
	@cp Makefile.in build/Makefile
	$(MAKE) -C build

debug:
	$(CONFIGURE) -b debug --no-testing debugoptimized
	@cp libbitwuzla.mri debug/libbitwuzla.mri
	@cp Makefile.in debug/Makefile
	$(MAKE) -C debug
