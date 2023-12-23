echo "Fixing links..."

for i in ./site/*.html
do
  echo "Fixing $i"
  sed -i -E 's,href="\.\.?",href="/mkdocs-plugins/",' $i
  sed -i -E 's,base: ".",base: "/mkdocs-plugins/",' $i
  sed -i -E 's,worker: "assets/,worker: "/mkdocs-plugins/assets/,' $i
  sed -i -E 's,src="\.\/([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,href="\.\/([a-z]+),href="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,href="([a-z]+),href="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="img/,src="/mkdocs-plugins/img/,' $i
  sed -i -E 's,src="../,src="/mkdocs-plugins/,' $i
  sed -i -E 's,href="../,href="/mkdocs-plugins/,' $i
  sed -i -E 's,href="css/,href="/mkdocs-plugins/css/,' $i
  sed -i -E 's,href="img/,href="/mkdocs-plugins/img/,' $i
  sed -i -E 's,href="assets/,href="/mkdocs-plugins/assets/,' $i
  sed -i -E 's,/mkdocs-plugins/https://,https://,' $i
  sed -i -E 's,src="/img,src="/mkdocs-plugins/img,' $i
done


for i in ./site/**/*.html
do
  echo "Fixing $i"
  sed -i -E 's,href="\.\.?",href="/mkdocs-plugins/",' $i
  sed -i -E 's,base: "\.\.",base: "/mkdocs-plugins/",' $i
  sed -i -E 's,worker: "\.\./assets/,worker: "/mkdocs-plugins/assets/,' $i
  sed -i -E 's,src="\.\/([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,href="\.\/([a-z]+),href="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,href="([a-z]+),href="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="([a-z]+),src="/mkdocs-plugins/\1,' $i
  sed -i -E 's,src="img/,src="/mkdocs-plugins/img/,' $i
  sed -i -E 's,src="../,src="/mkdocs-plugins/,' $i
  sed -i -E 's,href="../,href="/mkdocs-plugins/,' $i
  sed -i -E 's,href="css/,href="/mkdocs-plugins/css/,' $i
  sed -i -E 's,href="img/,href="/mkdocs-plugins/img/,' $i
  sed -i -E 's,href="assets/,href="/mkdocs-plugins/assets/,' $i
  sed -i -E 's,src="/img,src="/mkdocs-plugins/img,' $i
  sed -i -E 's,/mkdocs-plugins/https://,https://,' $i
done

for i in ./site/**/*.html
do
  echo "Fixing $i"
  sed -i -E 's,/mkdocs-plugins/https://,https://,' $i
  sed -i -E 's,/mkdocs-plugins/http://,http://,' $i
  sed -i -E 's,/mkdocs-plugins/data:,data:,' $i
done
