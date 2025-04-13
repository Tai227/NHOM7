import axios from "axios";

export const layDanhSachPhim = async () => {
  try {
    const response = await axios.get("http://localhost:8000/api/phim/");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách phim:", error);
    return [];
  }
};

// Hàm lấy thông tin chi tiết phim theo ID từ API
export const layPhimTheoId = async (phimId) => {
  try {
    const response = await axios.get(`http://localhost:8000/api/phim/${phimId}/`); // Gọi API để lấy thông tin phim theo ID
    return response.data; // Trả về dữ liệu phim
  } catch (error) {
    console.error("Lỗi khi lấy thông tin phim:", error); // Log lỗi nếu có
    throw new Error("Không thể lấy thông tin phim"); // Ném lỗi để xử lý ở component
  }
};