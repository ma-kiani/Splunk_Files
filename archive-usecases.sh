#!/usr/bin/env bash
set -e

APPS="/opt/splunk/etc/apps"
BACKUP=$(mktemp -d /tmp/splunk-apps.XXXXXX)

for APP in DA-ESS-ContentUpdate SplunkEnterpriseSecuritySuite search; do
    mkdir -p "$BACKUP/$APP"
    cp -a "$APPS/$APP/local" "$BACKUP/$APP/"
done

cp -a "$APPS/soorinapp" "$BACKUP/"

tar -czf "$BACKUP.tgz" -C /tmp "$(basename "$BACKUP")"

echo "Backup: $BACKUP.tgz"
