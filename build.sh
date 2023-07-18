create_deployment "https://resume.sujal.dev"
update_deployment in_progress

# Build PDF
mkdir -p ./build/resume
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=./build/resume ./src/resume.tex
cd ./build/resume || exit

# Clean up build files
find ./* ! -name "resume.pdf" -delete

# Build Preview Images
pdftoppm resume.pdf preview -png

# Clear GitHub image cache
IMAGES=$(
  curl -s "https://github.com/sujaldev/resume/blob/main/README.md" | grep --color=never -Poi "https:\/\/camo[^\"]*"
)

clear_image_cache
update_deployment success
