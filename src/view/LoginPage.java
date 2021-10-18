package view;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import model.FitnessDao;
import model.MemberVo;

public class LoginPage extends JFrame implements ActionListener{
	
	private JTextField IDtextField;
	JPasswordField PWField;
	JButton memButton, traButton ,mLogin_Button, tLogin_Button,
			JoinButton, IdSearchButton, PWSearchButton, BackButton;
	private String idcheck ;
	
	private FitnessDao fDao;
	
	public LoginPage(){
		
		this.setTitle("회원 로그인 화면");
		getContentPane().setLayout(null);
		
		
		
		JLabel lblNewLabel = new JLabel("로그인");
		lblNewLabel.setBounds(0, 22, 434, 27);
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("굴림", Font.BOLD, 23));
		getContentPane().add(lblNewLabel);
		
		JLabel Label_ID = new JLabel("ID : ");
		Label_ID.setBounds(36, 68, 57, 15);
		getContentPane().add(Label_ID);
		
		JLabel Label_PW = new JLabel("PW : ");
		Label_PW.setBounds(36, 119, 57, 15);
		getContentPane().add(Label_PW);

		//기관 소개
		String fmt="%s \n %s";
		String info1="OO Fitness   TEL: 0000-0000-0000";
		String info2="주소: OO시 OO동 OO로 01-23";
		String info=String.format(fmt,info1,info2);
		JLabel Label_Info = new JLabel(info);
		Label_Info.setBounds(36, 250, 500, 50);
		getContentPane().add(Label_Info);
		
		
		memButton = new JButton("회원");
		//memButton.setBounds(260, 10, 81, 20);
		memButton.setBounds(100, 10, 81, 20);
		getContentPane().add(memButton);
		
		traButton = new JButton("트레이너");
		traButton.setBounds(250, 10, 97, 20);
		getContentPane().add(traButton);
		
		mLogin_Button = new JButton("로그인");
		mLogin_Button.setBounds(16, 183, 81, 30);
		getContentPane().add(mLogin_Button);
		
		tLogin_Button = new JButton("로그인");
		tLogin_Button.setBounds(120, 153, 200, 30);
		getContentPane().add(tLogin_Button);
		this.tLogin_Button.setVisible(false);
		
		JoinButton = new JButton("회원가입");
		JoinButton.setBounds(109, 183, 97, 30);
		getContentPane().add(JoinButton);
		
		IdSearchButton = new JButton("ID 찾기");		
		IdSearchButton.setBounds(218, 183, 81, 30);
		getContentPane().add(IdSearchButton);
		
		PWSearchButton = new JButton("PW 찾기");
		PWSearchButton.setBounds(311, 183, 97, 30);
		getContentPane().add(PWSearchButton);
		
		IDtextField = new JTextField();
		IDtextField.setToolTipText("내용을 입력해주세요");
		IDtextField.setBounds(125, 65, 219, 25);
		getContentPane().add(IDtextField);
		IDtextField.setColumns(10);
		
		PWField = new JPasswordField();
		PWField.setToolTipText("내용을 입력해주세요");
		PWField.setColumns(10);
		PWField.setBounds(125, 116, 219, 25);
		getContentPane().add(PWField);
		
		BackButton = new JButton("<이전");
		BackButton.setBounds(16, 10, 80, 27);
		getContentPane().add(BackButton);
		
		this.BackButton.addActionListener(this);
		this.JoinButton.addActionListener(this);
		this.IdSearchButton.addActionListener(this);
		this.PWSearchButton.addActionListener(this);
		this.mLogin_Button.addActionListener(this);
		this.tLogin_Button.addActionListener(this);
		this.memButton.addActionListener(this);
		this.traButton.addActionListener(this);
		
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(450,360);
		this.setResizable(false);
		this.setLocationRelativeTo(null);
		this.setVisible(true);

	}
	
	public static void main(String[] args) {
		new LoginPage();
	}
	
	//활성화 비활성화 조절
	public void turnOnOff(Boolean check){
		this.mLogin_Button.setVisible(check);
		this.JoinButton.setVisible(check);
		this.IdSearchButton.setVisible(check);
		this.PWSearchButton.setVisible(check);
		
		this.tLogin_Button.setVisible(!check);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getActionCommand().equals("<이전")){
			this.dispose(); new FirstPage();
		}
		
		
		if(e.getActionCommand().equals("회원")){
			turnOnOff(true);
		}
		else
			if(e.getActionCommand().equals("트레이너")){
				turnOnOff(false);
			}
		switch(e.getActionCommand()) {
		case "로그인" :  
			if(e.getSource()==mLogin_Button){
				mlogin();  break; // 수정 필요
			}
			else
				if(e.getSource()==tLogin_Button){
					tlogin(); break;
					
				}
		case "회원가입" : this.dispose(); new JoinPage(); break;
		case "ID 찾기" : this.dispose(); new IdSearch(); break;
		case "PW 찾기" : this.dispose(); new PwdSearch(); break;
			}
			
		
		
		
	}

	private void tlogin() {
		fDao = new FitnessDao();
		String id=this.IDtextField.getText();
		String pwd=this.PWField.getText();
		
		boolean check = fDao.trainerlogin(id,pwd);
		if(check) {
			this.dispose();
			new TrainerMenu();
		}else if(!check) {
			this.IDtextField.setText("");
			this.PWField.setText("");
		}
		
	}

	private void mlogin() {
		fDao = new FitnessDao();
		String id=this.IDtextField.getText();
		String pwd=this.PWField.getText();
		
		boolean check = fDao.loginCheck(id, pwd);
		if(check) {
			this.dispose();
			new UserMenu(id);
		}else if(!check) {
			this.IDtextField.setText("");
			this.PWField.setText("");
		}
	}
	
	
}