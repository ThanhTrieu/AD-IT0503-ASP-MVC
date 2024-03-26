using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using TrainingFPT.Helpers;
using TrainingFPT.Models;
using TrainingFPT.Models.Queries;

namespace TrainingFPT.Controllers
{
    public class CoursesController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            CoursesViewModel course = new CoursesViewModel();
            course.CourseDetailList = new List<CourseDetail>();
            var dataCourses = new CourseQuery().GetAllDataCourses();
            foreach (var data in dataCourses)
            {
                course.CourseDetailList.Add(new CourseDetail
                {
                    Id = data.Id,
                    NameCourse = data.NameCourse,
                    CategoryId = data.CategoryId,
                    Description = data.Description,
                    Status = data.Status,
                    StartDate = data.StartDate,
                    EndDate = data.EndDate,
                    ViewImageCouser = data.ViewImageCouser,
                    viewCategoryName = data.viewCategoryName
                });
            }
            return View(course);
        }

        [HttpGet]
        public IActionResult Add()
        {
            CourseDetail course = new CourseDetail();
            List<SelectListItem> items = new List<SelectListItem>();
            var dataCategories = new CategoryQuery().GetAllCategories(null, null);
            foreach (var category in dataCategories)
            {
                items.Add(new SelectListItem
                {
                    Value = category.Id.ToString(),
                    Text = category.Name
                });
            }
            ViewBag.Categories = items;
            return View(course);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(CourseDetail course, IFormFile Image)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //return Ok(course);
                    string imageCourse = UploadFileHelper.UploadFile(Image);
                    int idCourse = new CourseQuery().InsetDataCourse(
                        course.NameCourse,
                        course.CategoryId,
                        course.Description,
                        course.StartDate,
                        course.EndDate,
                        course.Status,
                        imageCourse
                    );
                    if (idCourse > 0)
                    {
                        TempData["saveStatus"] = true;
                    }
                    else
                    {
                        TempData["saveStatus"] = false;
                    }
                    return RedirectToAction(nameof(CoursesController.Index), "Courses");
                }
                catch (Exception ex)
                {
                    // neu co loi
                    return Ok(ex.Message);
                }
            }
            List<SelectListItem> items = new List<SelectListItem>();
            var dataCategories = new CategoryQuery().GetAllCategories(null, null);
            foreach (var category in dataCategories)
            {
                items.Add(new SelectListItem
                {
                    Value = category.Id.ToString(),
                    Text = category.Name
                });
            }
            ViewBag.Categories = items;
            return View(course);
        }
    }
}
