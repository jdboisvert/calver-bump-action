#!/bin/sh -l
cd $GITHUB_WORKSPACE

git config --global user.name "CalVer Version Bump Bot"
git config --global user.email "actions@github.com"
git config --global --add safe.directory /github/workspace

git checkout -b temp_bump_version  # Create a temp branch for version bump for safety

# Get today's tag prefix and existing tags for today
TODAYS_TAG_PREFIX=$(date +"%y.%-m.%-d")
TODAYS_TAGS=$(git tag | grep ^$TODAYS_TAG_PREFIX)

# Logic to determine new tag
if [ -z "$TODAYS_TAGS" ]; then
    NEW_TAG="$TODAYS_TAG_PREFIX.0"
else
    LATEST_INC=$(echo "$TODAYS_TAGS" | sort -t. -k4,4n | tail -n1 | cut -d'.' -f4)
    NEW_INC=$((LATEST_INC + 1))
    NEW_TAG="$TODAYS_TAG_PREFIX.$NEW_INC"
fi

# Check if tag is already exisrs and exit if so 
if git rev-parse $NEW_TAG >/dev/null 2>&1; then
    echo "Tag already exists. Exiting..."
    exit 0
fi

# Update or create the VERSION file with the new tag number
echo $NEW_TAG > VERSION

git add VERSION
git commit -m "Bump version to $NEW_TAG"

git status

# Create new tag and push commit and tag
git tag $NEW_TAG
git push origin $NEW_TAG