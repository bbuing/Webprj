<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ������ ������</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2 class="text-center">ȸ������</h2>
			<hr/>

			<div class="form-group">
				<label for="Joinname" class="col-sm-3 control-label">�̸� </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Joinname" placeholder="�̸�" />
				</div>
			</div>

			<div class="form-group">
				<label for="Joinnickname" class="col-sm-3 control-label">���� </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Joinnickname" placeholder="����" />
				</div>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-default">�ߺ�Ȯ��</button>
				</div>
			</div>

			<div class="form-group">
				<label for="Joinemail" class="col-sm-3 control-label">�̸��� �ּ�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="Joinemail" placeholder="�̸���"/>
				</div>
				<div class="col-sm-2">
					<select class="form-control">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>google.com</option>
						<option>nate.com</option>
						<option>���� �Է�</option>
					</select>
				</div>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-default">�ߺ�Ȯ��</button>
				</div>
			</div>

			<div class="form-group">
				<label for="Joinpw" class="col-sm-3 control-label">��й�ȣ</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Joinpw" placeholder="������ ���� ���� 8�ڸ� �̻� �Է��ϼ���."/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="Joinpw2" class="col-sm-3 control-label">��й�ȣ Ȯ��</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="Joinpw2" placeholder="��й�ȣ Ȯ��" />
				</div>
			</div>

			<div class="form-group">
				<label for="Joinquestion" class="col-sm-3 control-label">���� </label>
				<div class="col-sm-6">
					<select class="form-control">
						<option value="hint1">��￡ ���� �߾��� ��Ҵ�?</option>
						<option value="hint2">�ڽ��� �λ� �¿����?</option>
						<option value="hint3">�ڽ��� ���� ��1ȣ��?</option>
						<option value="hint4">���� ��￡ ���� ������ ������?</option>
						<option value="hint5">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
						<option value="hint6">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
						<option value="hint7">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
						<option value="hint8">������� ���� �������� ģ�� �̸���?</option>
						<option value="hint9">�λ� ��� ���� å �̸���?</option>
						<option value="hint10">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
						<option value="hint11">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
						<option value="hint12">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
						<option value="hint13">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
						<option value="hint14">�ٽ� �¾�� �ǰ� ���� ����?</option>
						<option value="hint15">���� �����ϴ� ĳ���ʹ�?</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-6">
					<input type="text" class="form-control" id="Joinquestion" placeholder="������ ���� �Է��ϼ���." />
				</div>
			</div>

			<div class="form-group">
				<label for="Joinphone" class="col-sm-3 control-label">�ڵ��� ��ȣ </label>
				<div class="col-sm-2">
					<select class="form-control">
						<option value="Joinphone1_1">010</option>
						<option value="Joinphone1_2">011</option>
						<option value="Joinphone1_3">016</option>
						<option value="Joinphone1_4">017</option>
						<option value="Joinphone1_5">019</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Joinphone2"/>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Joinphone3"/>
				</div>

			</div>
			<div class="form-group">
				<label for="Joininterest" class="col-sm-3 control-label">���� ����</label>
				<label class="checkbox-inline">&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="inlineCheckbox1" value="option1" /> Ŀ�� ����
				</label> 
				<label class="checkbox-inline"> 
				<input type="checkbox" id="inlineCheckbox2" value="option2"/> ���� ����
				</label> <label class="checkbox-inline"> 
				<input type="checkbox" id="inlineCheckbox3" value="option3"/> ��Ȧ�� ����
				</label> <label class="checkbox-inline"> 
				<input type="checkbox" id="inlineCheckbox3" value="option4"/> ���� ����
				</label> <label class="checkbox-inline"> 
				<input type="checkbox" id="inlineCheckbox3" value="option5"/> ���� ����
				</label>
			</div>
			<hr/>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-default">�����ϱ�</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>