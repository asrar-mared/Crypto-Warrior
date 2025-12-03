#!/bin/bash

#═══════════════════════════════════════════════════════════════════
#  ⚔️💎 CRYPTO WARRIOR - THE ULTIMATE BLOCKCHAIN WALLET 💎⚔️
#═══════════════════════════════════════════════════════════════════
#  🔐 Advanced Encryption & Security System
#  ⛓️ Multi-Currency Blockchain Management
#  🛡️ Military-Grade Protection
#  
#  Developer: Asrar Mared (asrar-mared)
#  Email: nike49424@zohomail.com
#  Domain: nike49424.ETH
#  Website: https://gravatar.com/nike49424
#  GitHub: https://github.com/asrar-mared
#  
#  Version: 4.0.0 "Digital Warrior Edition"
#  License: MIT
#  Created: 2025
#═══════════════════════════════════════════════════════════════════

# 🎨 الألوان والرموز
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m'

# ⚔️ رموز Crypto Warrior
WARRIOR="⚔️"
SHIELD="🛡️"
DIAMOND="💎"
CROWN="👑"
LOCK="🔒"
KEY="🔑"
FIRE="🔥"
ROCKET="🚀"
SWORD="⚡"
STAR="⭐"
CHECK="✅"
CROSS="❌"
WARNING="⚠️"

# 📁 إعدادات التطبيق
APP_NAME="Crypto Warrior"
APP_VERSION="4.0.0"
APP_CODENAME="Digital Warrior"
DEVELOPER="Asrar Mared"
DEVELOPER_EMAIL="nike49424@zohomail.com"
DEVELOPER_DOMAIN="nike49424.ETH"
DEVELOPER_WEBSITE="https://gravatar.com/nike49424"
GITHUB_REPO="https://github.com/asrar-mared/crypto-warrior"

# 📂 مسارات النظام
HOME_DIR="$HOME/.crypto_warrior"
CONFIG_DIR="$HOME_DIR/config"
WALLETS_DIR="$HOME_DIR/wallets"
KEYS_DIR="$HOME_DIR/keys"
BACKUP_DIR="$HOME_DIR/backups"
LOGS_DIR="$HOME_DIR/logs"
ENCRYPTED_DIR="$HOME_DIR/encrypted"
CACHE_DIR="$HOME_DIR/cache"

# 🔐 ملفات التشفير
MASTER_KEY_FILE="$KEYS_DIR/.master.key"
ENCRYPTION_SALT_FILE="$KEYS_DIR/.salt"
USER_CREDENTIALS_FILE="$CONFIG_DIR/.credentials.enc"
WALLET_DATABASE="$ENCRYPTED_DIR/wallets.db.enc"
TRANSACTION_LOG="$ENCRYPTED_DIR/transactions.log.enc"

# ⚙️ إعدادات التشفير
ENCRYPTION_ALGORITHM="aes-256-cbc"
HASH_ALGORITHM="sha256"
KEY_SIZE=256
SALT_SIZE=32
ITERATIONS=100000

#═══════════════════════════════════════════════════════════════════
# 🎨 واجهة العرض
#═══════════════════════════════════════════════════════════════════

print_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════════════════╗
║                                                                   ║
║    ██████╗██████╗ ██╗   ██╗██████╗ ████████╗ ██████╗            ║
║   ██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗╚══██╔══╝██╔═══██╗           ║
║   ██║     ██████╔╝ ╚████╔╝ ██████╔╝   ██║   ██║   ██║           ║
║   ██║     ██╔══██╗  ╚██╔╝  ██╔═══╝    ██║   ██║   ██║           ║
║   ╚██████╗██║  ██║   ██║   ██║        ██║   ╚██████╔╝           ║
║    ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝    ╚═════╝            ║
║                                                                   ║
║   ██╗    ██╗ █████╗ ██████╗ ██████╗ ██╗ ██████╗ ██████╗         ║
║   ██║    ██║██╔══██╗██╔══██╗██╔══██╗██║██╔═══██╗██╔══██╗        ║
║   ██║ █╗ ██║███████║██████╔╝██████╔╝██║██║   ██║██████╔╝        ║
║   ██║███╗██║██╔══██║██╔══██╗██╔══██╗██║██║   ██║██╔══██╗        ║
║   ╚███╔███╔╝██║  ██║██║  ██║██║  ██║██║╚██████╔╝██║  ██║        ║
║    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝        ║
║                                                                   ║
╚═══════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo -e "${YELLOW}${WARRIOR}${WARRIOR}${WARRIOR}  THE ULTIMATE BLOCKCHAIN WARRIOR  ${WARRIOR}${WARRIOR}${WARRIOR}${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}  ${DIAMOND} Version: ${WHITE}${APP_VERSION} \"${APP_CODENAME}\"${NC}"
    echo -e "${GREEN}  ${CROWN} Developer: ${WHITE}${DEVELOPER}${NC}"
    echo -e "${GREEN}  ${FIRE} Domain: ${WHITE}${DEVELOPER_DOMAIN}${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════════${NC}\n"
}

print_section() {
    echo -e "\n${PURPLE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}${WARRIOR} $1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════════${NC}\n"
}

print_success() {
    echo -e "${GREEN}${CHECK} $1${NC}"
}

print_error() {
    echo -e "${RED}${CROSS} $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}${WARNING} $1${NC}"
}

print_info() {
    echo -e "${CYAN}${STAR} $1${NC}"
}

#═══════════════════════════════════════════════════════════════════
# 🔧 التهيئة الأولية
#═══════════════════════════════════════════════════════════════════

initialize_system() {
    print_section "⚙️ تهيئة نظام Crypto Warrior"
    
    # إنشاء المجلدات
    local dirs=("$HOME_DIR" "$CONFIG_DIR" "$WALLETS_DIR" "$KEYS_DIR" \
                "$BACKUP_DIR" "$LOGS_DIR" "$ENCRYPTED_DIR" "$CACHE_DIR")
    
    for dir in "${dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            chmod 700 "$dir"
            print_success "تم إنشاء: $dir"
        fi
    done
    
    # إنشاء ملف التكوين الرئيسي
    if [ ! -f "$CONFIG_DIR/warrior.conf" ]; then
        cat > "$CONFIG_DIR/warrior.conf" << EOF
# Crypto Warrior Configuration File
# Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
# ═══════════════════════════════════════════════════════════

[Application]
name=$APP_NAME
version=$APP_VERSION
codename=$APP_CODENAME

[Developer]
name=$DEVELOPER
email=$DEVELOPER_EMAIL
domain=$DEVELOPER_DOMAIN
website=$DEVELOPER_WEBSITE
github=$GITHUB_REPO

[Security]
encryption=$ENCRYPTION_ALGORITHM
hash=$HASH_ALGORITHM
key_size=$KEY_SIZE
iterations=$ITERATIONS

[Features]
multi_currency=true
auto_backup=true
transaction_logging=true
market_prices=true
email_notifications=true

[Supported_Currencies]
BTC=Bitcoin
ETH=Ethereum
USDT=Tether
BNB=Binance Coin
DOGE=Dogecoin
XRP=Ripple
ADA=Cardano
SOL=Solana
DOT=Polkadot
MATIC=Polygon

[Network]
mainnet=true
testnet=false
api_timeout=30
max_retries=3

[Backup]
auto_backup_interval=daily
backup_retention_days=30
compression=gzip
encryption=true
EOF
        chmod 600 "$CONFIG_DIR/warrior.conf"
        print_success "تم إنشاء ملف التكوين"
    fi
    
    # إنشاء ملف السجلات
    local log_file="$LOGS_DIR/warrior_$(date +%Y%m%d).log"
    if [ ! -f "$log_file" ]; then
        cat > "$log_file" << EOF
═══════════════════════════════════════════════════════════════
  CRYPTO WARRIOR - SYSTEM LOG
  Started: $(date)
  Version: $APP_VERSION
  Developer: $DEVELOPER ($DEVELOPER_EMAIL)
═══════════════════════════════════════════════════════════════

EOF
        chmod 600 "$log_file"
    fi
    
    print_success "تم تهيئة النظام بنجاح!"
}

#═══════════════════════════════════════════════════════════════════
# 🔐 نظام التشفير المتقدم
#═══════════════════════════════════════════════════════════════════

generate_salt() {
    openssl rand -hex $SALT_SIZE
}

generate_master_key() {
    local password="$1"
    local salt="$2"
    
    echo -n "$password$salt" | openssl dgst -sha512 -binary | \
        openssl dgst -sha256 | awk '{print $2}'
}

create_encryption_key() {
    print_section "🔑 إنشاء مفتاح التشفير الرئيسي"
    
    if [ -f "$MASTER_KEY_FILE" ]; then
        print_warning "يوجد مفتاح تشفير مسبق"
        return
    fi
    
    print_info "مفتاح التشفير يحمي جميع بياناتك!"
    echo
    
    # طلب كلمة المرور
    while true; do
        echo -ne "${CYAN}${LOCK} أدخل كلمة مرور قوية (16+ حرف): ${NC}"
        read -s password1
        echo
        
        if [ ${#password1} -lt 16 ]; then
            print_error "كلمة المرور قصيرة جداً! (16 حرف على الأقل)"
            continue
        fi
        
        echo -ne "${CYAN}${LOCK} أعد إدخال كلمة المرور: ${NC}"
        read -s password2
        echo
        
        if [ "$password1" != "$password2" ]; then
            print_error "كلمات المرور غير متطابقة!"
            continue
        fi
        
        break
    done
    
    print_info "جاري إنشاء مفتاح التشفير..."
    
    # توليد Salt
    local salt=$(generate_salt)
    echo "$salt" > "$ENCRYPTION_SALT_FILE"
    chmod 400 "$ENCRYPTION_SALT_FILE"
    
    # توليد المفتاح الرئيسي
    local master_key=$(generate_master_key "$password1" "$salt")
    
    # حفظ المفتاح مشفراً
    echo "$master_key" | openssl enc -aes-256-cbc -a -salt \
        -pass pass:"$password1" > "$MASTER_KEY_FILE"
    chmod 400 "$MASTER_KEY_FILE"
    
    # حفظ بيانات المستخدم
    local user_data=$(cat <<EOF
{
  "email": "$DEVELOPER_EMAIL",
  "domain": "$DEVELOPER_DOMAIN",
  "website": "$DEVELOPER_WEBSITE",
  "github": "asrar-mared",
  "created": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "key_hash": "$(echo -n "$master_key" | openssl dgst -sha256 | awk '{print $2}')"
}
EOF
)
    
    echo "$user_data" | encrypt_data > "$USER_CREDENTIALS_FILE"
    
    print_success "تم إنشاء مفتاح التشفير بنجاح!"
    echo
    echo -e "${GREEN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${BOLD}           معلومات مفتاح التشفير                   ${NC}${GREEN}║${NC}"
    echo -e "${GREEN}╠════════════════════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}║${NC} ${CYAN}${KEY} خوارزمية التشفير:${NC}    AES-256-CBC"
    echo -e "${GREEN}║${NC} ${CYAN}${SHIELD} قوة المفتاح:${NC}         256-bit"
    echo -e "${GREEN}║${NC} ${CYAN}${FIRE} التكرارات:${NC}           100,000"
    echo -e "${GREEN}║${NC} ${CYAN}${STAR} مستوى الأمان:${NC}        عسكري ${SHIELD}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════╝${NC}"
    
    log_event "SECURITY" "Master encryption key created"
}

encrypt_data() {
    openssl enc -$ENCRYPTION_ALGORITHM -a -salt -pbkdf2 \
        -iter $ITERATIONS -pass file:"$MASTER_KEY_FILE" 2>/dev/null
}

decrypt_data() {
    openssl enc -d -$ENCRYPTION_ALGORITHM -a -pbkdf2 \
        -iter $ITERATIONS -pass file:"$MASTER_KEY_FILE" 2>/dev/null
}

encrypt_file() {
    local input_file="$1"
    local output_file="$2"
    
    if [ ! -f "$input_file" ]; then
        print_error "ملف غير موجود: $input_file"
        return 1
    fi
    
    cat "$input_file" | encrypt_data > "$output_file"
    
    if [ $? -eq 0 ]; then
        print_success "تم تشفير الملف: $(basename "$output_file")"
        return 0
    else
        print_error "فشل تشفير الملف"
        return 1
    fi
}

decrypt_file() {
    local input_file="$1"
    local output_file="$2"
    
    if [ ! -f "$input_file" ]; then
        print_error "ملف مشفر غير موجود: $input_file"
        return 1
    fi
    
    cat "$input_file" | decrypt_data > "$output_file"
    
    if [ $? -eq 0 ]; then
        print_success "تم فك تشفير الملف: $(basename "$output_file")"
        return 0
    else
        print_error "فشل فك التشفير - كلمة مرور خاطئة؟"
        return 1
    fi
}

#═══════════════════════════════════════════════════════════════════
# 📝 نظام السجلات
#═══════════════════════════════════════════════════════════════════

log_event() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local log_file="$LOGS_DIR/warrior_$(date +%Y%m%d).log"
    
    echo "[$timestamp] [$level] $message" >> "$log_file"
}

#═══════════════════════════════════════════════════════════════════
# 💰 إدارة المحافظ
#═══════════════════════════════════════════════════════════════════

generate_ethereum_address() {
    # توليد مفتاح خاص عشوائي
    local private_key=$(openssl rand -hex 32)
    
    # توليد العنوان العام من المفتاح الخاص
    local public_hash=$(echo -n "$private_key" | openssl dgst -sha256 | awk '{print $2}')
    local address="0x$(echo -n "$public_hash" | cut -c1-40)"
    
    echo "$address|$private_key"
}

generate_bitcoin_address() {
    local private_key=$(openssl rand -hex 32)
    local public_hash=$(echo -n "$private_key" | openssl dgst -sha256 -binary | openssl dgst -ripemd160 | awk '{print $2}')
    local address="1$(echo -n "$public_hash" | cut -c1-33)"
    
    echo "$address|$private_key"
}

create_wallet() {
    print_section "💰 إنشاء محفظة Crypto Warrior"
    
    echo -e "${CYAN}العملات المدعومة:${NC}\n"
    echo -e "  ${YELLOW}1.${NC} Bitcoin (BTC) ₿"
    echo -e "  ${BLUE}2.${NC} Ethereum (ETH) Ξ"
    echo -e "  ${GREEN}3.${NC} Tether (USDT) ₮"
    echo -e "  ${YELLOW}4.${NC} Binance Coin (BNB) 🔶"
    echo -e "  ${YELLOW}5.${NC} Dogecoin (DOGE) Ð"
    echo -e "  ${BLUE}6.${NC} Ripple (XRP) ✕"
    echo -e "  ${BLUE}7.${NC} Cardano (ADA) ₳"
    echo -e "  ${PURPLE}8.${NC} Solana (SOL) ◎"
    echo -e "  ${PURPLE}9.${NC} Polkadot (DOT) •"
    echo -e "  ${PURPLE}10.${NC} Polygon (MATIC) ⬡"
    echo
    
    echo -ne "${CYAN}اختر العملة (1-10): ${NC}"
    read choice
    
    local coin symbol
    case "$choice" in
        1) coin="BTC"; symbol="₿" ;;
        2) coin="ETH"; symbol="Ξ" ;;
        3) coin="USDT"; symbol="₮" ;;
        4) coin="BNB"; symbol="🔶" ;;
        5) coin="DOGE"; symbol="Ð" ;;
        6) coin="XRP"; symbol="✕" ;;
        7) coin="ADA"; symbol="₳" ;;
        8) coin="SOL"; symbol="◎" ;;
        9) coin="DOT"; symbol="•" ;;
        10) coin="MATIC"; symbol="⬡" ;;
        *) print_error "خيار غير صحيح!"; return ;;
    esac
    
    echo -ne "${CYAN}اسم المحفظة: ${NC}"
    read wallet_name
    
    print_info "جاري توليد محفظة $coin..."
    
    # توليد العنوان والمفتاح
    local wallet_data
    if [ "$coin" = "ETH" ] || [ "$coin" = "USDT" ] || [ "$coin" = "MATIC" ]; then
        wallet_data=$(generate_ethereum_address)
    else
        wallet_data=$(generate_bitcoin_address)
    fi
    
    local address=$(echo "$wallet_data" | cut -d'|' -f1)
    local private_key=$(echo "$wallet_data" | cut -d'|' -f2)
    
    # بيانات المحفظة
    local wallet_json=$(cat <<EOF
{
  "name": "$wallet_name",
  "coin": "$coin",
  "symbol": "$symbol",
  "address": "$address",
  "private_key": "$private_key",
  "balance": "0.00000000",
  "created": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "created_by": "$DEVELOPER_EMAIL",
  "domain": "$DEVELOPER_DOMAIN",
  "last_transaction": null,
  "transactions_count": 0,
  "warrior_version": "$APP_VERSION"
}
EOF
)
    
    # حفظ المحفظة مشفرة
    local wallet_file="$WALLETS_DIR/${wallet_name}_${coin}.warrior"
    echo "$wallet_json" | encrypt_data > "$wallet_file"
    chmod 600 "$wallet_file"
    
    # حفظ المفتاح الخاص منفصل
    local key_file="$KEYS_DIR/${wallet_name}_${coin}.key"
    echo "$private_key" | encrypt_data > "$key_file"
    chmod 400 "$key_file"
    
    print_success "تم إنشاء المحفظة بنجاح!"
    echo
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${BOLD}              ${WARRIOR} محفظة Crypto Warrior ${WARRIOR}               ${NC}${GREEN}║${NC}"
    echo -e "${GREEN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}║${NC} ${CYAN}${DIAMOND} الاسم:${NC}           $wallet_name"
    echo -e "${GREEN}║${NC} ${CYAN}💰 العملة:${NC}          $coin $symbol"
    echo -e "${GREEN}║${NC} ${CYAN}📍 العنوان:${NC}"
    echo -e "${GREEN}║${NC}   ${YELLOW}$address${NC}"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}║${NC} ${CYAN}${CROWN} المطور:${NC}         $DEVELOPER"
    echo -e "${GREEN}║${NC} ${CYAN}📧 Email:${NC}          $DEVELOPER_EMAIL"
    echo -e "${GREEN}║${NC} ${CYAN}🌐 Domain:${NC}         $DEVELOPER_DOMAIN"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}║${NC} ${RED}${WARNING}${WARNING} احتفظ بالمفتاح الخاص في مكان آمن جداً! ${WARNING}${WARNING}${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    
    log_event "WALLET" "New wallet created: $wallet_name ($coin) - $address"
}

#═══════════════════════════════════════════════════════════════════
# 📊 معلومات النظام
#═══════════════════════════════════════════════════════════════════

show_system_info() {
    print_section "📊 معلومات نظام Crypto Warrior"
    
    local wallets_count=$(find "$WALLETS_DIR" -name "*.warrior" 2>/dev/null | wc -l)
    local backups_count=$(find "$BACKUP_DIR" -name "*.backup" 2>/dev/null | wc -l)
    local logs_count=$(find "$LOGS_DIR" -name "*.log" 2>/dev/null | wc -l)
    
    echo
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${BOLD}                     معلومات التطبيق                         ${NC}${CYAN}║${NC}"
    echo -e "${CYAN}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}${WARRIOR} الاسم:${NC}              $APP_NAME"
    echo -e "${CYAN}║${NC} ${YELLOW}🔢 الإصدار:${NC}            $APP_VERSION \"$APP_CODENAME\""
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}${CROWN} المطور:${NC}            $DEVELOPER"
    echo -e "${CYAN}║${NC} ${GREEN}📧 البريد:${NC}            $DEVELOPER_EMAIL"
    echo -e "${CYAN}║${NC} ${GREEN}🌐 النطاق:${NC}            $DEVELOPER_DOMAIN"
    echo -e "${CYAN}║${NC} ${GREEN}🔗 الموقع:${NC}            $DEVELOPER_WEBSITE"
    echo -e "${CYAN}║${NC} ${GREEN}💻 GitHub:${NC}            github.com/asrar-mared"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${BLUE}${DIAMOND} عدد المحافظ:${NC}        $wallets_count"
    echo -e "${CYAN}║${NC} ${BLUE}💾 النسخ الاحتياطية:${NC}    $backups_count"
    echo -e "${CYAN}║${NC} ${BLUE}📝 ملفات السجل:${NC}        $logs_count"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${PURPLE}${SHIELD} التشفير:${NC}           AES-256-CBC"
    echo -e "${CYAN}║${NC} ${PURPLE}${KEY} طول المفتاح:${NC}        256-bit"
    echo -e "${CYAN}║${NC} ${PURPLE}${FIRE} مستوى الأمان:${NC}       عسكري"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════════╝${NC}"
}

#═══════════════════════════════════════════════════════════════════
# 📧 نظام الإشعارات بالبريد
#═══════════════════════════════════════════════════════════════════

send_email_notification() {
    local subject="$1"
    local message="$2"
    
    # محاكاة إرسال بريد (يمكن ربطه بـ API حقيقي)
    print_info "إرسال إشعار إلى: $DEVELOPER_EMAIL"
    
    cat > "/tmp/warrior_email_$(date +%s).txt" << EOF
From: Crypto Warrior <noreply@$DEVELOPER_DOMAIN>
To: $DEVELOPER_EMAIL
Subject: $subject

$message

---
Crypto Warrior v$APP_VERSION
Developed by $DEVELOPER
$DEVELOPER_WEBSITE
EOF
    
    print_success "تم إنشاء الإشعار"
    log_event "EMAIL" "Notification: $subject"
}

#═══════════════════════════════════════════════════════════════════
# 🎯 القائمة الرئيسية
#═══════════════════════════════════════════════════════════════════

show_main_menu() {
    echo
    echo -e "${PURPLE}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${BOLD}                  ${WARRIOR} القائمة الرئيسية ${WARRIOR}                    ${NC}${PURPLE}║${NC}"
    echo -e "${PURPLE}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${PURPLE}║${NC}  ${GREEN}1.${NC}  ${DIAMOND} إنشاء محفظة جديدة"
    echo -e "${PURPLE}║${NC}  ${GREEN}2.${NC}  📋 عرض جميع المحافظ"
    echo -e "${PURPLE}║${NC}  ${GREEN}3.${NC}  🔍 تفاصيل محفظة"
    echo -e "${PURPLE}║${NC}  ${GREEN}4.${NC}  💸 إرسال معاملة"
    echo -e "${PURPLE}║${NC}  ${GREEN}5.${NC}  📊 أسعار السوق"
    echo -e "${PURPLE}║${NC}  ${GREEN}6.${NC}  📈 الإحصائيات"
    echo -e "${PURPLE}║${NC}  ${GREEN}7.${NC}  ${KEY} تشفير ملف"
    echo -e "${PURPLE}║${NC}  ${GREEN}8.${NC}  ${LOCK} فك تشفير ملف"
    echo -e "${PURPLE}║${NC}"
    echo -e "${PURPLE}║${NC}  ${BLUE}9.${NC}  💾 نسخ احتياطي"
    echo -e "${PURPLE}║${NC}  ${BLUE}10.${NC} ♻️  استعادة"
    echo -e "${PURPLE}║${NC}  ${BLUE}11.${NC} 📧 إشعار بريدي"
    echo -e "${PURPLE}║${NC}  ${BLUE}12.${NC} 📊 معلومات النظام"
    echo -e "${PURPLE}║${NC}"
    echo -e "${PURPLE}║${NC}  ${YELLOW}13.${NC} 📜 المساهمات وإخلاء المسؤولية"
    echo -e "${PURPLE}║${NC}"
    echo -e "${PURPLE}║${NC}  ${RED}0.${NC}  🚪 خروج"
    echo -e "${PURPLE}╚════════════════════════════════════════════════════════════════╝${NC}"
    echo
    echo -ne "${CYAN}${WARRIOR} اختر من القائمة: ${NC}"
}

#═══════════════════════════════════════════════════════════════════
# 📜 المساهمات وإخلاء المسؤولية
#═══════════════════════════════════════════════════════════════════

show_contributions_disclaimer() {
    print_section "📜 المساهمات وإخلاء المسؤولية"
    
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${BOLD}                  🤝 كيفية المساهمة في المشروع                ${NC}${CYAN}║${NC}"
    echo -e "${CYAN}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${GREEN}${STAR} نرحب بجميع المساهمات في تطوير Crypto Warrior!${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${YELLOW}طرق المساهمة:${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}1. ${GREEN}Fork المشروع:${NC}"
    echo -e "${CYAN}║${NC}    https://github.com/asrar-mared/crypto-warrior"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}2. ${GREEN}إنشاء Branch جديد:${NC}"
    echo -e "${CYAN}║${NC}    git checkout -b feature/amazing-feature"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}3. ${GREEN}Commit التغييرات:${NC}"
    echo -e "${CYAN}║${NC}    git commit -m '⚔️ Add amazing feature'"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}4. ${GREEN}Push إلى Branch:${NC}"
    echo -e "${CYAN}║${NC}    git push origin feature/amazing-feature"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}5. ${GREEN}فتح Pull Request${NC}"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${BLUE}${FIRE} ما نبحث عنه:${NC}"
    echo -e "${CYAN}║${NC}   • إضافة عملات رقمية جديدة"
    echo -e "${CYAN}║${NC}   • تحسينات الأمان والتشفير"
    echo -e "${CYAN}║${NC}   • واجهات مستخدم محسّنة"
    echo -e "${CYAN}║${NC}   • إصلاح الأخطاء (Bug Fixes)"
    echo -e "${CYAN}║${NC}   • تحسين التوثيق والشروحات"
    echo -e "${CYAN}║${NC}   • ترجمات للغات أخرى"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${PURPLE}${CROWN} معايير المساهمة:${NC}"
    echo -e "${CYAN}║${NC}   ✓ كود نظيف ومنظم"
    echo -e "${CYAN}║${NC}   ✓ تعليقات واضحة بالعربية/الإنجليزية"
    echo -e "${CYAN}║${NC}   ✓ اختبار شامل للميزات الجديدة"
    echo -e "${CYAN}║${NC}   ✓ توثيق كامل للتغييرات"
    echo -e "${CYAN}║${NC}   ✓ احترام معايير الأمان"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════════╝${NC}"
    
    echo
    echo -e "${RED}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║${BOLD}              ${WARNING}${WARNING} إخلاء المسؤولية ${WARNING}${WARNING}                        ${NC}${RED}║${NC}"
    echo -e "${RED}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${YELLOW}${WARNING} تحذير مهم - يرجى القراءة بعناية:${NC}"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}1. ${CYAN}الغرض التعليمي:${NC}"
    echo -e "${RED}║${NC}    هذا البرنامج مصمم لأغراض تعليمية وتطويرية فقط."
    echo -e "${RED}║${NC}    يهدف إلى فهم آليات المحافظ الرقمية والتشفير."
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}2. ${CYAN}عدم المسؤولية المالية:${NC}"
    echo -e "${RED}║${NC}    • المطور غير مسؤول عن أي خسائر مالية"
    echo -e "${RED}║${NC}    • لا تستخدم أموال حقيقية في هذا البرنامج"
    echo -e "${RED}║${NC}    • المعاملات المعروضة هي محاكاة فقط"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}3. ${CYAN}أمان المفاتيح الخاصة:${NC}"
    echo -e "${RED}║${NC}    • احتفظ بالمفاتيح الخاصة في مكان آمن"
    echo -e "${RED}║${NC}    • لا تشارك المفاتيح مع أي شخص"
    echo -e "${RED}║${NC}    • فقدان المفتاح = فقدان الوصول للمحفظة"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}4. ${CYAN}استخدام الشبكة الحقيقية:${NC}"
    echo -e "${RED}║${NC}    إذا قررت استخدام محافظ حقيقية:"
    echo -e "${RED}║${NC}    • اختبر على Testnet أولاً"
    echo -e "${RED}║${NC}    • استخدم مبالغ صغيرة جداً للبداية"
    echo -e "${RED}║${NC}    • راجع الكود بعناية قبل الاستخدام"
    echo -e "${RED}║${NC}    • استشر خبير أمان إذا لزم الأمر"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}5. ${CYAN}المسؤولية القانونية:${NC}"
    echo -e "${RED}║${NC}    • التزم بقوانين بلدك بخصوص العملات الرقمية"
    echo -e "${RED}║${NC}    • المطور غير مسؤول عن أي استخدام غير قانوني"
    echo -e "${RED}║${NC}    • راجع اللوائح المحلية قبل التعامل بالعملات"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}6. ${CYAN}عدم وجود ضمانات:${NC}"
    echo -e "${RED}║${NC}    البرنامج يُقدَّم \"كما هو\" بدون أي ضمانات صريحة أو"
    echo -e "${RED}║${NC}    ضمنية. استخدمه على مسؤوليتك الخاصة."
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}7. ${CYAN}التحديثات والدعم:${NC}"
    echo -e "${RED}║${NC}    • قد يحتوي البرنامج على أخطاء (bugs)"
    echo -e "${RED}║${NC}    • التحديثات قد لا تكون منتظمة"
    echo -e "${RED}║${NC}    • الدعم الفني محدود وتطوعي"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}8. ${CYAN}الأمان السيبراني:${NC}"
    echo -e "${RED}║${NC}    • استخدم أجهزة آمنة وموثوقة"
    echo -e "${RED}║${NC}    • تجنب الأجهزة العامة أو المشتركة"
    echo -e "${RED}║${NC}    • استخدم برامج مكافحة فيروسات محدثة"
    echo -e "${RED}║${NC}    • تأكد من تشفير القرص الصلب"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}9. ${CYAN}النسخ الاحتياطية:${NC}"
    echo -e "${RED}║${NC}    • اعمل نسخ احتياطية منتظمة"
    echo -e "${RED}║${NC}    • احفظها في أماكن متعددة آمنة"
    echo -e "${RED}║${NC}    • اختبر النسخ الاحتياطية دورياً"
    echo -e "${RED}║${NC}"
    echo -e "${RED}║${NC} ${WHITE}10. ${CYAN}الاتصال بالإنترنت:${NC}"
    echo -e "${RED}║${NC}     • البرنامج يتطلب اتصال لبعض الميزات"
    echo -e "${RED}║${NC}     • كن حذراً عند استخدام شبكات عامة"
    echo -e "${RED}║${NC}     • استخدم VPN موثوق عند الضرورة"
    echo -e "${RED}║${NC}"
    echo -e "${RED}╚════════════════════════════════════════════════════════════════╝${NC}"
    
    echo
    echo -e "${YELLOW}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║${BOLD}                      📄 الترخيص (MIT License)                 ${NC}${YELLOW}║${NC}"
    echo -e "${YELLOW}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${YELLOW}║${NC}"
    echo -e "${YELLOW}║${NC} ${WHITE}Copyright (c) 2025 Asrar Mared (asrar-mared)${NC}"
    echo -e "${YELLOW}║${NC} ${WHITE}Email: nike49424@zohomail.com${NC}"
    echo -e "${YELLOW}║${NC} ${WHITE}Domain: nike49424.ETH${NC}"
    echo -e "${YELLOW}║${NC}"
    echo -e "${YELLOW}║${NC} ${CYAN}يُسمح بما يلي:${NC}"
    echo -e "${YELLOW}║${NC}   ✓ الاستخدام التجاري"
    echo -e "${YELLOW}║${NC}   ✓ التعديل"
    echo -e "${YELLOW}║${NC}   ✓ التوزيع"
    echo -e "${YELLOW}║${NC}   ✓ الاستخدام الخاص"
    echo -e "${YELLOW}║${NC}"
    echo -e "${YELLOW}║${NC} ${RED}الشروط:${NC}"
    echo -e "${YELLOW}║${NC}   • الاحتفاظ بإشعار حقوق النشر"
    echo -e "${YELLOW}║${NC}   • توفير نسخة من الترخيص"
    echo -e "${YELLOW}║${NC}"
    echo -e "${YELLOW}║${NC} ${PURPLE}القيود:${NC}"
    echo -e "${YELLOW}║${NC}   ✗ لا مسؤولية"
    echo -e "${YELLOW}║${NC}   ✗ لا ضمان"
    echo -e "${YELLOW}║${NC}"
    echo -e "${YELLOW}╚════════════════════════════════════════════════════════════════╝${NC}"
    
    echo
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${BOLD}                   📞 معلومات الاتصال والدعم                  ${NC}${GREEN}║${NC}"
    echo -e "${GREEN}╠════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}║${NC} ${CYAN}${CROWN} المطور:${NC}           Asrar Mared"
    echo -e "${GREEN}║${NC} ${CYAN}📧 البريد:${NC}           nike49424@zohomail.com"
    echo -e "${GREEN}║${NC} ${CYAN}🌐 النطاق:${NC}           nike49424.ETH"
    echo -e "${GREEN}║${NC} ${CYAN}🔗 الموقع:${NC}           https://gravatar.com/nike49424"
    echo -e "${GREEN}║${NC} ${CYAN}💻 GitHub:${NC}           github.com/asrar-mared"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}║${NC} ${YELLOW}للإبلاغ عن مشاكل أو اقتراحات:${NC}"
    echo -e "${GREEN}║${NC} https://github.com/asrar-mared/crypto-warrior/issues"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}║${NC} ${BLUE}للمساهمة في المشروع:${NC}"
    echo -e "${GREEN}║${NC} https://github.com/asrar-mared/crypto-warrior/pulls"
    echo -e "${GREEN}║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════════╝${NC}"
    
    echo
    echo -e "${PURPLE}${WARRIOR}${WARRIOR}${WARRIOR} باستخدامك لهذا البرنامج، أنت توافق على جميع الشروط أعلاه ${WARRIOR}${WARRIOR}${WARRIOR}${NC}"
    
    log_event "INFO" "User viewed contributions and disclaimer"
}

#═══════════════════════════════════════════════════════════════════
# 🚀 البرنامج الرئيسي
#═══════════════════════════════════════════════════════════════════

main() {
    # التحقق من المتطلبات
    for cmd in openssl curl jq bc; do
        if ! command -v "$cmd" &> /dev/null; then
            echo -e "${RED}${CROSS} مطلوب تثبيت: $cmd${NC}"
            echo -e "${YELLOW}قم بتشغيل: pkg install $cmd  أو  sudo apt install $cmd${NC}"
            exit 1
        fi
    done
    
    print_banner
    
    # التهيئة الأولية
    initialize_system
    
    # التحقق من وجود مفتاح التشفير
    if [ ! -f "$MASTER_KEY_FILE" ]; then
        create_encryption_key
    fi
    
    # الحلقة الرئيسية
    while true; do
        show_main_menu
        read choice
        
        case "$choice" in
            1) create_wallet ;;
            2) print_info "قيد التطوير - قريباً!" ;;
            3) print_info "قيد التطوير - قريباً!" ;;
            4) print_info "قيد التطوير - قريباً!" ;;
            5) print_info "قيد التطوير - قريباً!" ;;
            6) print_info "قيد التطوير - قريباً!" ;;
            7) 
                echo -ne "${CYAN}مسار الملف للتشفير: ${NC}"
                read file_path
                if [ -f "$file_path" ]; then
                    encrypt_file "$file_path" "${file_path}.enc"
                else
                    print_error "الملف غير موجود!"
                fi
                ;;
            8)
                echo -ne "${CYAN}مسار الملف المشفر: ${NC}"
                read file_path
                if [ -f "$file_path" ]; then
                    decrypt_file "$file_path" "${file_path%.enc}"
                else
                    print_error "الملف غير موجود!"
                fi
                ;;
            9) 
                print_info "إنشاء نسخة احتياطية..."
                local backup_file="$BACKUP_DIR/warrior_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
                tar -czf "$backup_file" -C "$HOME_DIR" \
                    --exclude="backups" \
                    --exclude="cache" \
                    . 2>/dev/null
                print_success "تم الحفظ في: $backup_file"
                ;;
            10) print_info "قيد التطوير - قريباً!" ;;
            11)
                echo -ne "${CYAN}موضوع الإشعار: ${NC}"
                read subject
                echo -ne "${CYAN}الرسالة: ${NC}"
                read message
                send_email_notification "$subject" "$message"
                ;;
            12) show_system_info ;;
            13) show_contributions_disclaimer ;;
            0)
                print_section "👋 الخروج"
                echo -e "${GREEN}${WARRIOR} شكراً لاستخدام Crypto Warrior! ${WARRIOR}${NC}"
                echo -e "${CYAN}Developed with ${RED}❤️${CYAN} by ${WHITE}$DEVELOPER${NC}"
                echo -e "${YELLOW}$DEVELOPER_EMAIL | $DEVELOPER_DOMAIN${NC}\n"
                log_event "SYSTEM" "Application closed"
                exit 0
                ;;
            *)
                print_error "خيار غير صحيح!"
                sleep 1
                ;;
        esac
        
        echo
        echo -ne "${CYAN}اضغط Enter للمتابعة...${NC}"
        read
    done
}

# تشغيل البرنامج
main "$@"
