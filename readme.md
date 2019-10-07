# MiniShop
BE Mod 2 Week 1 Solo Project

## Learning Goals

### Rails

* Implement CRUD functionality for a resource using forms (form_tag or form_for), buttons, and links
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Create routes for
* standalone resources
* nested resources
* Template a view in Rails using a templating language (eg, `erb`)
* Implement CRUD functionality for nested resources

### ActiveRecord

* Create instance methods on a Rails model that use ActiveRecord associations
* Use built-in ActiveRecord methods to:
* create, read, update, and destroy records in a database
* create records with relationships to other records in a database

### Databases

* Describe Database Relationships, including the following terms:
* Primary Key
* Foreign Key
* One to Many
* Write migrations to create tables and relationships between tables
* Describe ORMs and their advantages and use cases

### Testing and Debugging

* Write feature tests utilizing:
* RSpec and Capybara
* CSS selectors to target specific areas of a page
* Use Pry or Byebug in Rails files to get more information about an error
* Use `save_and_open_page` to view the HTML generated when visiting a path in a feature test
* Utilize the Rails console as a tool to get more information about the current state of a development database
* Use `rails routes` to get additional information about the routes that exist in a Rails application

### Styling

* Create basic Web Pages using the following tags
* `<h1>`, `<h2>`, etc.
* `<p>`
* `<body>`
* `<a>` and the `href` attribute
* `<img>` and the `src` attribute
* `<div>`
* `<section>`
* `<ul>`, `<ol>`, and `<li>`
* `<form>`
* `<input>`
* Select HTML elements using classes and ids

### Web Applications

* Describe the HTTP request/response cycle
* Describe the different parts of HTTP requests and responses

## Requirements

- must use Rails 5.1.x
- must use PostgreSQL
- must "handroll" all routes (no use of `resources` syntax)
- must use `form_tag` for all forms (no use of `form_for`)

## Permitted

- use FactoryBot to speed up your test development
- use "rails generators" to speed up your app development

## Not Permitted

- do not use JavaScript for pagination or sorting controls

## Permission

- if there is a specific gem you'd like to use in the project, please get permission from your instructors firs

## User Stories

```
[x] done

User Story 1, Deploy your application to Heroku

As a visitor or user of the site
I will perform all user stories
By visiting the application on Heroku.
Localhost is fine for development, but
the application must be hosted on Heroku.
```

## Rubric


| | **Feature Completeness** | **Rails** | **ActiveRecord** | **Testing and Debugging** | **Styling, UI/UX** |
| --- | --- | --- | --- | --- | --- |
| **4: Exceptional**  | All User Stories 100% complete including edge cases, and at least one extension story completed | Students implement strategies not discussed in class to effectively organize code using POROs and adhere to MVC | Highly effective and efficient use of ActiveRecord beyond what we've taught in class. Even `.each` calls will not cause additional database lookups. | Very clear Test Driven Development. Test files are extremely well organized and nested. Students utilize `before :each` blocks. 100% coverage for features and models | Extremely well styled and purposeful layout. Excellent color scheme and font usage. All other rubric categories score 3 or 4. |
| **3: Passing** | Students complete all User Stories. No more than 2 Stories fail to correctly implement functionality. | Students use the principles of MVC to effectively organize code. Students can defend any of their design decisions. | ActiveRecord is used in a clear and effective way to read/write data using no Ruby to process data. | 100% coverage for models. 98% coverage for features. Tests are well written and meaningful. | Purposeful styling pattern and layout using `application.html.erb`. Links or buttons to reach all areas of the site. |
| **2: Passing with Concerns** | Students complete all but 3-5 User Stories | Students utilize MVC to organize code, but cannot defend some of their design decisions. | Ruby is used to process data that could use ActiveRecord instead. | Feature test coverage between 90% and 98%, or model test coverage below 100%, or tests are not meaningfully written or have an unclear objective. | Styling is poor or incomplete. Incomplete navigation for some routes, i.e. users must manually type URLs. |
| **1: Failing** | Students fail to complete 6 or more User Stories | Students do not effectively organize code| Ruby is used to process data more often than ActiveRecord | Below 90% coverage for either features or models. | No styling or no buttons or links to navigate the site. |


---

## Merchants
Merchants are organizations/companies who sell items on our site (as opposed to individual people/users)

```
[x] done

User Story 2, Merchant Index

As a visitor
When I visit '/merchants'
Then I see the name of each merchant in the system
```

```
[x] done

User Story 3, Merchant Show

As a visitor
When I visit '/merchants/:id'
Then I see the merchant with that id including the merchant's:
- name
- address
- city
- state
- zip
```

```
[x] done

User Story 4, Merchant Creation

As a visitor
When I visit the Merchant Index page
Then I see a link to create a new merchant
When I click this link
Then I am taken to '/merchants/new' where I  see a form for a new merchant
When I fill out the form with a new merchant's:
- name
- address
- city
- state
- zip
And I click the button to submit the form
Then a `POST` request is sent to '/merchants',
a new merchant is created,
and I am redirected to the Merchant Index page where I see the new Merchant listed.
```

```
[x] done

User Story 5, Merchant Update

As a visitor
When I visit a merchant show page
Then I see a link to update the merchant
When I click the link
Then I am taken to '/merchants/:id/edit' where I  see a form to edit the merchant's data including:
- name
- address
- city
- state
- zip
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/merchants/:id',
the merchant's info is updated,
and I am redirected to the Merchant's Show page where I see the merchant's updated info
```

```
[x] done

User Story 6, Merchant Delete

As a visitor
When I visit a merchant show page
Then I see a link to delete the merchant
When I click the link
Then a 'DELETE' request is sent to '/merchants/:id',
the merchant is deleted,
and I am redirected to the merchant index page where I no longer see this merchant
```

---

## Items
Items are sold on the site. They belong to a merchant.

```
[x] done

User Story 7, Item Index

As a visitor
When I visit '/items'
Then I see each Item in the system including the Item's:
- name
- description
- price
- image
- active/inactive status
- inventory
- the name of the merchant that sells the item
```

```
[x] done

User Story 8, Merchant Items Index

As a visitor
When I visit '/merchants/:merchant_id/items'
Then I see each Item that belongs to the Merchant with that merchant_id including the Item's:
- name
- price
- image
- active/inactive status
- inventory
```

```
[x] done

User Story 9, Item Show

As a visitor
When I visit '/items/:id'
Then I see the item with that id including the item's:
- name
- active/inactive status
- price
- description
- image
- inventory
- the name of the merchant that sells the item
```

```
[x] done

User Story 10, Merchant Item Creation

As a visitor
When I visit a Merchant Items Index page
Then I see a link to add a new item for that merchant
When I click the link
I am taken to '/merchants/:merchant_id/items/new' where I see a form to add a new item
When I fill in the form with the item's:
- name
- price
- description
- image
- inventory
Then a `POST` request is sent to '/merchants/:merchant_id/items',
a new item is created for that merchant,
that item has a status of 'active',
and I am redirected to the Merchant Items Index page where I see the new item
```

```
[x] done

User Story 11, Item Update

As a visitor
When I visit an Item Show page
Then I see a link to update that Item
When I click the link
I am taken to '/items/:id/edit' where I see a form to edit the item's data including:
- name
- price
- description
- image
- inventory
When I click the button to submit the form
Then a `PATCH` request is sent to '/items/:id',
the item's data is updated,
and I am redirected to the Item Show page where I see the Item's updated information
```

```
[x] done

User Story 12, Item Delete

As a visitor
When I visit an item show page
Then I see a link to delete the item
When I click the link
Then a 'DELETE' request is sent to '/items/:id',
the item is deleted,
and I am redirected to the item index page where I no longer see this item
```

---

## Usability
Users should be able to use the site easily. This means making sure there are links/buttons to reach all parts of the site and the styling/layout is sensible.

```
[x] done

User Story 13, Merchant Links

As a visitor
When I click on the name a merchant anywhere on the site
Then that link takes me to that Merchant's show page
```

```
[x] done

User Story 14, Item Links

As a visitor
When I click on the name a item anywhere on the site
Then that link takes me to that Item's show page
```

```
[x] done

User Story 15, Item Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Item Index
```

```
[x] done

User Story 16, Merchant Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Merchant Index
```

```
[x] done

User Story 17, Merchant Item Index Link

As a visitor
When I visit a merchant show page ('/merchants/:id')
Then I see a link to take me to that merchant's items page ('/merchants/:id/items')
```

```
[x] done

User Story 18, Styling

As a visitor
When I visit any page on the site
Then I should see a reasonably well styled page
```

---

## Extensions

```
[x] done

User Story 19, Item Filter by Active Status

As a visitor
When I visit a Merchant Items Index page
Then I see a link to show only active items
And I also see a link to show only inactive items
When I click the link
Then my path is something like '/merchants/:merchant_id/items?active=true'
And I see only the Items sold by the merchant that are active/inactive.
```

```
[x] done

User Story 20, Change Item's Active Status

As a visitor
When I visit an Item Show page
Then I see a link to change the Item's active status
Active items should have the link "deactivate"
Inactive items should have the link "activate"
When I click the link
Then a 'PATCH' request is sent to '/items/:id/activate' or 'items/:id/deactivate' (depending on the link)
and I am redirected to the Item Show page where I see the active status has been toggled
```
