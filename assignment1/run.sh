for t in $(seq 1 1 30)
do
    sudo ceph osd df
    sleep 1
done
