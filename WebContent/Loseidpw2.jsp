<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�̸���/��й�ȣ ã�� ������</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="form-horizontal">
			<h2 class="text-center">��й�ȣ 2�� ����</h2>
			<hr/>
			<div class="form-group">
				<label for="Losepwquestion" class="col-sm-3 control-label">���� </label>
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
					<input type="text" class="form-control" id="Losepwquestion" placeholder="������ ���� �Է��ϼ���." />
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-info">��й�ȣ ã��</button>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>