document.addEventListener('turbolinks:load', function(){
    $(document).ready(() =>
        $(function() {
            $(".create_course").click(function (event) {
         event.preventDefault();

         let  count = $(":checkbox:checked").length;
         if (count>=2){
                let  name = $("#course_name").val();
                let  category_ids =$("input:checked").valList();
                let  description = $("#course_description").val();
                $.ajax({
                    url: '/courses',
                    dataType: 'json',
                    data: JSON.stringify({ name: name,category_ids:category_ids,description:description }),
                    type: 'POST',
                    contentType: 'application/json',
                    success: function(result) {
                        $(`div#courses`).html(result);

                    }
                });
            }
            else alert("Выберите хотя бы одну категорию"); return false;
        });
            $.fn.valList = function(){
            return $.map( this, function (elem) {
                return elem.value || "";
            }).join( " " );
        };
     }))});