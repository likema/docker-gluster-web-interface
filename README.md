# docker-gluster-web-interface

[gluster-web-interface](https://github.com/oss2016summer/gluster-web-interface) is Web UI to manage GlusterFS.

## Pull the image to local

```bash
docker pull like/gluster-web-interface
```

## Run the instance to expose port 3000

```bash
docker run -it -p 3000:3000 like/gluster-web-interface
```

Please open http://&lt;ip address&gt;:3000/ by browser to access gluster-web-interface.
