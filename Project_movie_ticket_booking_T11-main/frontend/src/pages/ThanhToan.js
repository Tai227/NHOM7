import React, { useState, useEffect } from "react";
import {
  Typography,
  Box,
  TextField,
  MenuItem,
  Button,
  CircularProgress,
  Alert,
  Card,
  CardMedia,
  CardContent,
} from "@mui/material";
import { useLocation, useNavigate } from "react-router-dom";
import { thanhToan } from "../services/veService";

const ThanhToan = () => {
  const location = useLocation();
  const navigate = useNavigate();

  const {
    veIds = [],
    phim,
    chiNhanhTen = "Chưa chọn",
    lichChieuText = "Chưa chọn",
    phong = "Chưa chọn",
    gheDaChon = "Chưa chọn",
  } = location.state || {};

  const [soLuong] = useState(veIds.length || 0);
  const [phuongThucThanhToan, setPhuongThucThanhToan] = useState("");
  const [trangThai] = useState(0);
  const [trangThaiText] = useState("Chưa thanh toán");
  const [nguonGoc, setNguonGoc] = useState("");
  const [tongGiaVe, setTongGiaVe] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(null);

  const paymentMethods = ["Thẻ tín dụng", "Chuyển khoản"];
  const sources = ["Online"];

  useEffect(() => {
    if (phim && phim.gia_ve && soLuong) {
      const giaVe = parseFloat(phim.gia_ve);
      const tongGia = giaVe * soLuong;
      setTongGiaVe(tongGia);
    } else {
      setTongGiaVe(0);
    }
  }, [phim, soLuong]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!phuongThucThanhToan || !nguonGoc) {
      setError("Vui lòng chọn phương thức thanh toán và nguồn gốc!");
      return;
    }

    const thanhToanData = {
      phuongthucthanhtoan: phuongThucThanhToan,
      trangthai: trangThai,
      ve: veIds,
      nguoidung: 6,
      tong_gia_ve: tongGiaVe ? Math.round(tongGiaVe) : null,
    };

    try {
      setLoading(true);
      setError(null);
      setSuccess(null);

      console.log("Dữ liệu gửi đi:", thanhToanData);
      await thanhToan(thanhToanData);
      setSuccess("Thanh toán thành công!");

      setTimeout(() => {
        navigate("/thong-tin-ve", {
          state: {
            veIds,
            phim,
            chiNhanhTen,
            lichChieuText,
            phong,
            gheDaChon,
            phuongThucThanhToan,
            nguonGoc,
            tongGiaVe,
          },
        });
      }, 2000);
    } catch (err) {
      setError("Thanh toán thất bại: " + err.message);
      console.error("Lỗi chi tiết:", err.response ? err.response.data : err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <Box sx={{ padding: "20px", backgroundColor: "#FFFFFF", color: "#000000", minHeight: "100vh" }}>
      <Box sx={{ maxWidth: 1200, margin: "0 auto" }}>
        <Typography
          variant="h4"
          gutterBottom
          sx={{
            textAlign: "center",
            color: "#000000",
            // borderBottom: "2px solid #000000",
            // paddingBottom: "8px",
          }}
        >
          Thanh Toán
        </Typography>

        {loading && (
          <Box sx={{ display: "flex", justifyContent: "center", my: 2 }}>
            <CircularProgress sx={{ color: "#FF6200" }} />
          </Box>
        )}

        {error && (
          <Box sx={{ my: 2 }}>
            <Alert
              severity="error"
              sx={{
                backgroundColor: "#FFFFFF",
                color: "#000000",
                border: "1px solid #000000",
                "& .MuiAlert-icon": { color: "#000000" },
              }}
            >
              {error}
            </Alert>
          </Box>
        )}

        {success && (
          <Box sx={{ my: 2 }}>
            <Alert
              severity="success"
              sx={{
                backgroundColor: "#FFFFFF",
                color: "#000000",
                border: "1px solid #000000",
                "& .MuiAlert-icon": { color: "#000000" },
              }}
            >
              {success}
            </Alert>
          </Box>
        )}

        {phim && (
          <Card
            sx={{
              maxWidth: 300,
              margin: "0 auto",
              mb: 4,
              backgroundColor: "#FFFFFF",
              color: "#000000",
              border: "1px solid #000000",
              boxShadow: "0 2px 8px rgba(0, 0, 0, 0.1)",
            }}
          >
            <CardMedia
              component="img"
              height="20%"
              width="40%"
              image={phim.duong_dan_anh}
              alt={phim.ten}
            />
            <CardContent sx={{ textAlign: "center" }}>
              <Typography variant="body1" fontWeight="bold" color="#000000">
                Tên phim: {phim.ten}
              </Typography>
              <Typography variant="body2" color="#000000">
                Giá vé: {phim.gia_ve ? phim.gia_ve.toLocaleString("vi-VN") + " VNĐ" : "Chưa có giá"}
              </Typography>
            </CardContent>
          </Card>
        )}

        <Box sx={{ mb: 4, textAlign: "center" }}>
          <Typography variant="body1" sx={{ color: "#000000" }}>
            Chi nhánh đã chọn: <span style={{ color: "#000000" }}>{chiNhanhTen}</span>
          </Typography>
          <Typography variant="body1" sx={{ color: "#000000" }}>
            Lịch chiếu đã chọn: <span style={{ color: "#000000" }}>{lichChieuText}</span>
          </Typography>
          <Typography variant="body1" sx={{ color: "#000000" }}>
            Phòng: <span style={{ color: "#000000" }}>{phong}</span>
          </Typography>
          <Typography variant="body1" sx={{ color: "#000000" }}>
            Ghế đã chọn: <span style={{ color: "#000000" }}>{gheDaChon}</span>
          </Typography>
        </Box>

        <Box
          sx={{
            maxWidth: 600,
            margin: "0 auto",
            backgroundColor: "#FFFFFF",
            padding: "20px",
            borderRadius: "8px",
            border: "1px solid #000000",
            boxShadow: "0 2px 8px rgba(0, 0, 0, 0.1)",
          }}
        >
          <Typography variant="h6" gutterBottom sx={{ color: "#000000", textAlign: "center" }}>
            Thông tin thanh toán
          </Typography>

          <form onSubmit={handleSubmit}>
            <Box sx={{ mb: 2 }}>
              <TextField
                label="Số lượng"
                value={soLuong}
                fullWidth
                disabled
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
              />
            </Box>

            <Box sx={{ mb: 2 }}>
              <TextField
                select
                label="Phương thức thanh toán"
                value={phuongThucThanhToan}
                onChange={(e) => setPhuongThucThanhToan(e.target.value)}
                fullWidth
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
                SelectProps={{
                  MenuProps: {
                    PaperProps: {
                      style: { backgroundColor: "#FFFFFF", color: "#000000", border: "1px solid #000000" },
                    },
                  },
                }}
              >
                {paymentMethods.map((method) => (
                  <MenuItem key={method} value={method}>
                    {method}
                  </MenuItem>
                ))}
              </TextField>
            </Box>

            <Box sx={{ mb: 2 }}>
              <TextField
                label="Trạng thái"
                value={trangThaiText}
                fullWidth
                disabled
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
              />
            </Box>

            <Box sx={{ mb: 2 }}>
              <TextField
                select
                label="Nguồn gốc"
                value={nguonGoc}
                onChange={(e) => setNguonGoc(e.target.value)}
                fullWidth
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
                SelectProps={{
                  MenuProps: {
                    PaperProps: {
                      style: { backgroundColor: "#FFFFFF", color: "#000000", border: "1px solid #000000" },
                    },
                  },
                }}
              >
                {sources.map((source) => (
                  <MenuItem key={source} value={source}>
                    {source}
                  </MenuItem>
                ))}
              </TextField>
            </Box>

            <Box sx={{ mb: 2 }}>
              <TextField
                label="Tổng giá vé"
                value={tongGiaVe ? tongGiaVe.toLocaleString("vi-VN") + " VNĐ" : "0 VNĐ"}
                fullWidth
                disabled
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
              />
            </Box>

            <Box sx={{ mb: 2 }}>
              <TextField
                label="Vé"
                value={veIds.join(", ")}
                fullWidth
                disabled
                InputLabelProps={{ style: { color: "#000000" } }}
                InputProps={{ style: { color: "#000000", backgroundColor: "#F5F5F5" } }}
                sx={{
                  "& .MuiOutlinedInput-root": {
                    "& fieldset": { borderColor: "#000000" },
                    "&:hover fieldset": { borderColor: "#000000" },
                    "&.Mui-focused fieldset": { borderColor: "#000000" },
                  },
                }}
              />
            </Box>

            <Box sx={{ textAlign: "center" }}>
              <Button
                type="submit"
                variant="contained"
                sx={{
                  backgroundColor: "#FF6200",
                  color: "#FFFFFF",
                  fontWeight: "bold",
                  "&:hover": { backgroundColor: "#E65500" },
                }}
                disabled={loading}
              >
                Xác nhận thanh toán
              </Button>
            </Box>
          </form>
        </Box>
      </Box>
    </Box>
  );
};

export default ThanhToan;