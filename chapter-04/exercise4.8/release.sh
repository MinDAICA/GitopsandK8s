#!/bin/bash
# release.sh - Bật/tắt Dark Mode feature flag

RELEASE_DATE="2026-08-01"
CURRENT_DATE=$(date +%Y-%m-%d)

echo "📅 Current date: $CURRENT_DATE"
echo "📅 Release date: $RELEASE_DATE"

if [ "$CURRENT_DATE" == "$RELEASE_DATE" ]; then
    echo "🎉 Release date reached! Enabling Dark Mode..."
    kubectl patch configmap guestbook-config -p '{"data":{"DARK_MODE_ENABLED":"true"}}'
    echo "🔄 Restarting deployment..."
    kubectl rollout restart deployment/guestbook
    kubectl rollout status deployment/guestbook
    echo "✅ Dark Mode is now ENABLED!"
else
    echo "⏳ Not yet release date. Dark Mode is OFF."
    echo "   To test: kubectl patch configmap guestbook-config -p '{\"data\":{\"DARK_MODE_ENABLED\":\"true\"}}'"
fi
