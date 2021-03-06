JSX
===============
React version: 0.14.3
- [Specification](https://facebook.github.io/jsx/)
- [Reference](http://facebook.github.io/react/docs/jsx-in-depth.html)
- [Get Start](http://facebook.github.io/react/docs/getting-started.html)
- tools
    - [HTML to JSX converter](http://facebook.github.io/react/html-jsx.html)
    - [Babel (JSX compiler)](https://babeljs.io/)
        - [repl](https://babeljs.io/repl/)

## Basic tags
XML-like syntax
```jsx
<App property="value">       /* React Components, UpperCamelCase */
    <a className="link"/>    /* HTML tag, lower-case */
    <Form.Label />           /* Use one component that is another component's attribute */
</App>
```

- Use `className` for `class`, `htmlFor` for `for` in property.
- Every tag must be closed.

## Embedded Javascript
`{ javascript }`

```jsx
<Person name={window.isLoggedIn ? window.name : ''} />
<input type="button" disabled={true} />;
<Container> {window.isLoggedIn ? <Nav /> : <Login />} </Container>;
```
- if-else statements don't work inside JSX, it doesn't return a value.

## Custom HTML Attributes
custom attribute must be prefixed with `data-` or `aria-`.
```jsx
<div data-custom-attribute="foo" aria-hidden={true} />
```

## DOM properties
- All DOM properties and attributes (including event handlers) should be **camelCased**.
- `data-*` and `aria-*` attributes conform to the [specs](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes#data-*) and should be lower-cased only.
- The **style** attribute accepts a JavaScript **object** with **camelCased** properties rather than a CSS string.
    - React automatically appends "px" after number value if necessary.

## Spread Attributes
The props variable is copied onto the component's props.
```jsx
let props = {
    foo: 'x',
    bar: 'y'
};
let component = <Component {...props} />;
```

## HTML Entities
```jsx
<div>First &middot; Second</div>
<div>{'First · Second'}</div>
```

## Insert Raw HTML([dangerous](http://facebook.github.io/react/tips/dangerously-set-inner-html.html))
```jsx
<div dangerouslySetInnerHTML={{__html: 'First &middot; Second'}} />
```

## Array as children
```jsx
<div>{['First ', <span>&middot;</span>, ' Second']}</div>
```
