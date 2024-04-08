import express from 'express';
import { Request, Response } from 'express';
import { dbCom } from '../shared/db.util';
import { sendFormattedResponse } from '../shared/response.util'; // import ฟังก์ชันที่เราสร้างเอาไว้
import bcrypt from 'bcrypt';
import { QueryResult, OkPacket } from 'mysql2';


const router = express.Router();
router.get('/', async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;
        const [result, fields] = await dbCom.execute('SELECT * FROM users WHERE Active = true');
        sendFormattedResponse(res, "Success: 200", result);
    } catch (error) {
        console.error('Error fetching user by userId:', error);
        res.status(500).send('Error fetching user by userId');
    }
});


router.get('/:userId', async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;
        const [result, fields] = await dbCom.execute('SELECT * FROM users WHERE userId = ? AND Active = true', [userId]);
        sendFormattedResponse(res, "Success: 200", result);
    } catch (error) {
        console.error('Error fetching user by userId:', error);
        res.status(500).send('Error fetching user by userId');
    }
});


router.post('/create', async (req: Request, res: Response) => {
    try {

        const { userName, password, firstName, lastName, nickName, birth_date, gender, Active = 1 } = req.body;
        if (
            userName !== null &&
            password !== null &&
            firstName !== null &&
            lastName !== null &&
            nickName !== null &&
            birth_date !== null &&
            gender !== null
        ) {
            // Hash รหัสก่อนจะเก็บลงดาต้าเบส
            const saltRounds = 10;
            const hash = await bcrypt.hash(password, saltRounds);
            //เช็ค รหัสที่ hash กับ ตัวเลขจริงที่ได้รับ
              // bcrypt.compare(password, test)
                //     .then(result => {
                //         console.log(result); 
                //     })
                //     .catch(error => {
                //         console.error(error);
                //     });
            // แปลงวันที่ 
            const [year, month, day] = birth_date.split('-').map(Number);
            const thaiDate = new Date(year, month - 1, day);

        const result = await dbCom.execute('INSERT INTO users (userName, password, firstName, lastName, nickName, birth_date, gender, Active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
        , [userName, hash, firstName, lastName, nickName, thaiDate, gender, Active]);
        sendFormattedResponse(res, "Success: 201", { message: "สร้างผู้ใช้ใหม่เรียบร้อยแล้ว" });
        } else {
            return false;
        }
        
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).send('Error creating user');
    }
});


router.put('/update/:userId', async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId; 
        const { userName, password, firstName, lastName, nickName, birth_date, gender, Active = 'true' } = req.body;

        let hash = password; 
        if (password) {
            const saltRounds = 10;
            hash = await bcrypt.hash(password, saltRounds);
        }

        const [year, month, day] = birth_date.split('-').map(Number);
        const thaiDate = new Date(year, month - 1, day);

        const result = await dbCom.execute('UPDATE users SET userName = ?, password = ?, firstName = ?, lastName = ?, nickName = ?, birth_date = ?, gender = ?, Active = ? WHERE userId = ?', [userName, hash, firstName, lastName, nickName, thaiDate, gender, Active, userId]);
        sendFormattedResponse(res, "Success: 200", { message: "อัปเดตข้อมูลผู้ใช้เรียบร้อยแล้ว" });
        
    } catch (error) {
        console.error('Error updating user:', error);
        res.status(500).send('Error updating user');
    }
});

router.put('/softDelete/:userId', async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;

        await dbCom.execute('UPDATE users SET Active = 0 WHERE userId = ?', [userId]);
        sendFormattedResponse(res, "Success: 200", { message: "แก้ไขสถานะผู้ใช้เป็นไม่ใช้งานเรียบร้อยแล้ว" });
    } catch (error) {
        console.error('Error updating user:', error);
        res.status(500).send('Error updating user');
    }
});


router.delete('/delete/:userId', async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;

        await dbCom.execute('DELETE FROM users WHERE userId = ?', [userId]);
        sendFormattedResponse(res, "Success: 200", { message: "ลบผู้ใช้เรียบร้อยแล้ว" });
    } catch (error) {

        console.error('Error deleting user:', error);
        res.status(500).send('Error deleting user');
    }
});





export { router as UsersRoute };
