﻿using System.Runtime.Intrinsics.Arm;
using System.Security.Cryptography;
using System.Text;

namespace FixTimeBack.Custom
{
    public class PasswordHasher : IPasswordHasher
    {
        public string Encryptsha256(string text)
        {
            using(SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(text));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();

            }
        }
    }
}
