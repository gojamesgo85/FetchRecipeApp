# FetchRecipeApp

### Summary: 
Clean, organized TabBar interface for easy navigation.
Each recipe displays with a thumbnail image and name.
Integrated search bar for real-time recipe filtering. 
![Screenshot 2025-02-13 at 11 49 15 PM](https://github.com/user-attachments/assets/f5a66a4d-5602-40a8-bb36-3b48fc7e3a5d)

Full-size recipe image with custom styling.
Interactive favorite system with animated triple-heart design.
Embedded YouTube video player for recipe instructions.
Direct link to source recipe for additional information.
Navigation bar displaying both recipe name and cuisine type.
![Screenshot 2025-02-13 at 11 51 50 PM](https://github.com/user-attachments/assets/3ddddc00-6848-46ae-bf0e-bd54414681f6)


Dedicated tab for saved recipes.
Persistent storage of user favorites.
Swipe-to-delete functionality for easy list management.
Empty state handling with helpful user guidance.
Maintains visual consistency with main recipe list. 
![Screenshot 2025-02-13 at 11 55 10 PM](https://github.com/user-attachments/assets/f2aab46d-7ae3-455b-a936-8b4c6199e746)

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I focused on three core areas:

Robust Data Management -
Implemented efficient data fetching and caching for both JSON data and images.
Created a clear separation between raw API data (Recipe) and presentation models (ConvertedRecipe).
Built defensive error handling to ensure a smooth user experience even under poor network conditions.


Architecture and Code Quality -
Structured the app using MVVM pattern to maintain clear separation of concerns.
Designed reusable components like the custom TabBarView and YouTubeView.
Created well-organized, single-responsibility methods in the ViewModel.
Used Swift's modern features like @Observable and async/await for clean, maintainable code.


User Experience and Performance -
Implemented immediate UI feedback with loading states.
Added practical features like search and favorites that enhance usability.
Built efficient image caching to prevent unnecessary network calls.
Ensured smooth transitions and animations throughout the app.

I prioritized these areas because they represent the foundation of a scalable, maintainable application that provides real value to users while demonstrating strong iOS development practices.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spent approximately 8 hours on this project, with time allocated across several key development phases:

Data Layer Foundation (1.5 hours) -
Set up and validated JSON data fetching.
Designed and implemented data models (Recipe and ConvertedRecipe).
Built robust error handling for network requests.


Core Architecture (2 hours) -
Developed the ViewModel with MVVM pattern.
Implemented image caching system.
Created the base navigation structure.

Essential UI Implementation (2.5 hours) -
Built main recipe list view with thumbnail images.
Developed detailed recipe view with YouTube integration.
Added loading screen with animations.
Ensured smooth navigation flow.

Enhanced Features (2 hours) -
Implemented search functionality with real-time filtering.
Added favorites system with persistent state.
Created swipe-to-delete functionality for favorites.
Added UI polish like custom animations and loading states.

I chose to implement additional features like search and favorites because they demonstrate practical iOS development patterns (state management, filtering, user preferences).
They showcase my ability to think beyond basic requirements while maintaining code quality.

The project shows clean architecture, efficient data handling, and a polished user experience, which I believe are crucial for production-ready applications.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
In developing this app, I made a conscious choice to focus on functionality over fancy design elements. While the app might not win any beauty contests with its out-of-the-box Apple styling, this decision let me concentrate on what I believe really matters - creating a solid, well-built app that runs smoothly and handles data efficiently. 
I spent most of my time making sure the technical foundation was rock-solid. This meant getting the data management and image caching working perfectly, setting up a clean MVVM structure, and making sure everything performed smoothly with proper loading states. I also made sure to add practical features like search and favorites because I think they make the app genuinely more useful for people.
For the UI, I stuck with SwiftUI's native components. Sure, this means the app looks pretty standard, but it comes with some real benefits. Users already know how everything works because it follows familiar iOS patterns, it's automatically accessible, and it'll play nice with future iOS updates. Plus, using these components meant I could focus on making everything work really well instead of getting caught up in custom design work.
If I had more time, there's definitely room for visual improvements. I could add a custom color scheme, throw in some haptic feedback (which would feel great on that favorites button), create some slicker animations, and design some custom UI components to give it more personality. But I'm confident that what I've built shows I can create a well-structured, performant iOS app that gets the job done while leaving room for future enhancements.


### Weakest Part of the Project: What do you think is the weakest part of your project?
The weakest part of my project is definitely the lack of testing. I'm currently learning about testing through Paul Hudson's materials, and I can see how much value it would add to this project. Without proper tests, I can't be completely confident about several critical areas of the app.
For example, proper unit tests would help validate my URL handling - making sure the API endpoints are correctly formatted and the image URLs are properly processed. Integration tests would verify that my data flow works correctly, from fetching the JSON through to displaying the converted recipes in the UI. UI tests would ensure features like the favorites system and search functionality work reliably across different scenarios.
I also realize that testing would be particularly valuable for this app's architecture. With the MVVM pattern I implemented, having unit tests for the ViewModel would verify that all the business logic - like filtering recipes, managing favorites, and handling loading states - works as intended. This would make the code not just more reliable, but also easier to maintain and refactor.
I'm actively working to fill this knowledge gap. Testing is a crucial skill in professional iOS development, and I'm committed to learning and implementing it in my future work. In fact, this project would make a great candidate for adding tests as I continue learning, since it has clear functionality that would benefit from different types of testing approaches.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
While my resume tells part of my story, I want to emphasize that I'm a 39-year-old professional who's achieved success in my current field but is genuinely passionate about transitioning into iOS development. I understand that my development speed isn't yet where it could be, and I have plenty of room to grow as an iOS developer. However, what I bring to the table is a proven track record of professional success, a strong work ethic, and an genuine enthusiasm for learning and improving.
One of my greatest strengths is that I come with years of real-world experience in managing projects, collaborating with teams, and solving complex problems. I know how to communicate effectively, meet deadlines, and adapt to changing requirements - skills that transfer directly to software development. While I may be newer to iOS development specifically, I'm not new to being a dedicated professional who takes pride in delivering quality work.
This coding challenge has been incredibly valuable to me, regardless of the outcome. It pushed me to integrate multiple iOS concepts, from data management to UI implementation, and helped me identify areas where I can improve (like testing). I'm excited about continuing to grow as a developer and am committed to constantly expanding my technical skills.
Thank you for considering my application and for providing this learning opportunity. I look forward to applying what I've learned here to future projects, whether at your company or as part of my ongoing development journey. Thank you so much.
