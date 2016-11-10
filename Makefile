all:
	dub build --parallel

release:
	dub build --build=release --parallel

release5:
	dub build --build=release --parallel --compiler=gdc-5

