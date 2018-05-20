#!/usr/bin/env sh

echo "Decrypting google-services.json..."
openssl aes-256-cbc -K $encrypted_aff1b2d8f811_key -iv $encrypted_aff1b2d8f811_iv -in google-services.json.enc -out android/app/google-services.json -d

echo "Decrypting GoogleService-Info.plist..."
openssl aes-256-cbc -K $encrypted_aff1b2d8f811_key -iv $encrypted_aff1b2d8f811_iv \
  -in travis-ci/GoogleService-Info.plist.enc \
  -out ios/GoogleService-Info.plist -d

echo "Decrypting bitbucket ssh key..."
openssl aes-256-cbc -K $encrypted_84b6efd66213_key -iv $encrypted_84b6efd66213_iv \
  -in travis-ci/bitbucket_key.enc \
  -out bitbucket_key -d

eval "$(ssh-agent)"
chmod 600 bitbucket_key
ssh-add bitbucket_key
