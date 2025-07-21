# Written by etachott

SOURCES=/sources
MAKEFLAGS="-j 12"
RECIPE_DIR="/ft_linux/recipes/system"

# Recipe installation loop

for recipe in "$RECIPE_DIR"/*.sh; do
	source "$recipe"

	if is_installed; then echo ">> Package $(basename "$recipe") already installed!"
		continue
	fi

	echo
	echo "============================================================"
	echo "  Building: $(basename "$recipe")"
	echo "============================================================"
	echo

	echo ">> Extracting package..."
	tar -xf "$SOURCES/$RECIPE_TAR" -C $SOURCES

	echo ">> Building package $RECIPE_NAME..."
	cd "$SOURCES/$RECIPE_NAME"
	build

	echo ">> Cleaning up dir..."
	cd "$SOURCES"
	rm -rf "$SOURCES/$RECIPE_NAME"

	echo 
	echo "============================================================"
	echo "  Finished: $(basename "$recipe")"
	echo "============================================================"
done


echo
echo "System packages compiled and installed successfully!"
