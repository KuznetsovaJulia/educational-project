document.addEventListener('turbolinks:load', function(){
    $(document).ready(() =>
        $(function() {
            $(function() {
                $(".create_answer").click(function (event) {
                    event.preventDefault();
                    let practice_id = $(this).attr('id');
                    let content = $("#answer_content").val();
                    let correct = $("#answer_correct").val();
                    $.ajax({
                        url: '/answers',
                        dataType: 'json',
                        data: JSON.stringify({ content: content, practice_id:practice_id,correct:correct}),
                        type: 'POST',
                        contentType: 'application/json',
                        success: function(result) {
                            $(`div#answers`).html(result);
                        }
                    });

                });

            });

        }))});