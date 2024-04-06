<?php
require_once "../config/config.php";

// 1 == success
// 2 == exist
// 0 == failed

class delete
{
    public function delete_room($id)
    {
        global $conn;

        session_start();
        $h_tbl = 'room';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('SELECT * FROM room_equipment WHERE room_id = ?');
        $sql->execute(array($id));
        $count = $sql->rowCount();

        if ($count > 0) {
            echo "2"; // Room has associated equipment, cannot delete
        } else {
            $del = $conn->prepare('DELETE FROM room WHERE id = ?;
                                  INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
            $del->execute(array($id, 'delete room', $h_tbl, $sessionid, $sessiontype));
            $row = $del->rowCount();

            if ($row > 0) {
                echo "1"; // Successful deletion
            } else {
                echo "0"; // Failed to delete
            }
        }
    }

    public function delete_equipment($id)
    {
        global $conn;

        session_start();
        $h_desc = 'delete equipment';
        $h_tbl = 'item';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('SELECT * FROM item_stock WHERE item_id = ?');
        $sql->execute(array($id));
        $count = $sql->rowCount();

        if ($count > 0) {
            echo "2"; // Equipment has associated stock, cannot delete
        } else {
            $del = $conn->prepare('DELETE FROM item WHERE id = ?;
                                  INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
            $del->execute(array($id, $h_desc, $h_tbl, $sessionid, $sessiontype));
            $row = $del->rowCount();

            if ($row > 0) {
                echo "1"; // Successful deletion
            } else {
                echo "0"; // Failed to delete
            }
        }
    }

    public function delete_member($id)
    {
        global $conn;

        session_start();
        $h_desc = 'delete client';
        $h_tbl = 'client';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('SELECT * FROM borrow WHERE member_id = ? AND status = ?');
        $sql->execute(array($id, 1)); // Check for active borrowings
        $count = $sql->rowCount();

        if ($count > 0) {
            echo "2"; // Member has active borrowings, cannot delete
        } else {
            $del = $conn->prepare('DELETE FROM member WHERE id = ?;
                                  INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
            $del->execute(array($id, $h_desc, $h_tbl, $sessionid, $sessiontype));
            $row = $del->rowCount();

            if ($row > 0) {
                echo "1"; // Successful deletion
            } else {
                echo "0"; // Failed to delete
            }
        }
    }

    public function delete_user($id)
    {
        global $conn;

        session_start();
        $h_desc = 'delete user';
        $h_tbl = 'user';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('DELETE FROM user WHERE id = ?;
                              INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
        $sql->execute(array($id, $h_desc, $h_tbl, $sessionid, $sessiontype));
        $row = $sql->rowCount();

        if ($row > 0) {
            echo "1"; // Successful deletion
        } else {
            echo "0"; // Failed to delete
        }
    }

    public function delete_reservation($code)
    {
        global $conn;

        session_start();
        $h_desc = 'delete reservation';
        $h_tbl = 'reservation';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('DELETE FROM reservation WHERE reservation_code = ?;
                              INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
        $sql->execute(array($code, $h_desc, $h_tbl, $sessionid, $sessiontype));
        $row = $sql->rowCount();

        if ($row > 0) {
            echo "1"; // Successful deletion
        } else {
            echo "0"; // Failed to delete
        }
    }

    public function delete_transfer($id)
    {
        global $conn;

        session_start();
        $h_desc = 'delete item transfer';
        $h_tbl = 'item_transfer';
        $sessionid = $_SESSION['admin_id'];
        $sessiontype = $_SESSION['admin_type'];

        $sql = $conn->prepare('DELETE FROM item_transfer WHERE id = ?;
                              INSERT INTO history_logs(description,table_name,user_id,user_type) VALUES(?,?,?,?)');
        $sql->execute(array($id, $h_desc, $h_tbl, $sessionid, $sessiontype));
        $row = $sql->rowCount();

        if ($row > 0) {
            echo "1"; // Successful deletion
        } else {
            echo "0"; // Failed to delete
        }
    }
}

$delete = new delete();

$key = trim($_POST['key']);

switch ($key) {
    case 'delete_room':
        $id = $_POST['id'];
        $delete->delete_room($id);
        break;

    case 'delete_equipment':
        $id = $_POST['id'];
        $delete->delete_equipment($id);
        break;

    case 'delete_member':
        $id = $_POST['id'];
        $delete->delete_member($id);
        break;

    case 'delete_user':
        $id = $_POST['id'];
        $delete->delete_user($id);
        break;

    case 'delete_reservation':
        $code = $_POST['code'];
        $delete->delete_reservation($code);
        break;

    case 'delete_transfer':
        $id = $_POST['id'];
        $delete->delete_transfer($id);
        break;
}