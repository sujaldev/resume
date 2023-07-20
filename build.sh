create_deployment
update_deployment in_progress "https://resume.sujal.dev"

# Build PDF
mkdir -p ./build/resume
pdflatex -interaction=nonstopmode -output-format=pdf -output-directory=./build/resume ./src/resume.tex
cd ./build/resume || exit

# Clean up build files
find ./* ! -name "resume.pdf" -delete

# Build Preview Images
pdftoppm resume.pdf preview -png

clear_image_cache
update_deployment success
