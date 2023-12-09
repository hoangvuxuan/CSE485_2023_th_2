document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('commentForm').addEventListener('submit', function(event) {
        event.preventDefault();

        var formData = new FormData(this);

        var aj = new XMLHttpRequest();
        aj.open('POST', 'comment.php', true);

         
        aj.onreadystatechange = function() {
            if (aj.readyState == 4 && aj.status == 200) {
                
                showComments();
                
                document.getElementById('commentForm').reset();
                document.getElementById('commentId').value = '0';
              
                document.getElementById('message').innerHTML = aj.responseText;
                
            }
        };

        aj.send(formData);
    });
});

function showComments() {
   
	var aj = new XMLHttpRequest();

    aj.onreadystatechange = function() {
        if (aj.readyState == 4 && aj.status == 200) {
            document.getElementById('showComments').innerHTML = aj.responseText;
        }
    };

    aj.open('POST', 'show_comments.php', true);
    aj.send();
}

function myFunction(id) {
    let text;
    let cmm = prompt("Please enter your reply:");
    if (cmm == null || cmm == "") {
        text = "User cancelled the prompt.";
        return 0;
    } 
    else {
        var aj = new XMLHttpRequest();
        aj.open('POST', 'testt.php', true);
        aj.send(cmm);
    }
  
  
    //document.getElementById(id).innerHTML += text;
  
  }
