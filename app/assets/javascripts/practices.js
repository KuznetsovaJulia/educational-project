document.addEventListener('turbolinks:load', function(){
    $(document).ready(() =>
        $(function() {
    $(function() {
    $(`.delete_practice`).click(function (event) {
        event.preventDefault();
        let practice_id = $(this).attr('id');
        if (confirm("Точно удалить?")){
            let current_practice_li = $(`li#${practice_id}`);
            $.ajax({
                url:'/practices/'+practice_id,
                type: 'DELETE',
                success: function(){
                    $(current_practice_li).fadeOut(200);
                }
            });
        };
    });

    $(".create_practice").click(function (event) {
        event.preventDefault();
        let block_id = location.href.split(/\D+/)[2];
        let question = $("#practice_question").val();
        let answer_type=$("#practice_answer_type").val();
        $.ajax({
            url: '/practices',
            dataType: 'json',
            data: JSON.stringify({ question: question, block_id:block_id,answer_type:answer_type}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $(`div#practices`).html(result);
            }
        });

    });

});

}))});