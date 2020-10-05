<!---Registo de cliente-->

	<?php

		$output = null;
		global $mensagem;


if(isset($_POST['cliente'])){
    //Conexao co bd
    $mysqli = new mysqli('localhost', 'root','','casa3');
    

    
    $nome = $mysqli->real_escape_string($_POST['nome']);
    $apelido = $mysqli->real_escape_string($_POST['apelido']);
    $username = $mysqli->real_escape_string($_POST['username']);
    $password = $mysqli->real_escape_string($_POST['password']);
    $telefone = $mysqli->real_escape_string($_POST['telefone']);
    $email = $mysqli->real_escape_string($_POST['email']);
    $nr_documento = $mysqli->real_escape_string($_POST['nr_documento']);
    $perfil = $mysqli->real_escape_string($_POST['perfil']);
    
    $query = $mysqli->query("select * from cliente where nome = '$nome'");
    
//	if($nome && $username && $password && $curso_id && $perfil){
		if(userExists($username) === TRUE){
			$mensagem = "<center><div class='icon-file'><i class='fa fa-remove' aria-hidden='true'></i> Cliente ja esta registado no Sistema!!!</div></center>";
		}else{
	 $insert = $mysqli->query("insert into user (username,password, perfil) values ('$username', '$password', '$perfil')");
	
    
    $result = $mysqli->query("select max(id) from user");
    
    while($resulto = mysqli_fetch_array($result)){
//        print_r($resulto); ---imprime o id-----
        
        $user_id = $resulto[0];
        
       //echo $resulto['id'];
			
    
     $insert = $mysqli->query("insert into cliente (nome, apelido, telefone, email, nr_documento, user_id) values ('$nome', '$apelido','$telefone','$email','$nr_documento', '$user_id')");
			} $mensagem = "<center><div class='icon-file'><i class='fa fa-check' aria-hidden='true'></i> Registado com sucesso!!!</div></center>";
			
		}
//    }
}

	?>

<!---Registo de cliente-->




<!---Registo de Intermediario-->
<?php

		$output = null;
		global $mensagem;


if(isset($_POST['intermediario'])){
    //Conexao co bd
    $mysqli = new mysqli('localhost', 'root','','casa3');
    

    
    $nome = $mysqli->real_escape_string($_POST['nome']);
    $username = $mysqli->real_escape_string($_POST['username']);
    $password = $mysqli->real_escape_string($_POST['password']);
    $telefone = $mysqli->real_escape_string($_POST['telefone']);
    $email = $mysqli->real_escape_string($_POST['email']);
    $nr_documento = $mysqli->real_escape_string($_POST['nr_documento']);
    $perfil = $mysqli->real_escape_string($_POST['perfil']);
    
    $query = $mysqli->query("select * from intermediario where nome = '$nome'");
    
//	if($nome && $username && $password && $curso_id && $perfil){
		if(userExists($username) === TRUE){
			$mensagem = "<center><div class='icon-file'><i class='fa fa-remove' aria-hidden='true'></i> Intermediario ja esta registado no Sistema!!!</div></center>";
		}else{
	 $insert = $mysqli->query("insert into user (username,password, perfil) values ('$username', '$password', '$perfil')");
	
    
    $result = $mysqli->query("select max(id) from user");
    
    while($resulto = mysqli_fetch_array($result)){
//        print_r($resulto); ---imprime o id-----
        
        $user_id = $resulto[0];
        
       //echo $resulto['id'];
			
    
     $insert = $mysqli->query("insert into intermediario (nome, telefone, email, nr_documento, user_id) values ('$nome','$telefone','$email','$nr_documento', '$user_id')");
			} $mensagem = "<center><div class='icon-file'><i class='fa fa-check' aria-hidden='true'></i> Registado com sucesso!!!</div></center>";
			
		}
//    }
}

	?>
<!---Registo de Intermediario-->




<!---Registo de Administrador-->
<?php

		$output = null;

if(isset($_POST['administrador'])){
    //Conexao co bd
    $mysqli = new mysqli('localhost', 'root','','casa3');
    

    $username = $mysqli->real_escape_string($_POST['username']);
    $password = $mysqli->real_escape_string($_POST['password']);
    $perfil = $mysqli->real_escape_string($_POST['perfil']);
    
    $query = $mysqli->query("select * from administrador where username = '$username'");
	
	
	if($username && $password && $perfil){
		if(userExists($username) === TRUE){
			echo  $_POST['username'] . " ja se encontra registado no Sistema!!!";
		}else{
	$insert = $mysqli->query("insert into user (username,password, perfil) values ('$username', '$password', '$perfil')");
	
	
    
     $resultcom = $mysqli->query("select max(id) from user");
    
     while($resultoCom = mysqli_fetch_array($resultcom)){
        // print_r($resulto); //---imprime o id do estudante-----
        
        $user_id = $resultoCom[0];  
    
	
	$insert = $mysqli->query("insert into administrador (user_id, nome) values ('$user_id', '$username')");
	} echo "Registado com Sucesso";
		}
	}
    
     
}

	?>
<!---Registo de Administrador-->


<!---Arrendamento-->
<?php

$output = null;

if(isset($_POST['arrendamento'])){
    //Conexao co bd

    $idCliente = 0;

    $conn = mysqli_connect("localhost", "root", "", "casa3");   

    $user_id = $_SESSION['iduser'];

    $procurar_idEstudante = "select id from cliente where user_id = $user_id";
    
    $resultado_idEstudante = mysqli_query($conn, $procurar_idEstudante);

    if(!empty($resultado_idEstudante))
    {
        $linha = mysqli_fetch_array($resultado_idEstudante);
        $idCliente = $linha["id"];
    }    

    $mysqli = new mysqli('localhost', 'root','','casa3');
    
    $titulo = $mysqli->real_escape_string($_POST['titulo']);
    $intermediario_id = $mysqli->real_escape_string($_POST['intermediario_id']);
    $cliente_id = $idCliente;
    $inicio = $mysqli->real_escape_string($_POST['inicio']);
    $fim = $mysqli->real_escape_string($_POST['fim']);
    $casa_id = $mysqli->real_escape_string($_POST['casa_id']);
    $status = $mysqli->real_escape_string($_POST['status']);
    
    $query = $mysqli->query("select * from arrendamento where titulo = '$titulo'");

    $insert = $mysqli->query("insert into arrendamento (titulo, intermediario_id, cliente_id, inicio,fim,casa_id, status) values ('$titulo','$intermediario_id','$cliente_id', '$inicio', '$fim','$casa_id', '$status')");
    $insert = $mysqli->query("update casa set status = 'Pendente' where casa.id = '$casa_id'");


    echo "<script type = \"text/javascript\">
                      alert(\"Pedido submetido com Sucesso\");
                      </script>";

    session_commit();
}



?>
<!---Arrendamento-->


<!-- Verificacao de Existencia de Utilizador -->

<?php

function userExists($username) {
	global $conn;

	$sql = "SELECT * FROM user WHERE username = '$username'";
	$query = $conn->query($sql);
	if($query->num_rows == 1) {
		return true;
	} else {
		return false;
	}

	$conn->close();

}


function userdata($username) {
	global $conn;
	$sql = "SELECT * FROM user WHERE username = '$username'";
	$query = $conn->query($sql);
	$result = $query->fetch_assoc();
	if($query->num_rows == 1) {
		return $result;
	} else {
		return false;
	}

	$conn->close();
	
}

?>

<!-- Verificacao de Existencia de Utilizador -->