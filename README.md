# fts-gfal-davix

0. Dowload the dockerfile

1. Build the image

```
docker image build -t dfg-test .
```

2.

```
docker container run --name dfg-test -it dfg-test /bin/bash
```

3. Install davix
   `According to commented instructions in the dockerfile`

4. Verify if `davix-copy` library got installed, visible as `(libdavix_copy.so.0.7.6)` on running below command

```
ls /usr/lib64/libdavix*
```
