# Build PDF
mkdir -p ./out
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=./out ./src/resume.tex
cd ./out || exit

# Clean up build files
find ./* ! -name "resume.pdf" -delete

# Build Preview Images
pdftoppm resume.pdf preview -png

# Setup index.html
cp ../index.html .

# Clear GitHub image cache
IMAGES=$(
  curl -s "https://github.com/sujaldev/resume/blob/main/README.md" | grep --color=never -Poi "https:\/\/camo[^\"]*"
)

for IMAGE in $IMAGES; do
  curl -X PURGE "$IMAGE"
done
