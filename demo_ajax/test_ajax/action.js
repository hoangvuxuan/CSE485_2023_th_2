document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('commentForm').addEventListener('submit', function(event) {
        event.preventDefault();

        var formData = new FormData(this);

        var aj = new XMLHttpRequest();
        aj.open('POST', 'comment.php', true);

         
        aj.onreadystatechange = function() {
            if (aj.readyState == 4 && aj.status == 200) {
                alert("ggdfgf");
                showComments();
                
                document.getElementById('commentForm').reset();
                document.getElementById('commentId').value = '0';
                //document.getElementById('message').innerHTML = response.message;
                
            }
        };

        aj.send(formData);
    });
});

function showComments() {
    alert("fuck");
	var aj = new XMLHttpRequest();

    aj.onreadystatechange = function() {
        if (aj.readyState == 4 && aj.status == 200) {
            document.getElementById('showComments').innerHTML = aj.responseText;
        }
    };

    aj.open('POST', 'show_comments.php', true);
    aj.send();
}
