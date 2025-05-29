using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services.Exceptions
{
    public static class AppExceptions
    {
        public static AppException BadRequest(string message)
        {
            return new BadRequestException("MSG00", message);
        }

        public static AppException NotFoundId()
        {
            return new NotFoundException("MSG01", "Không tìm thấy Id.");
        }

        public static AppException IdExists()
        {
            return new NotFoundException("MSG02", "Id đã tồn tại.");
        }

        public static AppException BadRequestStudentNumberExists()
        {
            return new BadRequestException("MSG03", "Mã số học sinh đã tồn tại");
        }

        public static AppException BadRequestEmailIsInvalid()
        {
            return new BadRequestException("MSG04", "Email người dùng không hợp lệ");
        }

        public static AppException BadRequestEmailIsExists()
        {
            return new BadRequestException("MSG05", "Email người dùng đã tồn tại");
        }

        public static AppException NotFoundAccount()
        {
            return new NotFoundException("MSG06", "Không tìm thấy tài khoản.");
        }
       
    }
}
