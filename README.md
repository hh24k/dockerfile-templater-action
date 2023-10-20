# dockerfile-templater-action
This is a GitHub Action building around [docker-templater](https://github.com/bossm8/dockerfile-templater/).
# Usage
To use this action in your workflow, add something like the following step to your workflow file:
```yaml
   - name: Generate dockerfiles using dockerfile-templater
     uses: hh24k/dockerfile-templater-action@v0.2
     with:
      dockerfile_tpl: Dockerfile.tpl
      variants_def: variants.yml.tpl
      dockerfile_tpl_dir: includes
      out_dir: dockerfiles
```
## Inputs
### Required
* **dockerfile_tpl** - Template file for the Dockerfile to be generated. 
* **variants_def** - File defines the Dockerfile variants.
### Optional
* **variants_cfg** - Variants configuration file. 
* **dockerfile_tpl_dir** - Directory containing the includable template definitions 
* **dockerfile_var** - Key=Value pairs of additional variables/variable overrides which should be available when rendendering the Dockerfile template. 
* **out_dir** - Directory to write generated Dockerfiles to (default "dockerfiles")

Check the [action.yml](action.yml) for the details.
# Example
Check the [test.yaml](.github/workflows/test.yaml) to get an idea.    
# License
The code and documentation in this project are released under the BSD 3-Clause License - see the [LICENSE](LICENSE)
for the details.