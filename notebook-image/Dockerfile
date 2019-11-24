FROM gcr.io/kubeflow-images-public/tensorflow-1.14.0-notebook-cpu:v0.7.0

USER root

RUN echo "${NB_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/notebook

RUN pip3 --no-cache-dir install jupyterlab==1.1.1
RUN pip3 install kfp --upgrade
RUN pip3 install git+https://github.com/chanwit/kale

RUN jupyter labextension install kubeflow-kale-launcher

RUN  mkdir /home/jovyan/{.local,.jupyter}
RUN  chown -R jovyan:1000 /home/jovyan

USER jovyan

CMD ["sh","-c", "jupyter lab --notebook-dir=/home/${NB_USER} --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
