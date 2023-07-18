# Build PDF
mkdir -p ./build
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=./build ./src/resume.tex
cd ./build || exit

# Clean up build files
find ./* ! -name "resume.pdf" -delete

# Build Preview Images
pdftoppm resume.pdf preview -png

# Clear GitHub image cache
IMAGES=$(
  curl -s "https://github.com/sujaldev/resume/blob/main/README.md" | grep --color=never -Poi "https:\/\/camo[^\"]*"
)

for IMAGE in $IMAGES; do
  curl -X PURGE "${IMAGE::-1}"
done
