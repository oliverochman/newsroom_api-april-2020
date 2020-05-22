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
        "title":"title1"
        },
        {"id":2,
        "title":"title2"
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

post /articles
with :title and :body params, gives 200 response with body:

```
{
  "id": :id,
  "message": "Article successfully created!"
}
```

with :title or :body params missing, gives 400 response with body:

```
{
  "message": "Title can't be blank"
}

or

{
  "message": "Body can't be blank"
}
```

### **Login**

post /auth/sign_in

```
{
    "data":
  {"id":12,
   "email":"mystring@mail.com",
   "provider":"email",
   "uid":"mystring@mail.com",
   "allow_password_change":false,
   "name":"User Example",
   "image":"imageURL"}
}
```

with wrong password or email

```
{
    "success":false, "errors":["Invalid login credentials. Please try again."]
}
```
