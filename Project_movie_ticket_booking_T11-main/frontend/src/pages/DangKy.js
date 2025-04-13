import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { dangKy } from "../services/nguoidungService";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { motion } from "framer-motion";
import {
  Container,
  Box,
  Typography,
  TextField,
  Button,
} from "@mui/material";

function ĐăngKý() {
  const [formData, setFormData] = useState({
    ten_dang_nhap: "",
    ten: "",
    email: "",
    mat_khau: "",
  });
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
    setError("");
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      await dangKy(formData);
      toast.success("Đăng ký thành công! Vui lòng đăng nhập.");
      setTimeout(() => {
        navigate("/dang-nhap");
      }, 1500);
    } catch (error) {
      const message = error.message || "Đăng ký thất bại!";
      setError(message);
      toast.error(message);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Container
      sx={{
        minHeight: "100vh",
        bgcolor: "white",
        display: "flex", // Use flexbox to center content
        justifyContent: "center", // Center horizontally
        alignItems: "center", // Center vertically
        p: 2,
      }}
    >
      <Box sx={{ maxWidth: 400, width: "100%" }}>
        {/* Tiêu đề */}
        <motion.div
          initial={{ y: -20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2 }}
        >
          <Box sx={{ bgcolor: "#ff6600", py: 1, mb: 2 }}>
            <Typography
              variant="h5"
              sx={{ color: "white", textAlign: "center", fontWeight: "bold" }}
            >
              ĐĂNG KÝ
            </Typography>
          </Box>
        </motion.div>

        <form onSubmit={handleSubmit}>
          {/* Tên đăng nhập */}
          <Box sx={{ mb: 2 }}>
            <Typography variant="body2" sx={{ mb: 1 }}>
              Tên đăng nhập:
            </Typography>
            <TextField
              name="ten_dang_nhap"
              value={formData.ten_dang_nhap}
              onChange={handleChange}
              placeholder="Tên đăng nhập"
              fullWidth
              variant="standard"
              InputProps={{
                disableUnderline: false,
                sx: {
                  "& .MuiInputBase-input": {
                    padding: "4px 0",
                    fontSize: "14px",
                    borderBottom: "1px solid #ccc",
                    "&:focus": {
                      borderBottom: "1px solid #ff6600",
                    },
                  },
                },
              }}
              required
            />
          </Box>

          {/* Tên */}
          <Box sx={{ mb: 2 }}>
            <Typography variant="body2" sx={{ mb: 1 }}>
              Tên:
            </Typography>
            <TextField
              name="ten"
              value={formData.ten}
              onChange={handleChange}
              placeholder="Tên"
              fullWidth
              variant="standard"
              InputProps={{
                disableUnderline: false,
                sx: {
                  "& .MuiInputBase-input": {
                    padding: "4px 0",
                    fontSize: "14px",
                    borderBottom: "1px solid #ccc",
                    "&:focus": {
                      borderBottom: "1px solid #ff6600",
                    },
                  },
                },
              }}
              required
            />
          </Box>

          {/* Email */}
          <Box sx={{ mb: 2 }}>
            <Typography variant="body2" sx={{ mb: 1 }}>
              Email:
            </Typography>
            <TextField
              name="email"
              type="email"
              value={formData.email}
              onChange={handleChange}
              placeholder="Email"
              fullWidth
              variant="standard"
              InputProps={{
                disableUnderline: false,
                sx: {
                  "& .MuiInputBase-input": {
                    padding: "4px 0",
                    fontSize: "14px",
                    borderBottom: "1px solid #ccc",
                    "&:focus": {
                      borderBottom: "1px solid #ff6600",
                    },
                  },
                },
              }}
              required
            />
          </Box>

          {/* Mật khẩu */}
          <Box sx={{ mb: 2 }}>
            <Typography variant="body2" sx={{ mb: 1 }}>
              Mật khẩu:
            </Typography>
            <TextField
              name="mat_khau"
              type="password"
              value={formData.mat_khau}
              onChange={handleChange}
              placeholder="Mật khẩu"
              fullWidth
              variant="standard"
              InputProps={{
                disableUnderline: false,
                sx: {
                  "& .MuiInputBase-input": {
                    padding: "4px 0",
                    fontSize: "14px",
                    borderBottom: "1px solid #ccc",
                    "&:focus": {
                      borderBottom: "1px solid #ff6600",
                    },
                  },
                },
              }}
              required
            />
          </Box>

          {/* Thông báo lỗi */}
          {error && (
            <Typography variant="body2" color="error" sx={{ mt: 1 }}>
              {error}
            </Typography>
          )}

          {/* Trạng thái đang tải */}
          {isLoading && (
            <Typography variant="body2" sx={{ mt: 1, color: "#ff6600" }}>
              Đang tải...
            </Typography>
          )}

          {/* Nút đăng ký */}
          <motion.div whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
            <Button
              type="submit"
              variant="contained"
              sx={{
                mt: 1,
                bgcolor: "#ff6600",
                color: "white",
                fontSize: "14px",
                px: 2,
                py: 0.5,
                "&:hover": { bgcolor: "#e65500" },
              }}
            >
              Đăng ký
            </Button>
          </motion.div>
        </form>
      </Box>

      <ToastContainer
        position="top-right"
        autoClose={1500}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
      />
    </Container>
  );
}

export default ĐăngKý;