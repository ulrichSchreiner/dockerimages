# Sphinx Generator

Create your sphinx project as described in http://sphinx-doc.org/ 

After that change to your projects directory and call
```
docker run --rm -it -v `pwd`:/doc ulrichschreiner/sphinx make latexpdf
```

to create a pdf. Use other targets as you want.
