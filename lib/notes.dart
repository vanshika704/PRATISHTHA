class Note {
   
    String title;
    String content;
    

    Note({
        
        this.title = "Note", 
        this.content = "Text", 
      
    });

    Map<String, dynamic> toMap() {
        Map<String, dynamic> data = Map<String, dynamic>();
     
        
        data['title'] = title;
        data['content'] = content;
        
        return data;
    }

    @override toString() {
        return {
            
            'title': title,
            'content': content,
        
        }.toString();
    }
}