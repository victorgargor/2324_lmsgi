(: Consulta 4:)
<books>
  {
    for $x in doc('books')//book
    return if ($x/@category="children")
            then <child>{$x/title/text()}</child>
            else <adult>{$x/title/text()}</adult>
  }
</books>

