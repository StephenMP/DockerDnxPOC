using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DockerDnxPoc.Controllers;
using Xunit;

namespace DockerDnxPoc.Tests
{
    public class ValuesControllerTestscs
    {
		[Fact]
		public void CanCreateValuesController()
		{
			var controller = new ValuesController();
			Assert.NotNull(controller);
		}

		[Fact]
		public void CanGetValues() {
			var controller = new ValuesController();
			var values = controller.Get();

			Assert.NotNull(values);
			Assert.Equal(values.ElementAt(0), "value1");
			Assert.Equal(values.ElementAt(1), "value2");
		}
    }
}
