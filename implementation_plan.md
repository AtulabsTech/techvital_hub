# TechVital Hub Implementation Plan

## 1. Database Structure

### Contexts and Schema

1. **Courses Context**

   - Course schema
   - Module schema
   - Lesson schema
   - Quiz/Challenge schema

2. **User Progress Context**

   - CourseProgress schema
   - LessonProgress schema
   - ChallengeProgress schema
   - Streak tracking

3. **Admin Context**
   - Content management
   - User management

## 2. Student Dashboard Implementation

Based on the provided design, we'll implement these LiveView components:

1. **Main Dashboard Layout**

   - Navigation sidebar
   - User profile section
   - Main content area

2. **Dashboard Header**

   - Personal greeting with progress percentage
   - Stats cards (points, courses, certificates, challenges)

3. **Continue Learning Section**

   - Current course with progress bar
   - Resume learning button

4. **Learning Streak Component**

   - Days streak counter
   - Weekly tracker (S M T W T F S)
   - Skill progress bars with XP

5. **Recommended Courses**

   - Course cards with difficulty level
   - Filtering options (All, Beginner, Intermediate, Advanced)

6. **Challenges Section**
   - Challenge cards with difficulty and question count

## 3. Admin Dashboard Implementation

1. **Course Management**

   - Create/Edit/Delete courses
   - Manage course modules and lessons
   - Upload and organize content (text, images, videos)
   - Create and manage quizzes/challenges

2. **User Management**

   - View and manage user accounts
   - Track user progress
   - Assign roles (student, admin)

3. **Analytics**
   - Course completion rates
   - User engagement metrics
   - Popular content tracking

## 4. Implementation Steps

1. Generate Phoenix contexts and schemas
2. Create LiveView pages and components
3. Implement LiveView features with real-time updates
4. Style components according to the design
5. Implement admin functionality
6. Connect all components with proper data flow
7. Test and refine the implementation

## 5. Course Content Structure

Based on the website outline, we'll organize content into these areas:

- **Learn Phase**

  - HTML & CSS Foundations
  - Core Language Concepts (Elixir)
  - JavaScript & DOM
  - REST and GraphQL with Phoenix
  - Ecto DB and Architecture
  - Version Control with Git

- **Build Phase**

  - LiveView
  - OTP & Testing
  - Advanced Phoenix and LiveView
  - Performance and Optimization
  - Deployment and DevOps
  - Integration with Other Tools
  - Security
  - Build a Fullstack App

- **Get Hired Phase**
  - Contribute Code to Production
  - Interview Prep
  - Team Collaboration
  - Online Presence
  - Networking
  - Freelancing and OpenSource

## Future additions

- add a chat feature
- add ask ai feature (ai to provide a roadmap)
- add a blog feature
- add earlybird/nightowl to welcome message
