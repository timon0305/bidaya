import 'package:quizzo/export.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});
  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "I'm doing well, thank you! How can I help you today?",
      isUser: false,
      time: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ChatMessage(
      text: "Hello, how are you doing?",
      isUser: true,
      time: DateTime.now().subtract(const Duration(minutes: 4)),
    ),
    ChatMessage(
      text: "I'm doing well, thank you! How can I help you today?",
      isUser: false,
      time: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    ChatMessage(
      text: "I have a question about the return policy for a product I purchased.",
      isUser: true,
      time: DateTime.now(),
    ),
  ];

  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final message = ChatMessage(
      text: _controller.text.trim(),
      isUser: true,
      time: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
      _controller.clear();
      _isTyping = true;
    });

    // Simulate bot typing delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _messages.add(
          ChatMessage(
            text: "Thanks for your message! Let me assist you with that.",
            isUser: false,
            time: DateTime.now(),
          ),
        );
        _isTyping = false;
      });
    });
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final formattedTime = DateFormat('hh:mm a').format(message.time);
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          !isUser?
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.blue,
                    child: SizedBox(
                      height: 30.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Icon(
                          Icons.person,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    textAlign: TextAlign.center,
                    text: " Bido",
                    color: AppColors.blackShade,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(0.r),
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      color: isUser ? AppColors.freshBlue : AppColors.purple.withOpacity(0.08),

                    ),
                    child: customText(
                     text:  message.text,
                        fontWeight: FontWeight.w600,
                        color: isUser ? Colors.white : Colors.black,
                        fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: customText(
                      textAlign: TextAlign.center,
                      text: formattedTime,
                      color: AppColors.placeholder,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,

                    ),
                  )
                ],
              ),
            ],
          ): Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                  margin:  EdgeInsets.symmetric(vertical: 4.h),
                  padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(0.r),
                  bottomLeft: Radius.circular(15.r) ,
                  bottomRight: Radius.circular(15.r),
                  ),
                  color: isUser ? AppColors.freshBlue : AppColors.purple.withOpacity(0.08),

                  ),
                  child: customText(
                  text:  message.text,
                  fontWeight: FontWeight.w600,
                  color: isUser ? Colors.white : Colors.black,
                  fontSize: 16,
                  ),
                  ),
              Padding(
                padding:  EdgeInsets.only(left: 8.w),
                child: customText(
                  textAlign: TextAlign.center,
                  text: formattedTime,
                  color: AppColors.placeholder,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,

                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.blue,
              child: SizedBox(
                height: 30.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                textAlign: TextAlign.center,
                text: " Bido",
                color: AppColors.blackShade,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),

              Container(
                padding:  EdgeInsets.symmetric(vertical: 8.h,horizontal: 6.w),
                margin:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.freshBlue.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 12.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: Column(
          children: [

        ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Image.asset(
              AppImages.gradient,
              height: 83.h,
              width: 432.w,
              fit: BoxFit.cover,
            ),

            // Center title

            Positioned(
              top: 24.h,
              left: 55.w,


              child: Center(
                child: customText(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: AppColors.white,
                  text: "Biddo AI Assistant",
                ),
              ),
            ),

            // Back icon left
            Positioned(
              left: 16.w,
              top: 0,
              bottom: 0,
              child: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
            ),

            // Delete icon right
            Positioned(
              right: 16.w,
              top: 0,
              bottom: 0,
              child: SvgPicture.asset(AppImages.delete,fit: BoxFit.contain,height: 24.h,width: 24.w,),
            ),
          ],
        ),
      ),
        Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (_isTyping && index == _messages.length) {
                    return _buildTypingIndicator();
                  }
                  return _buildMessageBubble(_messages[index]);
                },
              ),
            ),
            _buildInputField(),
          ],
        ),
      ),

    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Reply ...',
                hintStyle: TextStyle(color: AppColors.placeholder,fontFamily:GoogleFonts.nunito().fontFamily, ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
         horizontalSpacer(8),
          GestureDetector(
            onTap: _sendMessage,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.freshBlue,
              child: Center(
                child:   Icon(Icons.arrow_forward_ios, color: Colors.white,size: 18,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}
