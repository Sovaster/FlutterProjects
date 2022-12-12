abstract class DataBaseRequest {
  /// Запрос на вывод данных без критериев
  static String select(String table) => 'Select * from $table';

  static String selectName(String table, List<String> test) =>
      'Select ${test.toString().replaceAll('[', '').replaceAll(']', '')} from $table';

  /// Запрос на удаление таблиц
  static String deleteTable(String table) => 'DROP TABLE $table';

  /// Таблица Роли
  ///
  /// Поля таблицы: Название роли
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: Логин, Пароль, Роль
  static const String tableUsers = 'Users';

  /// Таблица Профиль пользователя
  ///
  /// Поля таблицы: Фамилия, Имя, Отчество, Дата рождения, Пол, Номер Пользователя
  static const String tableProfileUsers = 'ProfileUsers';

  /// Таблица Автор
  ///
  /// Поля таблицы: Фамилия, Имя, Отчество
  static const String tableAuthor = 'Author';

  /// Таблица Автор
  ///
  /// Поля таблицы: Фамилия, Имя, Отчество
  static const String tableBooks = 'Books';

  /// Таблица Жанры
  ///
  /// Поля таблицы: Название жанра
  static const String tableGenres = 'Genres';

  /// Таблица Жанры книги
  ///
  /// Поля таблицы: Номер книги, Номер жанра
  static const String tableBooksGenres = 'BooksGenres';

  /// Список всех таблиц
  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableProfileUsers,
    tableAuthor,
    tableBooks,
    tableGenres,
    // tableBooksGenres
  ];

  /// Список всех запрос для создании таблиц
  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableProfileUsers,
    _createTableAuthor,
    _createTableBooks,
    _createTableGenres,
    // createTableBooksGenres
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы ProfileUsers
  static const String _createTableProfileUsers =
      'CREATE TABLE "$tableProfileUsers" ("id"	INTEGER, "surname"	TEXT, "name"	INTEGER, "midle_name"	INTEGER, "sex"	INTEGER, "user_id"	INTEGER UNIQUE, PRIMARY KEY("id" AUTOINCREMENT),	FOREIGN KEY("user_id") REFERENCES "$tableUsers"("id") ON DELETE CASCADE)';

  /// Запрос для создания таблицы Author
  static const String _createTableAuthor =
      'CREATE TABLE "$tableAuthor" ("id" INTEGER, "surname" TEXT, "name"	TEXT, "middle_name"	TEXT, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Books
  static const String _createTableBooks =
      'CREATE TABLE "$tableBooks" ("id" INTEGER, "name"	TEXT, "description"	TEXT, "date" TEXT, "id_author" INTEGER, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_author") REFERENCES "$tableAuthor"("id") ON DELETE CASCADE )';

  /// Запрос для создания таблицы Genres
  static const String _createTableBooksGenres = '';

  /// Запрос для создания таблицы BooksGenres
  static const String _createTableGenres =
      'CREATE TABLE "$tableGenres" ("id"	INTEGER, "name"	TEXT,	PRIMARY KEY("id" AUTOINCREMENT))';
}
