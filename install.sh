#!/usr/bin/env bash

installPrefix=$HOME/.local

__stepName="Installing...";
__currentStep=0;
__totalSteps=14;
__barlength=50; # 50 chars for processbar. Most terminals are 80 chars width
__fillChar='█';
__emptyChar=' ';

function update()
{
  # Clear the previous line.
  echo -ne "                                                                                \r"

  __currentStep=$((__currentStep+1));

  # Calculate the percentage we are on.
  local p=$(echo "scale=1; $__currentStep/$__totalSteps * 100" | bc -l);
  p=${p%.*}

  # Display the stepname and the beginning of the process bar.
  echo -ne "$__stepName: ${p}% |"
  local i=0;

  # How many blocks out of __barlength do we need to fill ?
  local fillTo=$(echo "($p/100)*$__barlength" | bc -l);
  fillTo=${fillTo%.*};

  while [[ $i != "$__barlength" ]]
  do
    if [ $i -lt $fillTo ] ; then
      echo -ne "$__fillChar";
    else
      echo -ne "$__emptyChar";
    fi
    i=$((i+1));
  done

  echo -ne "| ${__currentStep}/${__totalSteps} \r"

  sleep 0.01 # Not required but I want to see the animation; and so do you!
}

# Permissions
chmod +x ./golemsp
chmod +x ./ya-provider
chmod +x ./yagna
chmod +x ./gftp
chmod +x ./plugins/ya-runtime-wasi
chmod +x ./plugins/ya-runtime-vm-aarch64-host/ya-runtime-vm-aarch64-host

mkdir -p $installPrefix/bin && update
mkdir -p $installPrefix/lib/yagna && update

cp -r plugins $installPrefix/lib/yagna && update

# exe-unit can be a symbolic link.
rm $installPrefix/lib/yagna/plugins/exe-unit && update

# ya-runtime-wasi can be a symbolic link.
rm $installPrefix/lib/yagna/plugins/ya-runtime-wasi && update

# Note: We dont delete ya-runtime-vm-aarch64-host; the application uses some logic
# to find the executing directory; and if we made it an symbolic link, it
# will return the value of the repository; and cant find the runtime; and crash
#
# We can use symlinks for everything else, except for ya-runtime-aarch64-host.

# KVM Permissions: 
# sudo adduser $(whoami) kvm
# sudo chown $(whoami) /dev/kvm

# Binaries
ln -sf $PWD/golemsp $installPrefix/bin/golemsp && update
ln -sf $PWD/ya-provider $installPrefix/bin/ya-provider && update
ln -sf $PWD/yagna $installPrefix/bin/yagna && update
ln -sf $PWD/gftp $installPrefix/bin/gftp && update
ln -sf $PWD/libgftp.rlib $installPrefix/bin/libgftp.rlib && update
ln -sf $PWD/libya_exe_unit.rlib $installPrefix/bin/libya_exe_unit.rlib && update
ln -sf $PWD/libya_provider.rlib $installPrefix/bin/libya_provider.rlib && update

# plugins
ln -sf $PWD/exe-unit $installPrefix/lib/yagna/plugins/exe-unit && update
ln -sf $PWD/plugins/ya-runtime-wasi $installPrefix/lib/yagna/plugins/ya-runtime-wasi && update

# Include this in your ~/.bashrc to make it persistent
export PATH=$PATH:/home/ms/.local/bin

__stepName="Done" && update
echo ""

echo ""
echo "Make sure you have libpixman-1-dev installed. If not: "
echo "$ sudo apt-get install libpixman-1-dev"
echo ""
echo "The current user: $(whoami) requires to be able to access the KVM."
echo "$ sudo adduser $(whoami) kvm"
echo "$ sudo chown $(whoami) /dev/kvm"
echo ""
