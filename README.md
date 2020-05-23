# newsroom_api-april-2020

# API

Prefix for all requests >>> **/api**

### **Articles**

#### index

get /articles  
Response : {articles:[{id:1,title:"title1"},{id:2,title:"title2"}]}

```
{
    "articles":[
        {"id":1,
        "title":"title1",
        "category":"category1"
        },
        {"id":2,
        "title":"title2",
        "category":"category2"
        }
    ]
}
```

get /articles/:id
:id exists in db gives a 200 response with body:

```
{
  "article": {
    "id": 1,
    "title": "A title",
    "body": "The body"
  }
}
```

:id does not exist in db gives a 404 with body:

```
{
  "message": "Article with id :id could not be found"
}
```

post /articles **Requires authentication headers!**
Headers need to include the standard { uid: "", client: "", access_token: "", expiry: "", token_type: "Bearer" }
with :title,:category and :body params, gives 200 response with body:

```
{
  "id": :id,
  "message": "Article successfully created!"
}
```

with :title,:category or :body params missing, gives 400 response with body:

```
{
  "message": "Title can't be blank"
}

or

{
  "message": "Body can't be blank"
}

or

{
  "message": "Category can't be blank"
}
```

### **Login**

All [devise_token_auth endpoints](https://devise-token-auth.gitbook.io/devise-token-auth/usage) are open, only sign in is tested for right now.
post /auth/sign_in

```
{
    "data":
  {"id":12,
   "email":"mystring@mail.com",
   "provider":"email",
   "uid":"mystring@mail.com",
   "allow_password_change":false,
}
```

with wrong password or email

```
{
    "success":false, "errors":["Invalid login credentials. Please try again."]
}
```
