$srcroot = $(git rev-parse --show-toplevel)
$release_dir = "${srcroot}/PowerEditor/bin64"
$tools_dir = "${srcroot}/BuildTools"
$wix_bin = "C:/Program Files (x86)/WiX Toolset v3.11/bin"

$version = $(git describe --tags --abbrev=0) -replace "[a-z]", ""
pushd "${release_dir}"
cp "${tools_dir}\npp.wxs" "${release_dir}"

try
{
    & "${wix_bin}\candle.exe" .\npp.wxs -dVersion="${version}"
    & "${wix_bin}\light.exe" .\npp.wixobj
}
finally
{
    popd
}
