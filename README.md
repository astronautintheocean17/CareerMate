# CareerMate

**SIH26044 · Portal for Academia–Industry Collaboration for Skill Mapping, Internships and Placement**
Theme: Smart Automation · Category: Software
Team: **Tech Vectors** · SIH 2026

---

## 1. One-line pitch

CareerMate is a **unified, role-based platform** that connects **Academicians, Students, Faculties, Institutions, and Industries** through one **skill-mapped, keyword-driven engine** — for events, internships, placements, FDPs, research collaborations, and end-to-end career tracking.

---

## 2. The problem

- Academicians have limited access to industry exposure and collaboration.
- Students don't know which **industry skills** they're missing.
- Internships, placements, and industry-learning opportunities are **scattered** across channels.
- Industries struggle to find **skill-matched** candidates.
- Institutions lack a live view of **industry demand** to align curriculum and research.

## 3. The solution

A single platform that runs a **skill → opportunity → growth** loop:

> **Assess → Identify gaps → Recommend → Apply → Track → Build portfolio**

And on the supply side:

> **Institutions & Industries publish → engine tags with keywords → matched users see it instantly → engagement data feeds the demand dashboard.**

---

## 4. Who it serves (priority order)

| Priority | Role | What they get |
|---|---|---|
| 1 | **Academicians** | FDPs, FEPs, FIPs, research collaborations, consultancies, publications, industry connect |
| 2 | **Students & Faculties** | Skill assessment, gap analysis, internships, jobs, hackathons, mentorship |
| 3 | **Institutions & Universities** | Publishing console, analytics, accreditation-ready reports, alumni graph |
| 4 | **Industries** | Skill-matched hiring, projects, consultancy, CSR & research collaborations |
| 5 | **Event Organizers** | Reach a keyword-matched audience for any academic event |

---

## 5. Opportunity types offered (22 curated for academicians)

**Faculty & academic development**
FDP · FEP · FIP · Refresher Courses · Short-Term Programmes

**Knowledge exchange**
Workshops · Seminars · Webinars · Lectures · Symposia · Conferences

**Research & collaboration**
Research Collaborations · Project Partnerships · Consultancies

**Dissemination**
Publications · Presentations

**Training & industry immersion**
Traineeships · Apprenticeships · Internships · Jobs / Placements

**Competitive & showcase**
Hackathons · Contests · Expos & Fests · Industrial Visits

---

## 6. Core architecture flow

1. **Secure sign-in** — REST APIs · JWT sessions · Bcrypt-hashed passwords · multi-role.
2. **Profile & interest extraction** — skills, subjects, niche keywords, goals.
3. **Recommendation engine** — filters users and opportunities by keyword + interest + role overlap.
4. **Three-sided home** (for academicians & students):
   - **Profile-based recommendations**
   - **Niche / interest-based recommendations**
   - **Community** — a LinkedIn-style feed of posts from institutions, industries, and peers.
5. **Posting engine** — all roles can post both:
   - Events / programmes (structured)
   - Feed posts (free-form, LinkedIn-style)
   Posts are auto-tagged by field and pushed to keyword-overlapping users.
6. **Uploads by institutions & industries** — publish FDPs, jobs, internships, research calls.
7. **Live demand dashboard** — in-demand skill keywords, hire signals, trending tech — for every user.

---

## 7. Tech stack (planned full product)

| Layer | Choice |
|---|---|
| Mobile / Web app | **Flutter** + **Dart** |
| Backend | **Node.js** + **Express.js** |
| Database | **PostgreSQL** |
| Auth | **JWT** + **Bcrypt** |
| Real-time | **Firebase Cloud Messaging** |
| Deployment | **Vercel** / **Render** |
| Version control | **GitHub** |

---

## 8. What this repository contains (current phase)

A **single-file Flutter pre-product explainer app** — the "concept to product" walkthrough for SIH submission:

- `lib/main.dart` — app entry
- `lib/common/screens/landing_screen.dart` — the entire concept app (sections, popups, guided tour, responsive layout)
- `assets/images/icons/careermate-icon.png` — brand icon

**No backend. No network calls. Zero external packages beyond `cupertino_icons`.**

---

## 9. Design system

| Token | Value |
|---|---|
| White | `#FFFFFF` / Off-white `#F7F9FC` |
| Blue | `#1A4FD6` · Deep `#0B2B7A` · Soft `#E6EDFF` |
| Black | `#0B0F1A` · Ink `#1B2233` · Slate `#5A6478` |
| Sandal | `#F2E2C4` · Deep `#D9BE8A` · Soft `#FBF3E4` |
| Green | `#12A46A` · Soft `#E3F6EE` |

No other colors used anywhere.

---

## 10. Running the app

```bash
cd careermate
flutter pub get
flutter run