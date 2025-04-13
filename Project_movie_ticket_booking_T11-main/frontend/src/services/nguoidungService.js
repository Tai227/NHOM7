// import axios from "axios";

// const API_BASE_URL = "http://localhost:8000/api"; // Đúng với backend

// export const dangNhap = async (formData) => {
//   try {
//     const res = await axios.post(`${API_BASE_URL}/dang_nhap/`, {
//       ten_dang_nhap: formData.ten_dang_nhap,
//       mat_khau: formData.mat_khau,
//     });
//     return res.data;
//   } catch (error) {
//     // Ném lỗi để frontend xử lý chi tiết
//     throw error.response.data;
//   }
// };

// export const dangKy = async (formData) => {
//   try {
//     const res = await axios.post(`${API_BASE_URL}/dang-ky/`, formData);
//     return res.data;
//   } catch (error) {
//     throw error.response.data;
//   }
// };


// src/services/nguoidungService.js
import axios from "axios";

const API_URL = "http://localhost:8000/api";

// Hàm đăng nhập (sửa endpoint để khớp với backend)
export const dangNhap = async (formData) => {
  try {
    const res = await axios.post(`${API_URL}/nguoi_dung/dang_nhap/`, {
      ten_dang_nhap: formData.ten_dang_nhap,
      mat_khau: formData.mat_khau,
    });
    return res.data;
  } catch (error) {
    throw error.response.data;
  }
};

// Hàm đăng ký
export const dangKy = async (formData) => {
  try {
    const response = await axios.post(`${API_URL}/nguoi_dung/dang-ky/`, formData); // endpoint cho đăng ký
    return response.data;
  } catch (error) {
    throw new Error(error.response?.data?.error || "Đăng ký thất bại!");
  }
};

// Hàm gửi yêu cầu quên mật khẩu
export const forgotPassword = async (email) => {
  try {
    const response = await axios.post(`${API_URL}/forgot-password/`, { email });
    return response.data;
  } catch (error) {
    throw new Error(error.response?.data?.error || "Gửi yêu cầu thất bại!");
  }
};

// Hàm đặt lại mật khẩu
export const resetPassword = async (email, code, new_password) => {
  try {
    const response = await axios.post(`${API_URL}/reset-password/`, { email, code, new_password });
    return response.data;
  } catch (error) {
    throw new Error(error.response?.data?.error || "Đặt lại mật khẩu thất bại!");
  }
};