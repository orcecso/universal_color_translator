# Makefile for universal_color_translator

# Clean Flutter project and fetch dependencies
clean:
	flutter clean
	flutter pub get
	cd ios && pod update && cd ..
