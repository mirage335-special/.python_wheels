

_get-specific_msw_python_wheels() {
	_messageNormal 'get: msw: '"$3" >/dev/null >&2

	# ATTENTION: Add additional python versions as appropriate, as desired, etc.
	local currentVersion_minor
	for currentVersion_minor in $(seq 1 13)
	do
		_messagePlain_probe '_get-specific_nix_python_wheels: '3."$currentVersion_minor"

		"$1"pip download "$3" --platform win_amd64 --python-version 3."$currentVersion_minor" --no-deps --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2
		"$1"pip download "$3" --platform win32 --python-version 3."$currentVersion_minor" --no-deps --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2
		"$1"pip download "$3" --platform win_arm64 --python-version 3."$currentVersion_minor" --no-deps --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2

		"$1"pip download "$3" --platform win_amd64 --python-version 3."$currentVersion_minor" --only-binary=:all: --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2
		"$1"pip download "$3" --platform win32 --python-version 3."$currentVersion_minor" --only-binary=:all: --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2
		"$1"pip download "$3" --platform win_arm64 --python-version 3."$currentVersion_minor" --only-binary=:all: --dest "$lib_dir_msw_python_wheels_relevant" > /dev/null >&2
	done
}

_get_msw_python_wheels() {
	_get-specific_msw_python_wheels "$1" "$2" pyreadline3
	_get-specific_msw_python_wheels "$1" "$2" colorama
}


true
