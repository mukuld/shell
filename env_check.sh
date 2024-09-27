#/bin/bash
#Script to determine the OS
echo $OSTYPE
export env
env_check ()
{
  env=`uname -s`
  if [ $env = "Darwin" ]
  then return 1
  elif [ $env = "Linux" ]
  then return 2
  else return 0
  fi
}
env_check
   if [ "$env" = "Darwin" ]
   then 
       echo "You have a Mac"
   elif [ "$env" = "Linux" ]; then
       echo "You have Linux"
   else
   echo "You don't have a Mac"
   fi
