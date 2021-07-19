package com.mixtest.security;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mixtest.domain.AuthVO;
import com.mixtest.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTest {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	/*
	 * @Test public void testInsertauth() { String sql =
	 * "insert into tbl_auth(userid, userpw, username) values(?,?,?)"; for(int i =
	 * 0;i<100; i++) { Connection con = null; PreparedStatement pstmt = null; try {
	 * con = ds.getConnection(); pstmt = con.prepareStatement(sql);
	 * pstmt.setString(2, pwencoder.encode("pw"+i)); if(i<80) { pstmt.setString(1,
	 * "user"+i); pstmt.setString(3, "일반사용자"+i); }else if(i<90) {
	 * pstmt.setString(1,"manager"+i); pstmt.setString(3, "운영자" +i); }else {
	 * pstmt.setString(1, "admin"+i); pstmt.setString(3, "관리자"+i); }
	 * pstmt.executeUpdate(); }catch(Exception e) { e.printStackTrace(); }finally {
	 * if(pstmt != null) { try {pstmt.close(); }catch(Exception e) {
	 * 
	 * }} if(con != null) { try {con.close();}catch(Exception e) {
	 * 
	 * } } } } }
	 */
	
	/*
	 * @Test public void testInsert() { authVO auth = new authVO(); for(int
	 * i=0; i<100; i++) { auth.setUserpw(pwencoder.encode("pw"+i)); if(i<80) {
	 * auth.setUserid("user"+i); auth.setAuth("일반사용자"+i); }else if(i<90) {
	 * auth.setUserid("manager"+i); auth.setAuth("운영자"+i); }else {
	 * auth.setUserid("admin"+i); auth.setAuth("관리자"+i); }
	 * mapper.insert(auth); } }
	 */
	
	/*
	 * @Test public void testInsertAuth() {
	 * 
	 * AuthVO auth = new AuthVO(); for(int i=0; i<100; i++) {
	 * 
	 * if(i<80) { auth.setUserid("user"+i); auth.setAuth("ROLE_USER"); }else
	 * if(i<90) { auth.setUserid("manager"+i); auth.setAuth("ROLE_MEMBER"); }else {
	 * auth.setUserid("admin"+i); auth.setAuth("ROLE_ADMIN"); }
	 * mapper.insertAuth(auth); } }
	 */
	
}
