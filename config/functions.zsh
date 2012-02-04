load_rvm(){
  echo "loading RVM into session...."
  [[ -s "/Users/mateuszzawisza/.rvm/scripts/rvm" ]] && source "/Users/mateuszzawisza/.rvm/scripts/rvm"
  echo "done!"
}

if [[ $LOAD_RVM == "1" ]]; then
  load_rvm
fi

load_ohmyzsh(){
  echo "loading Oh My Zshell into session...."
  [[ -s "/Users/mateuszzawisza/.zshrc_ohmyzsh" ]] && source "/Users/mateuszzawisza/.zshrc_ohmyzsh"
  echo "done!"
}


# load auto scaling environment
function as(){
  local source_file; source_file=()
  local secure_bucket; secure_bucket=()
  if [[ $1 == "vzaar" ]]; then
    source_file=("/Volumes/vzaar/aws_admin_account/export_env_variables")
    secure_bucket=("/Users/mateuszzawisza/Dropbox/vzaar/vzaar.dmg ")
  elif [[ $1 == "vzaar_adrian" ]]; then
    source_file=("/Volumes/vzaar/aws_adrian_account/export_env_variables")
    secure_bucket=("/Users/mateuszzawisza/Dropbox/vzaar/vzaar.dmg ")
  elif [[ $1 == "dh" ]]; then
    source_file=("/Volumes/dateharvard/aws/export_env_variables")
    secure_bucket=("/Users/mateuszzawisza/Dropbox/dateharvard/dateharvard.dmg")
  else
    echo "bad argument!"
    return -1
  fi

  cd /Users/mateuszzawisza/Dropbox/vzaar/ec2_tools/AutoScaling-1.0.39.0/bin
  source ${source_file}
  echo "\n\n\n"
  echo "************************************************************"
  echo "loaded $1 environment"
  echo "************************************************************\n"
}

_as() { compadd 'vzaar'; }
compdef _as as

# load auto scaling environment
function rds(){
  local source_file; source_file=()
  if [[ $1 == "dh" ]]; then
    source_file=("/Volumes/dateharvard/aws/export_env_variables")
  elif [[ $1 == "vzaar" ]]; then
    source_file=("/Volumes/vzaar/aws_admin_account/export_env_variables")
  else
    echo "bad argument!"
    return -1
  fi

  cd /Users/mateuszzawisza/Dropbox/vzaar/ec2_tools/RDSCli-1.3.003/bin 
  source ${source_file}
  echo "\n\n\n"
  echo "************************************************************"
  echo "loaded $1 environment"
  echo "************************************************************\n"
}

# load chef environment

function chef_env(){
  local knife_rb; knife_rb=($HOME/.chef/knife.rb)
  if [[ -L ${knife_rb} ]]; then
    rm ${knife_rb}
  fi

  local configs_path; configs_path=($HOME/.chef/environments/configs)
  local config_file_path; config_file_path=()
  case $1 in
    'vzaar')
      config_file_path=(${configs_path}/vzaar_knife.rb)
      ;;
    'dh')
      config_file_path=(${configs_path}/dateharvard_knife.rb)
      ;;
    'playground')
      config_file_path=(${configs_path}/playground_knife.rb)
      ;;
    *)
      echo "Unknown Knife Config!"
      return -1
      ;;
  esac

  echo "Loaded Knife file: ${config_file_path}"
  ln -s ${config_file_path} ${knife_rb}


}
_chef_env() { compadd 'vzaar' 'playground'; }
compdef _chef_env chef_env
