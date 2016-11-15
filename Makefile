all:
	dub build --parallel

release:
	dub build --build=release --parallel --force

release5:
	dub build --build=release --parallel --compiler=gdc-5 --force

