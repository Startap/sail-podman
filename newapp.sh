podman info > /dev/null 2>&1

# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Podman is not running."

    exit 1
fi

APP_NAME=$1

podman run --rm \
    --pull=always \
    -v "$(pwd)":/opt:z \
    -w /opt \
    laravelsail/php83-composer:latest \
    bash -c "laravel new $APP_NAME --no-interaction && cd $APP_NAME && php ./artisan sail:install --with=mysql,redis,meilisearch,mailpit,selenium "

cd $APP_NAME

# Allow build with no additional services..
if [ "mysql redis meilisearch mailpit selenium" == "none" ]; then
    ./vendor/bin/sail build
else
    ./vendor/bin/sail pull mysql redis meilisearch mailpit selenium
    ./vendor/bin/sail build
fi

CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
BOLD='\033[1m'
NC='\033[0m'

echo ""

if sudo -n true 2>/dev/null; then
    sudo chown -R $USER: .
    echo -e "${BOLD}Get started with:${NC} cd $APP_NAME && ./vendor/bin/sail up"
else
    echo -e "${BOLD}Please provide your password so we can make some final adjustments to your application's permissions.${NC}"
    echo ""
    sudo chown -R $USER: .
    echo ""
    echo -e "${BOLD}Thank you! We hope you build something incredible. Dive in with:${NC} cd $APP_NAME && ./vendor/bin/sail up"
fi
