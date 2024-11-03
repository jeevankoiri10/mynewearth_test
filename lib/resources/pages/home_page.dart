import '/resources/widgets/theme_toggle_widget.dart';
import '/app/networking/api_service.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/safearea_widget.dart';
import '/app/controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ("/home", (_) => HomePage());

  HomePage() : super(child: () => _HomePageState());
}

class _HomePageState extends NyPage<HomePage> {
  int? _stars;

  @override
  get init => () async {
        /// Uncomment the code below to fetch the number of stars for the Nylo repository
        // Map<String, dynamic>? githubResponse = await api<ApiService>(
        //         (request) => request.githubInfo(),
        // );
        // _stars = githubResponse?["stargazers_count"];
      };

  /// Define the Loading style for the page.
  /// Options: LoadingStyle.normal(), LoadingStyle.skeletonizer(), LoadingStyle.none()
  /// uncomment the code below.
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: const Logo(
              height: 100,
              width: 200,
            ),
          ),
        ),
        actions: [ThemeToggle()],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     showToastSuccess(title: "Hello 👋", description: "Welcome to Nylo");
      //   },
      //   child: const Icon(Icons.notifications),
      // ),
      body: SafeAreaWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getEnv("APP_NAME"),
          ).displayMedium(color: context.color.content),
          const Text("Holistic Wellness Application",
                  textAlign: TextAlign.center)
              .titleMedium(color: context.color.primaryAccent),
          const Text("Be Amazing💡", textAlign: TextAlign.center)
              .bodyMedium()
              .alignCenter(),
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              const Text("Offerings Lists")
                  .displaySmall(color: context.color.content),
              const Divider(),
              Container(
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                    color: context.color.surfaceBackground,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 9,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: ListTile.divideTiles(context: context, tiles: [
                      if (Nylo.containsRoute("/landing"))
                        MaterialButton(
                          onPressed: () => routeTo("/landing"),
                          child: Text(
                            "Landing".tr(),
                          ).bodyLarge().setColor(
                              context, (color) => color.surfaceContent),
                        ),
                      if (Nylo.containsRoutes(["/login", "/register"])) ...[
                        MaterialButton(
                          onPressed: () => routeTo("/login"),
                          child: Text(
                            "Login".tr(),
                          ).bodyLarge().setColor(
                              context, (color) => color.surfaceContent),
                        ),
                        MaterialButton(
                          onPressed: () => routeTo("/register"),
                          child: Text(
                            "Register".tr(),
                          ).bodyLarge().setColor(
                              context, (color) => color.surfaceContent),
                        ),
                      ],
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.readme),
                        title: Text(
                          "Documentation",
                        ).bodyLarge(color: context.color.surfaceContent),
                        subtitle: Text(
                          "Master the framework",
                        ).bodySmall(color: context.color.surfaceContent),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: widget.controller.onTapDocumentation,
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.github),
                        title: Text(
                          "Github",
                        ).bodyLarge(color: context.color.surfaceContent),
                        subtitle: Text(
                          _stars == null ? "Source code" : "$_stars Stars",
                        ).bodySmall(color: context.color.surfaceContent),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: widget.controller.onTapGithub,
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.newspaper),
                        title: Text(
                          "Updates",
                        ).bodyLarge(color: context.color.surfaceContent),
                        subtitle: Text(
                          "View the changelog",
                        ).bodySmall(color: context.color.surfaceContent),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: widget.controller.onTapChangeLog,
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.youtube),
                        title: Text(
                          "YouTube Channel",
                        ).bodyLarge(color: context.color.surfaceContent),
                        subtitle: Text(
                          "Tutorial videos",
                        ).bodySmall(color: context.color.surfaceContent),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: widget.controller.onTapYouTube,
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.xTwitter),
                        title: Text(
                          "Follow us on X",
                        ).bodyLarge(color: context.color.surfaceContent),
                        subtitle: Text(
                          "Stay updated",
                        ).bodySmall(color: context.color.surfaceContent),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: widget.controller.onTapX,
                      ),
                    ]).toList(),
                  ),
                ),
              ),
              const Text(
                "Framework Version: $nyloVersion",
              ).bodyMedium().setColor(context, (color) => Colors.grey),
            ],
          ),
        ],
      )),
    );
  }
}
