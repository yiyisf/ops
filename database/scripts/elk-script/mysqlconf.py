# -*- coding: utf-8 -*-
__author__ = 'Abbott'
import MySQLdb


class mysql_connect:

        def sql_exec(self, amont_sql):
                result_dic = {}
                try:
                        conn = MySQLdb.connect(host='', user='', passwd='', port='3306', database='')
                        cur = conn.cursor()
                        cur.execute(amont_sql)
                        conn.commit()
                        value = cur.fetchall()
                        field = cur.description
                        cur.close()
                        conn.close()
                        result_dic = {'result': 'True', 'value': value, 'field': field}
                        return result_dic
                except MySQLdb.Error, e:
                        err_msg = "Mysql Error Msg: %s" % e
                        result_dic = {'result': 'False', 'err_msg': err_msg}
                        return result_dic

