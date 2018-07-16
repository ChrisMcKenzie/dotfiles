
bat_level = "0"

for D in /sys/class/power_supply/*; do
  if [ "${D}" = "/sys/class/power_supply/AC" ]; then
    continue
  fi
  bat = cat ${D}/capacity
  bat_level = $bat_level + $bat
done
