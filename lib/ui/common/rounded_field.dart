import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intelligence/infrastructure/completion_response_model.dart';
import 'package:intelligence/infrastructure/network.dart';
import 'package:intelligence/infrastructure/provider/provider_registration.dart';
import 'package:intelligence/ui/common/image_constant.dart';

class RoundedTextFormFieldWidget extends ConsumerWidget {
  final Key? textFormFieldKey;

  /// A controller for an editable text field.
  final TextEditingController? controller;

  /// The type of information for which to optimize the text input control
  final TextInputType? textInputType;

  /// Decorate a Material Design text field.
  final InputDecoration? decoration;

  /// Defines make field as a read only
  final bool? isReadOnly;

  /// An action the user has requested the text input control to perform.
  final TextInputAction? textInputAction;

  /// To receive key events that focuses on this node, pass a listener to `onKeyEvent`
  final FocusNode? focusNode;

  /// Defines field fil color
  final Color? fillColor;

  /// Validates the textfield
  final FormFieldValidator<String>? validator;

  /// List of enforcements applied to the editing value
  final List<TextInputFormatter>? inputFormatters;

  /// Specifies the hint
  final String? hintText;

  /// Defines hint color
  final Color? hintTextColor;

  /// Whether and how to align text horizontally.
  final TextAlign? textAlign;

  /// Defines suffix icon
  final Widget? suffixIcon;

  /// Defines max lines  of field [Default 1]
  final int? maxLines;

  /// Defines min lines  of field [Default 1]
  final int? minLines;

  /// Defines error lines  of field [Default 1]
  final int? errorLines;

  /// Defines content padding
  final EdgeInsetsGeometry? contentPadding;

  final ValueChanged<String>? onFieldSubmitted;

  /// Defines font weight of entered text
  final FontWeight? fontWeight;

  /// Call when there is the change on the current state of textfield
  final ValueChanged<String>? onChanged;

  final Iterable<String>? autofillHints;

  /// Creates a text style.
  final TextStyle? textStyle;

  /// Creates a hint text style.

  final TextStyle? hintStyle;

  /// Defines enable border color

  final Color? enabledBorderColor;

  /// Defines focus border color

  final Color? focusedBorderColor;

  /// Defines error border color
  final Color? errorBorderColor;

  /// Defines focus error border color
  final Color? focusedErrorBorderColor;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool? autofocus;

  /// Defines on tap of field
  final VoidCallback? onTap;

  /// Callback that generates a custom [InputDecoration.counter] widget.
  final InputCounterWidgetBuilder? buildCounter;

  /// Expands the textfield.
  final bool? expands;

  /// Describes the contrast of a theme or color palette of keyboard.
  final Brightness? keyboardAppearance;

  /// Defines maxlength of text
  final int? maxLength;

  /// Hides the text with the specified character
  final bool? obscureText;

  /// Call when the text editing has been completed
  final VoidCallback? onEditingComplete;

  /// Call when the user saves the form
  final FormFieldSetter<String>? onSaved;

  /// Restoration ID to save and restore the state of the text field.
  final String? restorationId;

  /// Used to show cursor.
  final bool? showCursor;

  /// Indicates how to handle the intelligent replacement of dashes in text input.
  final SmartDashesType? smartDashesType;

  /// Indicates how to handle the intelligent replacement of quotes in text input.
  final SmartQuotesType? smartQuotesType;

  /// Creates a strut style.
  final StrutStyle? strutStyle;

  /// Aligns the text in the vertical axis.
  final TextAlignVertical? textAlignVertical;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard
  final TextCapitalization? textCapitalization;

  /// A direction in which text flows.
  final TextDirection? textDirection;

  /// ./// Defines the appearance of an [InputDecorator]'s border.
  final InputBorder? border;

  /// Defines the radius of the border.
  final double? borderRadius;

  /// Defines border width
  final double? borderWidth;

  final String? errorText;

  final Widget? prefixWidget;

  final Widget? prefixIconWidget;

  final BoxConstraints? prefixIconWidgetConstraints;
  final BoxConstraints? suffixIconWidgetConstraints;

  final Color? shadowColor;

  final String? fontFamily;

  final bool? enable;

  final double? width;

  final Color? textColor;

  final Color? cursorColor;

  final bool isLoading;

  const RoundedTextFormFieldWidget(
      {this.textFormFieldKey,
      this.controller,
      this.textInputType,
      this.decoration,
      this.isReadOnly,
      this.textInputAction,
      this.focusNode,
      this.fillColor,
      this.validator,
      this.inputFormatters,
      this.hintText,
      this.hintTextColor,
      this.textAlign,
      this.suffixIcon,
      this.maxLines,
      this.contentPadding,
      this.minLines,
      this.onFieldSubmitted,
      this.fontWeight,
      this.onChanged,
      this.autofillHints,
      this.textStyle,
      this.hintStyle,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.errorBorderColor,
      this.focusedErrorBorderColor,
      this.onTap,
      this.expands,
      this.keyboardAppearance,
      this.maxLength,
      this.obscureText,
      this.onEditingComplete,
      this.onSaved,
      this.restorationId,
      this.showCursor,
      this.smartDashesType,
      this.smartQuotesType,
      this.strutStyle,
      this.textAlignVertical,
      this.textCapitalization,
      this.textDirection,
      this.autofocus,
      this.buildCounter,
      this.border,
      this.borderRadius,
      this.borderWidth,
      this.errorText,
      this.errorLines,
      this.prefixWidget,
      this.prefixIconWidget,
      this.shadowColor,
      this.enable,
      this.width,
      this.fontFamily = 'Inter',
      this.prefixIconWidgetConstraints,
      this.textColor,
      this.cursorColor,
      required this.isLoading,
      this.suffixIconWidgetConstraints})
      : super(key: textFormFieldKey);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * 0.95,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.left,
        inputFormatters: inputFormatters,
        validator: validator,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        maxLength: maxLength,
        textInputAction: textInputAction ?? TextInputAction.next,
        readOnly: isReadOnly ?? false,
        style: textStyle ?? TextStyle(color: const Color(0xff323340), fontSize: 16 / scaleFactor, fontWeight: FontWeight.w400),
        keyboardType: textInputType ?? TextInputType.text,
        controller: controller,
        decoration: decoration ??
            InputDecoration(
              counterText: '',
              prefixIconConstraints: prefixIconWidgetConstraints,
              suffixIconConstraints: const BoxConstraints(maxHeight: 28, maxWidth: 44),
              prefixIcon: prefixIconWidget,
              prefix: prefixWidget ?? const SizedBox.shrink(),
              errorText: errorText != null && (errorText?.isNotEmpty ?? false) ? errorText : null,
              suffixIcon: isLoading
                  ? Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: const CircularProgressIndicator(
                        color: Color(0xff323340),
                        strokeWidth: 2,
                      ),
                    )
                  : InkWell(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: () async {
                        ref.read(completionProvider).pushQuestionAnser(true, controller!.text);
                        ref.read(completionProvider).setLoading(true);
                        if (controller!.text.isNotEmpty) {
                          try {
                            OpenAICompletionsResponse? res = await getAnswer(controller!.text);
                            ref.read(completionProvider).pushQuestionAnser(false, res?.choices?[0].text ?? "");
                          } catch (_) {}
                        }
                        ref.read(completionProvider).setLoading(false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SvgPicture.asset(
                          ImageConstants.send,
                          color: const Color(0xff323340),
                        ),
                      ),
                    ),
              hintStyle: hintStyle ??
                  TextStyle(
                      color: hintTextColor, fontSize: 16 / scaleFactor, fontWeight: FontWeight.w400, fontFamily: fontFamily),
              hintText: hintText ?? '',
              border: border ?? InputBorder.none,
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              fillColor: fillColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff323340)),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff323340),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              errorMaxLines: errorLines ?? 3,
            ),
        onChanged: onChanged,
        autofillHints: autofillHints,
        onFieldSubmitted: (_) async {
          if (ref.read(completionProvider).isLoading) return;
          ref.read(completionProvider).pushQuestionAnser(true, controller!.text);
          ref.read(completionProvider).setLoading(true);
          if (controller!.text.isNotEmpty) {
            try {
              OpenAICompletionsResponse? res = await getAnswer(controller!.text);
              ref.read(completionProvider).pushQuestionAnser(false, res?.choices?[0].text ?? "");
            } catch (_) {}
          }
          ref.read(completionProvider).setLoading(false);
        },
        onTap: onTap ?? () {},
        autocorrect: false,
        // autofocus: autofocus ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: cursorColor ?? const Color(0xff323340),
        cursorRadius: Radius.zero,
        enabled: enable ?? true,
        enableIMEPersonalizedLearning: true,
        enableInteractiveSelection: true,
        enableSuggestions: true,
        expands: expands ?? false,
        keyboardAppearance: keyboardAppearance ?? Brightness.light,
        obscureText: obscureText ?? false,
        obscuringCharacter: '•',
        onEditingComplete: onEditingComplete ?? () {},
        onSaved: onSaved ?? (val) {},
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection ?? TextDirection.ltr,
      ),
    );
  }
}
