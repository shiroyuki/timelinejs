# Timeline.js - Interactive Timeline Widget

Features (planned to support):
* Progressively enhance the existing HTML code by replacing it with an interactive widget.
* Maintain SEO-friendly (because search engines don't care about the Javascript code).

## How it works

Suppose you create a page with the following structure.

```html
<container data-locale>
    <!-- Zero or more <event/>'s -->
    <event data-uuid data-title data-type data-partialhref data-href data-from data-to data-presenters>
        <description/>
        <!-- ... anything here will be caught by search engines but the widget will ignore ... -->
    </event>
</container>
```

where:
* Any elements, e.g., `container`, `event` and `description`, technically can be any type of DOM elements at least with respective class name.
* The DOM element `container` is the DOM element to replace where the attribute `data-locale` is the locale of the information.
* The DOM element `event` contains the information of one particular event.

| Attribute | Interpreted Type | Description | Required |
| --- | --- | --- | --- |
| `data-title` | `String` | the title of the event. | Yes |
| `data-type` | `String` | the type of the event. The default event types are `talk`, `tutorial`, `lightning`, `keynote` and `extra` (default for unrecognized event types). | No, default to `extra`. |
| `data-uuid` | `String` | the UUID of the event. This is only for reference on the UI. It does not have to be the actual UUID of the source data. | Yes |
| `data-partialhref` | `String` | the URL to the endpoint that can retrieve the partial HTML of the detail of the event. If undefined, the widget will show only any information related to the event available from the source DOM tree (`event`). | No |
| `data-href` | `String` | the URL to the detail page of the event (full redirection). If undefined, the widget will not show the link to the detail page. | No |
| `data-from` | `String` | the datatime when the event starts in the ISO format. | Yes |
| `data-to` | `String` | the datatime when the event ends in the ISO format. | Yes |
| `data-presenters` | `String` | the comma-separated list of the presenter information. For example, `John Doe (http://johndoe.me), Foo Bar (http://iamfoobar.io), Mr Button` will be translated to `[{name: 'John Doe', url: 'http://johndoe.me'}, {name: 'Foo Bar', url: 'http://iamfoobar.io'}, {name: 'Mr Button'}]`| No, default to `Organizer` |

* The DOM element `description` is the title of the event. *The content inside the element will be rendered as it is.*

Here is an example.

```html
<article class="container" data-locale="en-US">
    <!-- Zero or more <event/>'s -->
    <section
        class="event"
        data-uuid="1"
        data-title="Loren ipsum"
        data-type="keynote"
        data-partialhref
        data-href
        data-from="2017-01-01T10:17:00"
        data-to="2017-01-01T10:17:00"
        data-presenters="Juti Noppornpitak (http://event.example.com/speakers/shiroyuki)">
        <h1>Loren ipsum</h1> <!-- This will be ignored. -->
        <p class="speaker">Juti Noppornpitak</p> <!-- This will be ignored. -->
        <p class="description"> <!-- This will be INCLUDED. -->
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
    </event>
</article>
```
