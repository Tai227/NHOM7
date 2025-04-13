import axios from "axios";

// Hàm lấy danh sách chi nhánh
export const layDanhSachChiNhanh = async () => {
  try {
    const response = await axios.get("http://localhost:8000/api/chi_nhanh/");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách chi nhánh:", error);
    return [];
  }
};

// Hàm lấy danh sách phòng
export const layDanhSachPhong = async () => {
  try {
    const response = await axios.get("http://localhost:8000/api/phong/");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách phòng:", error);
    return [];
  }
};

// Hàm lấy danh sách lịch chiếu theo phim
export const layLichChieuTheoPhim = async (phimId) => {
  try {
    const response = await axios.get("http://localhost:8000/api/lich_chieu/", {
      params: { phim_id: phimId },
    });
    console.log("Dữ liệu lịch chiếu từ API:", response.data);
    if (!response.data || response.data.length === 0) {
      console.warn(`Không có lịch chiếu cho phim ID: ${phimId}`);
    }
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy lịch chiếu:", error);
    return [];
  }
};

// Hàm lấy danh sách ghế theo lịch chiếu
export const layDanhSachGhe = async (lichChieuId) => {
  try {
    const response = await axios.get("http://localhost:8000/api/ghe/", {
      params: { lich_chieu_id: lichChieuId },
    });
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách ghế:", error);
    return [];
  }
};

// Hàm đặt vé
export const datVe = async (veData) => {
  try {
    const response = await axios.post("http://localhost:8000/api/ve/", veData);
    return response.data;
  } catch (error) {
    console.error("Lỗi khi đặt vé:", error);
    throw error;
  }
};

// Hàm tạo thanh toán
export const thanhToan = async (thanhToanData) => {
  try {
    const response = await axios.post("http://localhost:8000/api/thanh_toan/", thanhToanData);
    if (response.status !== 201) {
      throw new Error(`Thanh toán thất bại! Status: ${response.status}`);
    }
    return response.data;
  } catch (error) {
    console.error("Lỗi khi tạo thanh toán:", error.response ? error.response.data : error.message);
    throw error;
  }
};