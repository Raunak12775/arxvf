#show: typ-pdf.with(
$if(title)$
  title: "$title$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
)