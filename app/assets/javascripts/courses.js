 $(function () {
        const $createCourseButton = $(".create_course");
        $($createCourseButton).click(function () {
            let name,category_ids, count = $(":checkbox:checked").length,description;
            if (count>=2){
                name = $("#course_name").val();
                category_ids =$("input:checked").valList();
                description = $("#course_description").val();
                $.ajax({
                    url: '/create_course',
                    dataType: 'json',
                    data: JSON.stringify({ name: name,category_ids:category_ids,description:description }),
                    type: 'POST',
                    contentType: 'application/json',
                    success: function() { }
                });
            }
            else alert("Выберите хотя бы одну категорию"); return false;
        });
    });

    $(function(){
        $.fn.valList = function(){
            return $.map( this, function (elem) {
                return elem.value || "";
            }).join( " " );
        };
    });


const coursesApp = {};

coursesApp.main = {
    handleSearchButtonsClick(){
      const $searchByCategoryButton = $('.courses__search_by_category')
      const $searchByName = $('.courses__search_by_name')
      const $searchByCategoryBody = $('.courses__category_search--input')
      const $searchByNameBody = $('.courses__name_search--input')
      $searchByCategoryButton.click(() => {
          $($searchByName).show()
          $($searchByCategoryBody).show()
          S($searchByNameBody).hide()

      })
    }
};

coursesApp.init = function () {
    coursesApp.main.handleSearchButtonsClick()
}

coursesApp.init();
