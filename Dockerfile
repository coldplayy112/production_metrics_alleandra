FROM jupyter/base-notebook

WORKDIR /home/allen/work

COPY test_synapsis_alleandra.ipynb .

RUN pip install \
    requests \
    pandas \
    mysql-connector-python \
    prettytable \
    matplotlib \
    --no-cache-dir

EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

