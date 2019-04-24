#!/usr/bin/env bash

for i in $( cat users.txt ); do
    user="$(cut -d ':' -f1 <<<"$i")"
    pass="$(cut -d ':' -f2 <<<"$i")"

    useradd -s /bin/bash $user
    mkhomedir_helper $user
    echo $user:$pass | chpasswd
    echo "cd /home/$user" >> /home/$user/.bashrc
    
    ### INFO ###
    echo "User $user added successfully!"
    echo "Password $pass for user $user changed successfully"
done 

rm -rf users.txt
