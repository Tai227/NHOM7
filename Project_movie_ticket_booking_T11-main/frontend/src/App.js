// import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
// import { CssBaseline } from "@mui/material";
// import BoCucChung from "./layouts/BoCucChung";
// import TrangChu from "./pages/TrangChu";
// import DanhSachPhim from "./pages/DanhSachPhim";
// import DatVe from "./pages/DatVe";
// import ThanhToan from './pages/ThanhToan';
// import { useState } from "react"; // Thêm useState để quản lý từ khóa tìm kiếm

// function App() {
//   const [searchTerm, setSearchTerm] = useState(""); // State để lưu từ khóa tìm kiếm

//   // Hàm xử lý tìm kiếm
//   const handleSearch = (term) => {
//     setSearchTerm(term);
//   };

//   return (
//     <Router>
//       <CssBaseline />
//       <BoCucChung onSearch={handleSearch}> {/* Truyền prop onSearch xuống BoCucChung */}
//         <Routes>
//           <Route index element={<TrangChu searchTerm={searchTerm} />} /> {/* Truyền searchTerm xuống TrangChu */}
//           <Route path="/phim" element={<DanhSachPhim />} />
//           <Route path="/dat-ve/:id" element={<DatVe />} /> {/* Cập nhật route để nhận ID phim */}
//           <Route path="/thanh-toan" element={<ThanhToan />} />
//         </Routes>
//       </BoCucChung>
//     </Router>
//   );
// }

// export default App;

import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { CssBaseline } from "@mui/material";
// import Navbar from "./components/Navbar";
import BoCucChung from "./layouts/BoCucChung";
import TrangChu from "./pages/TrangChu";
import DanhSachPhim from "./pages/DanhSachPhim";
import DatVe from "./pages/DatVe";
import ThanhToan from './pages/ThanhToan';
import ThongTinVe from "./pages/ThongTinVe";
// import ThongTinVe from "./pages/XemVeDaDat";
import DangNhap from "./pages/DangNhap";
import DangKy from "./pages/DangKy";
import ChiTietPhim from "./pages/ChiTietPhim"; // Import trang chi tiết phim
import { useState } from "react"; // useState để quản lý từ khóa tìm kiếm
import DanhSachBaiViet from "./pages/DanhSachBaiViet";
import BaiViet from "./pages/BaiViet";

function App() {
  const [searchTerm, setSearchTerm] = useState(""); // State để lưu từ khóa tìm kiếm

  // Hàm xử lý tìm kiếm
  const handleSearch = (term) => {
    setSearchTerm(term);
  };

  return (
    <Router>
      <CssBaseline />
      <BoCucChung onSearch={handleSearch}> {/* Truyền prop onSearch xuống BoCucChung */}
        <Routes>
          <Route index element={<TrangChu searchTerm={searchTerm} />} />
          <Route path="/phim" element={<DanhSachPhim />} />
          <Route path="/dat-ve/:id" element={<DatVe />} />
          <Route path="/thanh-toan" element={<ThanhToan />} />
          <Route path="/thong-tin-ve" element={<ThongTinVe />} />
          <Route path="/danh-sach-bai-viet" element={<DanhSachBaiViet />} />
          <Route path="/bai-viet/:id" element={<BaiViet />} />
          <Route path="/chi-tiet-phim/:id" element={<ChiTietPhim />} />

          {/* ✅ Thêm các route cho đăng nhập và đăng ký */}
          <Route path="/dang-nhap" element={<DangNhap />} />
          <Route path="/dang-ky" element={<DangKy />} />
        </Routes>
      </BoCucChung>
    </Router>
  );
}

export default App;
