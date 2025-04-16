import { Box } from "@mui/material";
import ThanhDieuHuong from "../components/ThanhDieuHuong";
import Footer from "../components/Footer";

export default function BoCucChung({ children, onSearch }) {
  return (
    <Box sx={{ display: "flex", flexDirection: "column", minHeight: "100vh" }}>
      {/* Thanh điều hướng */}
      <ThanhDieuHuong onSearch={onSearch} />

      {/* Nội dung chính */}
      <Box component="main" sx={{ flex: 1 }}>
        {children}
      </Box>

      {/* Footer */}
      <Footer />
    </Box>
  );
}