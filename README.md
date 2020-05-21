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