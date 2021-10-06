const bcrypt = require('bcryptjs');
const saltRounds = 10;

const create = async ({ fname, lname, email, password, phone }) => {
    if (_.isUndefined(email)) {
        throw Error('An email address is required!');
    }

    if (_.isUndefined(password) || password.length < 6) {
        throw Error('A password is required, and must be aleast 6 characters');
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) throw Error('A customer with the email already exist.');

    const passwordHash = await bcrypt.hash(password, saltRounds);
    const data = {
        fullname: fname + ' ' + lname,
        email,
        phone,
        password: passwordHash
    };

    const user = User.create(data);
    // send email
    return user;
}

module.exports = {
    create
}