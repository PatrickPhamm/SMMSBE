using Microsoft.EntityFrameworkCore;
using Smmsbe.Repositories;
using Smmsbe.Repositories.Entities;
using Smmsbe.Repositories.Interfaces;
using Smmsbe.Services.Common;
using Smmsbe.Services.Exceptions;
using Smmsbe.Services.Helpers;
using Smmsbe.Services.Interfaces;
using Smmsbe.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Smmsbe.Services
{
    public class ParentService : IParentService
    {
        private readonly IParentRepository _parentRepository;
        private readonly IStudentRepository _studentRepository;
        private readonly IHashHelper _hashHelper;

        public ParentService(IParentRepository parentRepository, IStudentRepository studentRepository, IHashHelper hashHelper)
        {
            _parentRepository = parentRepository;
            _studentRepository = studentRepository;
            _hashHelper = hashHelper;
        }

        public async Task<Parent> GetById(int id)
        {
            var parent = await _parentRepository.GetById(id);

            return parent;
        }

        /*public async Task<List<ParentResponse>> GetAllAsync()
        {
            var parents = await _parentRepository.GetAll()
                                        .OrderBy(x => x.LastName)
                                        .Select(x => new ParentResponse
                                        {
                                            ParentId = x.ParentId,
                                            Fullname = x.Fullname,
                                            PhoneNumber = x.PhoneNumber,
                                            Email = x.Email
                                        })
                                        .ToListAsync();

            return parents;
        }*/

        public async Task<Parent> AddParentAsync(AddParentRequest request)
        {
            /*if (string.IsNullOrEmpty(request.Username) || request.Username.Length < 4)
                throw AppExceptions.BadRequestUsernameIsInvalid();*/

            // Check if email already exists
            var exstingAcc = await _parentRepository.GetAll().FirstOrDefaultAsync(x => x.Email == request.Email);
            if (exstingAcc != null) throw AppExceptions.BadRequestEmailIsExists();


            var newParentAcc = new Parent
            {
                FullName = request.FullName,
                PasswordHash = _hashHelper.HashPassword(request.PasswordHash),
                PhoneNumber = request.PhoneNumber,
                Email = request.Email,
                Address = request.Address
            };

            return await _parentRepository.Insert(newParentAcc);
        }

        //Authorize dành cho đăng nhập bằng mail
        #region
        /*public async Task<Parent> AuthorizeAsync(string email, string password)
        {
            *//*if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                throw AppExceptions.NotFoundAccount();*//*

            var accPar = await _parentRepository.GetAll().SingleOrDefaultAsync(x => x.Email == email);

            if (accPar == null) throw AppExceptions.NotFoundAccount();

            if (accPar.IsActive == false) throw AppExceptions.AccountNotActivated();

            var passwordHash = _hashHelper.HashPassword(password);

            if (accPar.PasswordHash != passwordHash) throw AppExceptions.NotFoundAccount();

            return accPar;
        }*/
        #endregion

        public async Task<Parent> AuthorizeAsync(string email, string password)
        {
            /*if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                throw AppExceptions.NotFoundAccount();*/

            var accPar = await _parentRepository.GetAll().SingleOrDefaultAsync(x => x.Email == email);

            if (accPar == null) throw AppExceptions.NotFoundAccount();

            var passwordHash = _hashHelper.HashPassword(password);

            if (accPar.PasswordHash != passwordHash) throw AppExceptions.NotFoundAccount();

            return accPar;
        }

        public async Task<Parent> UpdateParentAsync(UpdateParentRequest request)
        {
            var updateParent = await _parentRepository.GetById(request.ParentId);
            if (updateParent == null) throw AppExceptions.NotFoundAccount();

            updateParent.FullName = request.FullName;
            updateParent.PhoneNumber = request.PhoneNumber;
            updateParent.Email = request.Email;
            updateParent.Address = request.Address;

            await _parentRepository.Update(updateParent);
            return updateParent;
        }

        public async Task<List<ParentResponse>> SearchParentAsync(SearchParentRequest request)
        {
            var query = _parentRepository.GetAll();

            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(
                            s => s.ParentId.ToString().Contains(request.Keyword) ||
                            (!string.IsNullOrEmpty(s.FullName) && s.FullName.Contains(request.Keyword)) ||
                            (!string.IsNullOrEmpty(s.PhoneNumber) && s.PhoneNumber.Contains(request.Keyword)));

            var parents = await query.Select(n => new ParentResponse
            {
                ParentId = n.ParentId,
                FullName = n.FullName,
                PhoneNumber = n.PhoneNumber,
                Email = n.Email,
                Address = n.Address
            }).ToListAsync();

            return parents;
        }

        public async Task<bool> DeleteParentAsync(int id)
        {
            try
            {
                var acc = await _parentRepository.GetById(id);
                if (acc == null) throw AppExceptions.NotFoundAccount();

                await _parentRepository.Delete(id);
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
