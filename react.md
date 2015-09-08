React
- version: 0.14-RC1
- [Home](http://facebook.github.io/react)
- [Tools](https://github.com/facebook/react/wiki/Complementary-Tools)
- [0.14 changelog](https://github.com/facebook/react/pull/4797)

## Quick Look
```jsx
let App = React.createClass({
    getDefaultProps: function () {
        return {name: "Nobody"};
    },

    propTypes: {name: React.PropTypes.string.isRequired},

    getInitialState: function () {
        return {timestamp: new Date()};
    },

    componentWillMount: function () {},

    render: function () { // Required, return a single child element, pure.
        return <div onClick={this.handleClick}> Hello {this.props.name} </div>;
    },

    handleClick: function(e) {
        // Here, 'this' is auto bound to the component instance by React.
        this.setState({timestamp: new Date()});
  },
});
React.render(<App name="Dracupid"/>, document.body);

```
or [ES6+](http://babeljs.io/blog/2015/06/07/react-on-es6-plus/)
```jsx
class App extends React.Component {
    static defaultProps = {name: "Nobody"};

    static propTypes = {name: React.PropTypes.string.isRequired};

    // state = {timestamp: new Date()}; // ES7 property initializers

    constructor(props) {  // componentWillMount
        super(props);
        this.state = {timestamp: new Date()};
    }

    render() {
        return <div onClick={this.handleClick}> Hello {this.props.name} </div>;
    }
    handleClick = (e) => {
        this.setState({timestamp: new Date()});
    }
}
React.render(<App name="Dracupid"/>, document.body);
```

## JSX
See [JSX cheet sheet](jsx.md)

##Properties & States
- property (`this.props`): Access parameters passed from the parent.
    - Should be immutable.
    - Can only be set by component's owner.

```jsx
<App name="Dracupid"/>

// get value
this.props.name


React.createClass({
    // Default value
    getDefaultProps: function () {
        return { name: "Hello" };
    }

    // validation (Only in development mode)
    propTypes: {
        // A prop is am optional JS primitive.
        optionalArray: React.PropTypes.array, // bool, func, number, object, string

        // Anything that can be rendered: numbers, strings, elements or an array.
        optionalNode: React.PropTypes.node,

        // A React element.
        optionalElement: React.PropTypes.element,

        optionalMessage: React.PropTypes.instanceOf(Message),

        optionalEnum: React.PropTypes.oneOf(['News', 'Photos']),

        optionalUnion: React.PropTypes.oneOfType([
            React.PropTypes.string,
            React.PropTypes.number,
            React.PropTypes.instanceOf(Message)
        ]),

        optionalArrayOf: React.PropTypes.arrayOf(React.PropTypes.number),

        // An object with property values of a certain type
        optionalObjectOf: React.PropTypes.objectOf(React.PropTypes.number),

        // An object taking on a particular shape
        optionalObjectWithShape: React.PropTypes.shape({
            color: React.PropTypes.string,
            fontSize: React.PropTypes.number
        }),

        // Required
        requiredFunc: React.PropTypes.func.isRequired,
        requiredAny: React.PropTypes.any.isRequired,

        // You can also specify a custom validator. It should return an Error
        // object if the validation fails.
        customProp: function (props, propName, componentName) {
            if (!/matchme/.test(props[propName])) {
                return new Error('Validation failed!');
            }
        }
    }
});
```

- state (`this.state`): Manage dynamic data
    -  UI is refreshed based on its state.
    -  `setState(data, callback)`:  change state and re-render the component.
    -  Try to keep as many of components stateless as possible .

```jsx
this.setState({ msg: "Hmm.." }); // set state
this.state.username              // get state

Class A extends React.Component {
    constructor(props) {
        super(props);
        this.state = {msg: 'no'};
    }
}
```

## Events
Pass event handler as a camelCased prop.
```jsx
<p onClick={this.handleClick} />
```
- **Autobinding**: With `React.createClass`, every method is automatically bound to its component instance.
- **Event delegation**: React doesn't actually attach event handlers to the nodes themselves, but using an internal mapping.

## Multiple Components
- Ownership:  An owner is the component that sets the props of other components.
- Children:
```jsx
<Parent><Child /></Parent>
this.props.children // use React.Children to manipulate it.
```
- Child Reconciliation:  How to re-render children.
    - React reconciles according to the order of the children.
    - Nodes are reused. Use `display: 'none'` to avoid overhead. [performance]
    - Use a coincident `key` property on dynamic children in an array to force the children to be reordered (instead of clobbered) or destroyed (instead of reused). [performance]


## mixin
```jsx
let SetIntervalMixin = {
  componentWillMount: function() {
    this.intervals = [];
  },
  setInterval: function() {
    this.intervals.push(setInterval.apply(null, arguments));
  },
  componentWillUnmount: function() {
    this.intervals.map(clearInterval);
  }
};

let TickTock = React.createClass({
  mixins: [SetIntervalMixin], // Use the mixin,
  tick: function() {}
  componentDidMount: function() {
    this.setInterval(this.tick, 1000); // Call a method on the mixin
  }
});
```
- Methods defined on mixins run in the order mixins were listed, followed by a method call on the component.
- Can not be used in ES6 class.

## Form
- `<input>`, `<textarea>`, and `<option>` can be mutated via UI on props `value`(`input` `textarea`), `checked`(`input`), `selected`.(`option`)
- An unified `onChange` prop is used to in response to the change.

#### Controlled Components
The value of the rendered element will always reflect the value prop.
```jsx
getInitialState: function() {
    return {value: 'Hello!'};
},
handleChange: function(event) {
    this.setState({value: event.target.value});
},
render: function() {
    let value = this.state.value;
    return <input type="text" value={value} onChange={this.handleChange} />;
}
```

#### Uncontrolled Components
The value of the rendered element will reflect the user's input.
```jsx
render: function() {
    return <input type="text" defaultValue="Hello!" />; // also defaultChecked
}
```

## ref
- The ref String Attribute
```jsx
React.createClass({
    handleClick: function () {
        this.refs.myTextInput.focus(); // DOM node -> built-in DOM components
                                       // React Component -> custom components
    },
    render: function () {
        return (
            <div>
                <input type="text" ref="myTextInput"/>
            </div>
        );
    }
});
```

- The ref Callback Attribute
    - Executed immediately after the component is mounted.
    - When the referenced component is unmounted and whenever the ref changes, the old ref will be called with null as an argument.
```jsx
render: function() {
    return (
      <TextInput
        ref={function(input) {
          if (input != null) {
            input.focus();
          }
        }} />
    );
  }
```

## Underlying DOM API
```jsx
React.findDOMNode(component); // Only mounted components
```
component can be `this` or a ref or else.
```jsx
React.createClass({
    handleClick: function () {
        this.refs.myTextInput.focus();
    },
    render: function () {
        return (
            <div>
                <input type="text" ref="myTextInput"/>
            </div>
        );
    }
});
```

## Component Lifecycle
1. Mounting
    - `componentWillMount()`
    - `componentDidMount()`: fetch data
2. Updating
    + `componentWillReceiveProps(object nextProps)`
    + `shouldComponentUpdate(object nextProps, object nextState)`
    + `componentWillUpdate(object nextProps, object nextState)`: cannot use `this.setState()`
    + `componentDidUpdate(object prevProps, object prevState)`:  operate on the DOM
3. Unmounting
    - `componentWillUnmount()`

## Full API
- [Top-level API](http://facebook.github.io/react/docs/top-level-api.html): `React.*`
- [Component API](http://facebook.github.io/react/docs/component-api.html): `React.Component` methods to use
- [Component spec](http://facebook.github.io/react/docs/component-specs.html): `React.Component` methods to override
