import {
  AppBar,
  Toolbar,
  Typography,
  Button,
  InputBase,
  Box,
  Paper,
} from "@mui/material";
import { Link, useNavigate } from "react-router-dom";
import SearchIcon from "@mui/icons-material/Search";
import MovieIcon from "@mui/icons-material/Movie";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { useState } from "react";

export default function ThanhDieuHuong({ onSearch }) {
  const [searchTerm, setSearchTerm] = useState("");
  const navigate = useNavigate();

  const handleSearch = (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      onSearch(searchTerm);
      navigate("/");
    }
  };

  const handleChange = (e) => {
    const term = e.target.value;
    setSearchTerm(term);
    onSearch(term);
    navigate("/");
  };

  return (
    <AppBar position="static" elevation={0} sx={{ backgroundColor: "#f2f2f2", px: 3 }}>
      <Toolbar sx={{ display: "flex", justifyContent: "space-between" }}>
        {/* Logo CineGo */}
        <Typography
          variant="h5"
          component={Link}
          to="/"
          sx={{
            fontWeight: 800,
            fontSize: "40px",
            color: "#ff6600",
            fontFamily: "'Jaro', sans-serif",
            textDecoration: "none",
            "&:hover": { opacity: 0.8 },
          }}
        >
          CineGo
        </Typography>

        {/* Thanh tìm kiếm */}
        <Paper
          component="form"
          sx={{
            display: "flex",
            alignItems: "center",
            backgroundColor: "#1c1c1c",
            borderRadius: "20px",
            pl: 1,
            pr: 2,
            height: 36,
            width: 200,
            mr: 2,
          }}
          onSubmit={(e) => e.preventDefault()}
        >
          <SearchIcon sx={{ color: "#ff6600", fontSize: 20 }} />
          <InputBase
            placeholder="Tìm kiếm"
            sx={{ ml: 1, flex: 1, color: "#fff", fontSize: 14 }}
            value={searchTerm}
            onChange={handleChange}
            onKeyDown={handleSearch}
          />
        </Paper>

        {/* Các nút chức năng */}
        <Box sx={{ display: "flex", gap: 1 }}>

          <Button
            variant="outlined"
            component={Link}
            to="/phim"
            startIcon={<MovieIcon sx={{ color: "#ff6600" }} />}
            sx={{
              color: "#ff6600",
              borderColor: "#ff6600",
              backgroundColor: "#fff",
              textTransform: "none",
              fontWeight: "bold",
              borderRadius: 3,
              "&:hover": { backgroundColor: "#ffe0cc" },
            }}
          >
            Phim
          </Button>
          <Button
            variant="outlined"
            component={Link}
            to="/danh-sach-bai-viet"
            sx={{
              color: "#ff6600",
              borderColor: "#ff6600",
              backgroundColor: "#fff",
              textTransform: "none",
              fontWeight: "bold",
              borderRadius: 3,
              "&:hover": { backgroundColor: "#ffe0cc" },
            }}
          >
            Bài viết
          </Button>
          {/* Đăng nhập / Đăng ký */}
          <Box
            sx={{
              display: "flex",
              border: "1px solid #ff6600",
              borderRadius: 3,
              overflow: "hidden",
              backgroundColor: "#fff",
              alignItems: "center",
            }}
          >
            <AccountCircleIcon sx={{ color: "#ff6600", ml: 1 }} />
            <Button
              component={Link}
              to="/dang-nhap"
              sx={{
                color: "#ff6600",
                textTransform: "none",
                fontWeight: "bold",
                borderRight: "1px solid #ff6600",
                borderRadius: 0,
                px: 2,
                "&:hover": { backgroundColor: "#ffe0cc" },
              }}
            >
              Đăng nhập
            </Button>
            <Button
              component={Link}
              to="/dang-ky"
              sx={{
                color: "#ff6600",
                textTransform: "none",
                fontWeight: "bold",
                borderRadius: 0,
                px: 2,
                "&:hover": { backgroundColor: "#ffe0cc" },
              }}
            >
              Đăng ký
            </Button>
          </Box>
        </Box>
      </Toolbar>
    </AppBar>
  );
}
