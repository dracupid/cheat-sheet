Markdown
========

## syntax
- [John Gruber's (inventor)](http://daringfireball.net/projects/markdown/syntax)
    - [Chinese Version](http://wowubuntu.com/markdown)

## Quickstart
- [认识与入门 Markdown](http://sspai.com/25137)

## cheatsheet
- Just use HTML itself in markdown, with only [a little restriction](http://daringfireball.net/projects/markdown/syntax#html)
- Automatic escaping for special characters.

#### paragraphs
- **paragraph**: consecutive lines of text, separated by blank lines.
- two or more spaces + enter == `<br />`

#### headers
- Setext-style
    ```
    This is an H1
    =============

    This is an H2
    -------------
    ```
    - Any number of underlining =’s or -’s will work.

- Atx-style
    ```
    # This is an H1

    ## This is an H2

    ###### This is an H6
    ```
    - 1-6 #s corresponding to header levels 1-6

#### blockquotes
```
> This is a blockquote with two paragraphs.Lorem ipsum dolor sit amet,
> consectetuer adipiscing elit.
>
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
> id sem consectetuer libero luctus adipiscing.
>
> > **This is nested blockquote.**
```

- You can only put the > before the first line of a hard-wrapped paragraph

```
> This is a blockquote with two paragraphs.Lorem ipsum dolor sit amet,
consectetuer adipiscing elit.

> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
id sem consectetuer libero luctus adipiscing.
```

#### lists
- Unordered lists (`*`, `+` or `-`)
    ```
    -   Red
    -   Green
    -   Blue
    ```

- Ordered lists (numbers you use to mark the list have no effect)
    ```
    1.  Bird
    2.  McHale
    3.  Parish
    ```

#### code blocks
- Indent every line of the block by at least 4 spaces or 1 tab
    ```
    This is a normal paragraph:

    This is a code block.
    ```

#### horizontal
Placing three or more `*`, `-`, or `_` on a line by themselves.
```
* * *

***

*****

- - -

---------------------------------------
```

#### links
- inline-style

```
This is an [example](http://example.com/ "Title") inline link.

[This link](http://example.net/) has no title attribute.
```

- Reference-style

```
This is an [example][id] reference-style link.

[id]: http://example.com/  "Optional Title Here"
```

```
This is an [example][] reference-style link.

[example]: http://example.com/  "Optional Title Here"
```

#### emphasis
```
*single asterisks to em*

_single underscores to em_

**double asterisks to strong**

__double underscores to strong__
```

#### inline code
```
Use the `printf()` function.

``There is a literal backtick (`) here.``
```

#### images
- inline-style

```
![Alt text](/path/to/img.jpg)

![Alt text](/path/to/img.jpg "Optional title")
```

- Reference-style

```
![Alt text][id]

[id]: url/to/image  "Optional title attribute"
```

#### automatic links
```
<http://example.com/>
<address@example.com>
```

#### backslash escapes
- use backslash escapes to generate characters which have special meaning in Markdown.
