from client.senior import captcha_get, captcha_submit, category_get, question_get, question_submit, question_result
from tools.logger import logger
from tools.LLM.gemini import GeminiAPI
from tools.LLM.deepseek import DeepSeekAPI
from tools.LLM.openai import OpenAIAPI

from config.config import model_choice
from scripts.check_config import clear_config

class QuizSession:
    def __init__(self):
        self.question_id = None
        self.answers = None
        self.question_num = 0
        self.question = None

    def start(self):
        """开始答题会话"""
        try:
            while self.question_num < 100:
                if not self.get_question():
                    logger.error("获取题目失败")
                    return
                
                # 显示题目信息
                self.display_question()
                # 根据用户选择初始化对应的LLM模型
                if model_choice == '1':
                    llm = DeepSeekAPI()
                elif model_choice == '2':
                    llm = GeminiAPI()
                elif model_choice == '3':
                    llm = OpenAIAPI()
                else:
                    llm = DeepSeekAPI()
                answer = llm.ask(self.get_question_prompt())
                logger.info('AI给出的答案:{}'.format(answer))
                try:
                    answer = int(answer)
                    if not (1 <= answer <= len(self.answers)):
                        logger.warning(f"无效的答案序号: {answer}")
                        continue
                except ValueError:
                    logger.warning("AI回复其他内容,正在重试")
                    continue

                result = self.answers[answer-1]
                if not self.submit_answer(result):
                    logger.error("提交答案失败")
                    return
            self.print_result()
        except KeyboardInterrupt:
            logger.info("答题会话已终止")
        except Exception as e:
            logger.error(f"答题过程发生错误: {str(e)}")
    def get_question(self):
        """获取题目
        
        Returns:
            bool: 是否成功获取题目
        """
        try:
            question = question_get()
            if not question:
                return False

            if question.get('code') != 0:
                logger.info("需要验证码验证")
                return self.handle_verification()

            data = question.get('data', {})
            self.question = data.get('question')
            self.answers = data.get('answers', [])
            self.question_id = data.get('id')
            self.question_num = data.get('question_num', 0)
            return True

        except Exception as e:
            logger.error(f"获取题目失败: {str(e)}")
            return False

    def handle_verification(self):
        """处理验证码验证
        
        Returns:
            bool: 验证是否成功
        """
        try:
            logger.info("获取分类信息...")
            category = category_get()
            if not category:
                return False
            
            logger.info("分类信息:")
            for cat in category.get('categories', []):
                logger.info(f"ID: {cat.get('id')} - {cat.get('name')}")
            logger.info("tips: 输入多个分类ID请用 *英文逗号* 隔开,例如:1,2,3")
            ids = input('请输入分类ID: ')
            logger.info("获取验证码...")
            captcha_res = captcha_get()
            logger.info("请打开链接查看验证码内容:{}".format(captcha_res.get('url')))
            if not captcha_res:
                return False
            captcha = input('请输入验证码: ')

            if captcha_submit(code=captcha, captcha_token=captcha_res.get('token'), ids=ids):
                logger.info("验证通过✅")
                return self.get_question()
            else:
                logger.error("验证失败")
                return False

        except Exception as e:
            logger.error(f"验证过程发生错误: {str(e)}")
            return False

    def display_question(self):
        """显示当前题目和选项"""
        if not self.answers:
            logger.warning("没有可用的题目")
            return

        logger.info(f"第{self.question_num}题:{self.question}")
        for i, answer in enumerate(self.answers, 1):
            logger.info(f"{i}. {answer.get('ans_text')}")
    
    def get_question_prompt(self):
        return '''
        题目:{}
        答案:{}
        '''.format(self.question, self.answers)

    def submit_answer(self, answer):
        """提交答案
        
        Args:
            answer (dict): 答案信息
        
        Returns:
            bool: 是否成功提交答案
        """
        try:
            result = question_submit(
                self.question_id,
                answer.get('ans_hash'),
                answer.get('ans_text')
            )
            if result and result.get('code') == 0:
                logger.info("答案提交成功")
                return True
            else:
                logger.error(f"答案提交失败: {result}")
                return False
        except Exception as e:
            logger.error(f"提交答案时发生错误: {str(e)}")
            return False

    def print_result(self):
         # 打印得分结果
        logger.info('==========答题结果==========')
        try:
            result = question_result()
            if result:
                score = result.get('score')
                logger.info(f"总分: {score}")
                logger.info("分类得分:")
                for category_score in result.get('scores', []):
                    logger.info(f"{category_score.get('category')}: {category_score.get('score')}/{category_score.get('total')}")
                if score >= 60:
                    logger.info('🎉🎉🎉恭喜您通过了答题🎉🎉🎉')
                    choice = input('考虑到您的信息安全, 是否需要删除已保存的登录信息和API KEY?[1]是 [2]否: ')
                    if choice == '1':
                        clear_config()
                else:
                    logger.info('运气稍微有点差,您未能通过答题,请重新运行程序再次答题')
                    logger.info('tips: 知识区和历史区的正确率会更高')
                    input('按任意键退出')
        except Exception as e:
            logger.error(f"获取答题结果失败: {str(e)}")

# 创建答题会话实例
quiz_session = QuizSession()

def start():
    """启动答题程序"""
    quiz_session.start()
    logger.info('答题结束')