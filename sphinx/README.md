# Sphinx Generator

Create your sphinx project as described in http://sphinx-doc.org/ 

To work with the image, create an alias:
```bash
alias sphinx="docker run -u `id -u`:`id -g` -it --rm -v `pwd`:/doc ulrichschreiner/sphinx"
```

After that change to your projects directory and call
```
sphinx sphinx-quickstart
sphinx make latexpdf
```

to create a pdf. Use other targets as you want.
