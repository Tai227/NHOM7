import { Box, Typography, Divider, Link } from "@mui/material";
import FacebookIcon from "@mui/icons-material/Facebook";
import YouTubeIcon from "@mui/icons-material/YouTube";
import InstagramIcon from "@mui/icons-material/Instagram";
import { styled } from "@mui/system";

const FooterContainer = styled(Box)(({ theme }) => ({
  backgroundColor: "#fff",
  padding: "20px 40px",
  borderTop: "2px solid #ff6600",
  [theme.breakpoints.down("sm")]: {
    padding: "20px 15px",
  },
}));

const SocialIcon = styled(Link)(({ theme }) => ({
  margin: "0 10px",
  color: "#ff6600",
  "&:hover": { color: "#e65c00" },
}));

const Footer = () => {
  return (
    <FooterContainer>
      {/* Top section: Services */}
      <Box sx={{ display: "flex", justifyContent: "center", gap: 2, mb: 2 }}>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          4DX
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          IMAX
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          STARIUM
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          GOLD CLASS
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          L’AMOUR
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          SWEETBOX
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          PREMIUM CINEMA
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          SCREENX
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          CINE & FORET
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          CINE & LIVING ROOM
        </Typography>
        <Typography variant="body2" sx={{ color: "#ff6600", fontWeight: "bold" }}>
          CINE & SUITE
        </Typography>
      </Box>

      <Divider sx={{ borderColor: "#ff6600", mb: 3 }} />

      {/* Main content: Columns */}
      <Box
        sx={{
          display: "flex",
          justifyContent: "space-between",
          flexWrap: "wrap",
          gap: 3,
          mb: 3,
        }}
      >
        {/* Column 1: CineGo */}
        <Box sx={{ flex: "1 1 200px" }}>
          <Typography variant="h6" sx={{ fontWeight: "bold", mb: 1 }}>
            CineGo
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Giới Thiệu
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Tiện ích Online
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Thẻ Quà Tặng
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Tuyển Dụng
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Liên Hệ Quảng Cáo CineGo
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Dành cho đối tác
          </Typography>
        </Box>

        {/* Column 2: Điều khoản sử dụng */}
        <Box sx={{ flex: "1 1 200px" }}>
          <Typography variant="h6" sx={{ fontWeight: "bold", mb: 1 }}>
            Điều khoản sử dụng
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Điều Khoản Chung
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Điều Khoản Giao Dịch
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Chính Sách Thanh Toán
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Chính Sách Bảo Mật
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Câu Hỏi Thường Gặp
          </Typography>
        </Box>

        {/* Column 3: Kết nối với chúng tôi */}
        <Box sx={{ flex: "1 1 200px", textAlign: "center" }}>
          <Typography variant="h6" sx={{ fontWeight: "bold", mb: 1 }}>
            Kết nối với chúng tôi
          </Typography>
          <Box sx={{ display: "flex", justifyContent: "center", mb: 0 }}>
            <SocialIcon href="https://www.facebook.com">
              <FacebookIcon />
            </SocialIcon>
            <SocialIcon href="https://www.youtube.com">
              <YouTubeIcon />
            </SocialIcon>
            <SocialIcon href="https://www.instagram.com">
              <InstagramIcon />
            </SocialIcon>
            <SocialIcon href="https://www.zalo.me">
              <img
                src="https://cdn.haitrieu.com/wp-content/uploads/2022/01/Logo-Zalo-Arc.png"
                alt="Zalo"
                style={{ width: 24, height: 24 }}
              />
            </SocialIcon>
          </Box>
          <Box sx={{ display: "flex", justifyContent: "center", mb: 1 }}>
            <Link href="https://www.bocongthuong.gov.vn">
              <img
                src="https://tanhoa.net/timthumb.php?src=upload/sanpham/logo-bct-1583230379.png&w=360&h=454&zc=2&q=100"
                alt="Bộ Công Thương"
                style={{ width: 150 }}
              />
            </Link>
          </Box>
        </Box>

        {/* Column 4: Chăm sóc khách hàng */}
        <Box sx={{ flex: "1 1 200px" }}>
          <Typography variant="h6" sx={{ fontWeight: "bold", mb: 1 }}>
            Chăm sóc khách hàng
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Hotline: 1900 1234
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Giờ làm việc: 8:00 - 22:00 <br /> (Tất cả các ngày bao gồm cả Lễ Tết)
          </Typography>
          <Typography variant="body2" sx={{ mb: 0.5 }}>
            Email hỗ trợ: support@cinego.vn
          </Typography>
        </Box>
      </Box>

      <Divider sx={{ borderColor: "#ff6600", mb: 3 }} />

      {/* Bottom section: Company info */}
      <Box sx={{ display: "flex", alignItems: "center", gap: 2 }}>
        <Typography
          variant="h5"
          sx={{
            fontWeight: 800,
            fontSize: "40px",
            color: "#ff6600",
            fontFamily: "'Jaro', sans-serif",
          }}
        >
          CineGo
        </Typography>
        <Box>
          <Typography variant="body2" sx={{ fontWeight: "bold" }}>
            CÔNG TY TNHH CINEGO VIỆT NAM
          </Typography>
          <Typography variant="body2">
            Giấy chứng nhận đăng ký doanh nghiệp: 0123456789 đăng ký lần đầu ngày 1/1/2025, được cấp bởi Sở Kế hoạch và
            Đầu tư Thành phố Hồ Chí Minh
          </Typography>
          <Typography variant="body2">
            Địa chỉ: số 236B, Đường Lê Văn Sỹ, Phường 1, Quận Tân Bình, Thành phố Hồ Chí Minh, Việt Nam
          </Typography>
          <Typography variant="body2" sx={{ fontWeight: "bold", mt: 1 }}>
            ĐƯỜNG DÂY NÓNG (HOTLINE): 1900 1234
          </Typography>
          <Typography variant="body2">
            COPYRIGHT 2025 CINEGO VIỆT NAM CO., LTD., ALL RIGHTS RESERVED
          </Typography>
        </Box>
      </Box>

      {/* Brick background */}
      <Box
        sx={{
          backgroundImage:
            "url('https://www.cgv.vn/skin/frontend/cgv/images/footer_brick_bg.png')",
          height: 50,
          mt: 2,
        }}
      />
    </FooterContainer>
  );
};

export default Footer;