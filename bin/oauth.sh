# Check your GMail using the provided Atom feed
# Assumes your GMail is your primary email address for the current user
# Also assumes that you've stored the password for your Google account in the keychain
# You know what happens when you assume... makes an ass out of you and Uma Thurman
gmail() {
  user=theunilife@gmail.com
  echo $user
  pass=$(security find-internet-password -w -a "$user" -s "accounts.google.com")
  
  curl -u "$user:$pass" "https://mail.google.com/mail/feed/atom"| perl -ne '
    print "Subject: $1 " if /<title>(.+?)<\/title>/ && $title++;
    print "(from $1)\n" if /<email>(.+?)<\/email>/;
  '
}
# version of above using rsstail (brew install rsstail) for a constant watch
watchmail() {
  user=`dscl . -read /Users/$(whoami)|grep "EMailAddress:"|sed 's/^EMailAddress: //'`
  pass=$(security find-internet-password -w -a "$user" -s "accounts.google.com")
  rsstail -a -t -A "$user:$pass" -u "https://mail.google.com/mail/feed/atom"
}

gmail