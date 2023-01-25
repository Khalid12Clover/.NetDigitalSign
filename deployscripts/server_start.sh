#!/usr/bin/env bash
cd /var/www
dotnet publish -c Release -r linux-x64 --self-contained=true -p:PublishSingleFile=true -p:GenerateRuntimeConfigurationFiles=true -o artifacts
sudo systemctl stop dnsserver.service
sudo systemctl start dnsserver.service
