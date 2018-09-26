for s in 4096 16384
do
    ((s=s*1024))
    echo $s
    sudo rados bench -p scbench 10 write --no-cleanup -b $s >> write-output.txt
    sudo rados bench -p scbench 10 seq >> seq-output.txt
    sudo echo 3 | sudo tee /proc/sys/vm/drop_caches && sudo sync
    sudo rados bench -p scbench 10 rand >> rand-output.txt
    sudo rados -p scbench cleanup
done
