import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { dangNhap, forgotPassword, resetPassword } from "../services/nguoidungService";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { motion } from "framer-motion";
import {
  Container,
  Box,
  Typography,
  TextField,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
} from "@mui/material";

function ĐăngNhap() {
  const [formData, setFormData] = useState({
    ten_dang_nhap: "",
    mat_khau: "",
  });
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [showForgotPasswordModal, setShowForgotPasswordModal] = useState(false);
  const [showResetPasswordModal, setShowResetPasswordModal] = useState(false);
  const [forgotEmail, setForgotEmail] = useState("");
  const [resetData, setResetData] = useState({
    email: "",
    code: "",
    new_password: "",
    confirm_password: "",
  });
  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
    setError("");
  };

  const handleResetChange = (e) => {
    setResetData({ ...resetData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      const res = await dangNhap(formData);
      localStorage.setItem("nguoi_dung", JSON.stringify(res.nguoi_dung));
      localStorage.setItem("vai_tro", JSON.stringify(res.vai_tro));
      toast.success("Đăng nhập thành công");
      setTimeout(() => {
        navigate("/");
      }, 1500);
    } catch (error) {
      if (error.error) {
        setError(error.error);
        toast.error(error.error);
      } else {
        setError("Đã có lỗi xảy ra. Vui lòng thử lại!");
        toast.error("Đã có lỗi xảy ra. Vui lòng thử lại!");
      }
    } finally {
      setIsLoading(false);
    }
  };

  const handleForgotPassword = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      await forgotPassword(forgotEmail);
      toast.success("Mã xác nhận đã được gửi đến email của bạn!");
      setShowForgotPasswordModal(false);
      setResetData({ ...resetData, email: forgotEmail });
      setShowResetPasswordModal(true);
    } catch (error) {
      toast.error(error.message || "Gửi yêu cầu thất bại!");
    } finally {
      setIsLoading(false);
    }
  };

  const handleResetPassword = async (e) => {
    e.preventDefault();
    setIsLoading(true);

    if (resetData.new_password !== resetData.confirm_password) {
      toast.error("Mật khẩu xác nhận không khớp!");
      setIsLoading(false);
      return;
    }

    try {
      await resetPassword(resetData.email, resetData.code, resetData.new_password);
      toast.success("Đặt lại mật khẩu thành công! Vui lòng đăng nhập lại.");
      setShowResetPasswordModal(false);
      setResetData({ email: "", code: "", new_password: "", confirm_password: "" });
    } catch (error) {
      toast.error(error.message || "Đặt lại mật khẩu thất bại!");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Container
      sx={{
        minHeight: "100vh",
        bgcolor: "white",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <Box sx={{ maxWidth: 400, width: "100%", p: 2 }}>
        <motion.div
          initial={{ y: -20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2 }}
        >
          <Box sx={{ bgcolor: "#ff6600", py: 1, mb: 3 }}>
            <Typography
              variant="h5"
              sx={{ color: "white", textAlign: "center", fontWeight: "bold" }}
            >
              ĐĂNG NHẬP
            </Typography>
          </Box>
        </motion.div>

        <form onSubmit={handleSubmit}>
          <Box sx={{ mb: 3 }}>
            <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
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

          <Box sx={{ mb: 3 }}>
            <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
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

          {error && (
            <Typography
              variant="body2"
              color="error"
              sx={{ mt: 1, textAlign: "center" }}
            >
              {error}
            </Typography>
          )}

          {isLoading && (
            <Typography
              variant="body2"
              sx={{ mt: 1, color: "#ff6600", textAlign: "center" }}
            >
              Đang tải...
            </Typography>
          )}

          <Box
            sx={{
              display: "flex",
              justifyContent: "space-between",
              mt: 3,
              gap: 2,
            }}
          >
            <motion.div whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
              <Button
                type="submit"
                variant="contained"
                sx={{
                  bgcolor: "#ff6600",
                  color: "white",
                  fontSize: "14px",
                  px: 3,
                  py: 0.5,
                  flex: 1,
                  "&:hover": { bgcolor: "#e65500" },
                }}
              >
                Đăng nhập
              </Button>
            </motion.div>
            <motion.div whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
              <Button
                type="button"
                variant="contained"
                onClick={() => setShowForgotPasswordModal(true)}
                sx={{
                  bgcolor: "#ff6600",
                  color: "white",
                  fontSize: "14px",
                  px: 3,
                  py: 0.5,
                  flex: 1,
                  "&:hover": { bgcolor: "#e65500" },
                }}
              >
                Quên mật khẩu?
              </Button>
            </motion.div>
          </Box>
        </form>
      </Box>

      {/* Modal Quên Mật Khẩu */}
      <Dialog
        open={showForgotPasswordModal}
        onClose={() => setShowForgotPasswordModal(false)}
        sx={{
          "& .MuiDialog-paper": {
            width: "500px", // Tăng chiều rộng
            maxWidth: "90%", // Giới hạn tối đa theo tỷ lệ màn hình
          },
        }}
      >
        <DialogTitle sx={{ textAlign: "center", fontWeight: "bold" }}>
          Quên Mật Khẩu
        </DialogTitle>
        <DialogContent>
          <form onSubmit={handleForgotPassword}>
            <Box sx={{ mb: 2, mt: 1 }}>
              <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
                Email xác nhận:
              </Typography>
              <TextField
                type="email"
                value={forgotEmail}
                onChange={(e) => setForgotEmail(e.target.value)}
                placeholder="Nhập Email của bạn"
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

            {isLoading && (
              <Typography
                variant="body2"
                sx={{ mt: 1, color: "#ff6600", textAlign: "center" }}
              >
                Đang tải...
              </Typography>
            )}
          </form>
        </DialogContent>
        <DialogActions sx={{ justifyContent: "center", pb: 3 }}>
          <motion.div whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
            <Button
              onClick={handleForgotPassword}
              variant="contained"
              sx={{
                bgcolor: "#ff6600",
                color: "white",
                fontSize: "14px",
                px: 3,
                py: 0.5,
                "&:hover": { bgcolor: "#e65500" },
              }}
            >
              Gửi Mã Xác Nhận
            </Button>
          </motion.div>
        </DialogActions>
      </Dialog>

      {/* Modal Đặt Lại Mật Khẩu */}
      <Dialog
        open={showResetPasswordModal}
        onClose={() => setShowResetPasswordModal(false)}
        sx={{
          "& .MuiDialog-paper": {
            width: "500px", // Tăng chiều rộng
            maxWidth: "90%", // Giới hạn tối đa theo tỷ lệ màn hình
          },
        }}
      >
        <DialogTitle sx={{ textAlign: "center", fontWeight: "bold" }}>
          Đặt Lại Mật Khẩu
        </DialogTitle>
        <DialogContent>
          <form onSubmit={handleResetPassword}>
            <Box sx={{ mb: 2, mt: 1 }}>
              <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
                Mã Xác Nhận:
              </Typography>
              <TextField
                type="text"
                name="code"
                value={resetData.code}
                onChange={handleResetChange}
                placeholder="Mã Xác Nhận"
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

            <Box sx={{ mb: 2 }}>
              <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
                Mật Khẩu Mới:
              </Typography>
              <TextField
                type="password"
                name="new_password"
                value={resetData.new_password}
                onChange={handleResetChange}
                placeholder="Mật Khẩu Mới"
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

            <Box sx={{ mb: 2 }}>
              <Typography variant="body2" sx={{ mb: 1, fontWeight: "medium" }}>
                Xác Nhận Mật Khẩu:
              </Typography>
              <TextField
                type="password"
                name="confirm_password"
                value={resetData.confirm_password}
                onChange={handleResetChange}
                placeholder="Xác Nhận Mật Khẩu"
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

            {isLoading && (
              <Typography
                variant="body2"
                sx={{ mt: 1, color: "#ff6600", textAlign: "center" }}
              >
                Đang tải...
              </Typography>
            )}
          </form>
        </DialogContent>
        <DialogActions sx={{ justifyContent: "center", pb: 3 }}>
          <motion.div whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}>
            <Button
              onClick={handleResetPassword}
              variant="contained"
              sx={{
                bgcolor: "#ff6600",
                color: "white",
                fontSize: "14px",
                px: 3,
                py: 0.5,
                "&:hover": { bgcolor: "#e65500" },
              }}
            >
              Đặt Lại Mật Khẩu
            </Button>
          </motion.div>
        </DialogActions>
      </Dialog>

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

export default ĐăngNhap;