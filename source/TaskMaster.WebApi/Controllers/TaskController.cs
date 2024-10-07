using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace TaskMaster.WebApi.Controllers
{
    [Route("api/tasks")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        [HttpGet]
        public IList<int> GetTasks()
        {
            return new List<int>{0,1,2,3,4,5};
        }
    }
}
