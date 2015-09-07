JSX
===============
[Specification](https://facebook.github.io/jsx/)
version: 0.13.3

## Basic tags
XML-like syntax
```html
<App property="value">           <!-- React Components, UpperCamelCase -->
    <a className="link"/>        <!-- HTML tag, lower-case -->
    <Form.Label />               <!-- Use one component that is another component's attribute-->
</App>
```
- Use `className` for `class`, `htmlFor` for `for` in property.
- Every tag must be closed.

## Embedded Javascript
`{ }`
```jsx
<Person name={window.isLoggedIn ? window.name : ''} />
```
