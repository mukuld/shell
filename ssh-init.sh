#! /bin/bash

KERB_ICON="🐶🐶🐶"
MID_ICON="  🎡   "
GOOD_ICON="✅"
DEAD_ICON="☠"
AGENT_ICON="🕵️"
RESTART_ICON="♻"
EXPIRED_ICON="⛔"

FORMAT_START_GOOD="\e[48;5;119;90m"
FORMAT_START_BAD="\e[38;5;226;48;5;196m"
FORMAT_START_TITLE="\e[1;4m"
FORMAT_START_INFO="\e[1;4m"
FORMAT_END="\e[0m"

# FORMAT_START_GOOD=""
# FORMAT_START_BAD=""
# FORMAT_START_INFO=""
# FORMAT_END=""

# Request weekly expiration with 30 day renewal, although the
# server only gives out 10 hour expiration with 7 day renewal.
function kinit_renew() {
  echo "$KERB_ICON $RESTART_ICON"
  printf "$FORMAT_START_GOOD renewing kinit $FORMAT_END\n" ; kinit -f -l 7d -r 30d;
}
#
# Run ssh agent when it does not exist
function run_ssh_agent() {
  #if ps -p $SSH_AGENT_PID > /dev/null
  #then
  #  echo "$AGENT_ICON $GOOD_ICON"
  #  echo "ssh-agent is already running - kill it"
    # Do something knowing the pid exists, i.e. the process with $PID is running
  #fi
  printf "$FORMAT_START_INFO $AGENT_ICON  Killing SSH agent and re-adding identities$FORMAT_END\n" killall ssh-agent
  printf "$FORMAT_START_INFO $AGENT_ICON  $DEAD_ICON  $FORMAT_END\n"

  eval `ssh-agent -s`
  printf "$FORMAT_START_GOOD $AGENT_ICON  $GOOD_ICON  $FORMAT_END\n"
}

function does_pub_cert_exist() {
  SSH_CERT=~/.ssh/id_rsa-cert.pub
  if (! test -f "$SSH_CERT"); then
    return 0
  elif (test "`find ~/.ssh/id_rsa-cert.pub -mmin +1220`"); then
        return 0
  fi

  return 1
}

function is_key_gone() {
  if (($(mwinit -l | wc -l) == 0)); then
        return 0
  fi

  return 1
}

function is_midway_expired() {
  if ((does_pub_cert_exist) || (is_key_gone)); then
        return 0
  fi

  return 1
}

#
# mwinit_validate
function mwinit_validate() {
  if (is_midway_expired = 0);  then
    printf "$FORMAT_START_INFO $MID_ICON $EXPIRED_ICON  Midway expired. re-authenticate.$FORMAT_END\n"
    if mwinit ; then
      run_ssh_agent
      ssh-add -D ~/.ssh/*_rsa
      ssh-add ~/.ssh/*_rsa
    else
      printf "$FORMAT_START_BAD $MID_ICON $FAIL_ICON  Failed to authenticate.          $FORMAT_END\n"
    fi
  else
      printf "$FORMAT_START_GOOD $MID_ICON $GOOD_ICON  Midway Authenticated            $FORMAT_END\n"
  fi
}

function kinit_validate() {
  klist -a | grep -i renew > /dev/null

  #
  # run kinit_renew when logging in if no kerberos ticket
  if ! klist -s; then kinit_renew;else printf "$FORMAT_START_GOOD $KERB_ICON  $GOOD_ICON  Kerberos authenticated            $FORMAT_END\n" ; fi
}

printf "\n $FORMAT_START_TITLE  Amazon Network Authentication Status    $FORMAT_END\n\n"

printf " $KERB_ICON  checking for Kerberos status $FORMAT_END\n"
kinit_validate
echo ""

printf " $MID_ICON checking for Midway authentication $FORMAT_END\n"
mwinit_validate
echo ""
