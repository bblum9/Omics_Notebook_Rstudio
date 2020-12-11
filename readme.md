# Docker container for Rstudio

### 1. build docker container
#### change name for project

`docker build -t 'rstudio_on' .`
Or pull from docker hub.

### 2. Run docker for RStudio
#### change container name based on project
#### change volumes based on install

```
echo Running rstudio on localhost:8787  
docker run --rm -it \
  -p 8787:8787 \
  -e PASSWORD=yourpasswordhere \
  -v ${PWD}:/home/rstudio:rw \
  -v /PATH/TO/OMICS NOTEBOOK:/home:rw \
  -v /PATH/TO/DATA ANALYSIS DIR:/data:rw \
  rstudio_on
```

### 3. Open in browser
```
echo Launching browser                                                   
open http://localhost:8787
```