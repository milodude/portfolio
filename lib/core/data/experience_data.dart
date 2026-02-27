import 'package:portfolio/features/landing_page/domain/entities/job_data.dart';

List<JobData> getExperienceData() => <JobData>[
      JobData(
        startDate: 'nov. 2025',
        endDate: 'actualidad',
        techs: [
          'Flutter',
          'Dart',
          'Firebase',
          'Cloud Functions',
          'Fastlane',
          'Clean Architecture'
        ],
        description:
            'Lideré el desarrollo de una aplicación móvil multiplataforma para profesionales de la salud mental. '
            'Diseñé e implementé una arquitectura móvil escalable utilizando Flutter y Firebase. '
            'Optimicé consultas en Firestore, reduciendo costos operativos y mejorando el rendimiento. '
            'Desarrollé lógica backend con Cloud Functions para recordatorios y notificaciones push. '
            'Implementé CI/CD con Fastlane y gestioné el ciclo completo hasta la publicación en Google Play Store.',
        company: 'Arquitecto de Software - Autónomo - Psi turnos',
      ),
      JobData(
        startDate: 'sept. 2024',
        endDate: 'actualidad',
        techs: [
          'Arquitectura de software',
          'Flutter',
          'Clean Architecture',
          'Modularización',
          'Unit Testing'
        ],
        description:
            'Lideré mejoras de arquitectura en aplicaciones móviles y backend, aumentando la escalabilidad. '
            'Definí patrones de arquitectura modular, reduciendo deuda técnica y mejorando la reutilización. '
            'Introduje estrategias de testing unitario e integración, incrementando la confiabilidad. '
            'Establecí buenas prácticas de clean code y colaboré en equipos multidisciplinarios bajo Agile/Scrum. '
            'Realicé optimizaciones continuas sobre sistemas legacy.',
        company: 'Arquitecto de Software - Freelogic',
      ),
      JobData(
        startDate: 'sept. 2023',
        endDate: 'actualidad',
        techs: [
          'Bloc',
          'Flutter',
          'Offline-first',
          'Sembast',
          'REST API',
          'SOLID',
          'Unit Testing'
        ],
        description:
            'Diseñé y desarrollé un sistema mobile de gestión de pedidos con arquitectura offline-first. '
            'Implementé principios de Clean Architecture y gestioné persistencia local con Sembast. '
            'Integré comunicación segura mediante REST APIs, manejando sincronización de datos y errores. '
            'Desarrollé testing unitario en capas de presentación, dominio y datos, reduciendo errores en producción.',
        company: 'Ingeniero de Software - Nini Mayorista',
      ),
      JobData(
        startDate: 'sept. 2025',
        endDate: 'feb. 2026',
        techs: [
          'Flutter',
          'Clean Architecture',
          'Multiplataforma',
          'Unit Testing',
          'B2B'
        ],
        description:
            'Implementé funcionalidades clave en aplicaciones Flutter multiplataforma para el sector mayorista. '
            'Diseñé y apliqué Clean Architecture, mejorando la productividad del equipo y escalabilidad. '
            'Participé en el desarrollo de apps mobile y web utilizadas por vendedores en entornos productivos. '
            'Desarrollé tests unitarios y colaboré con equipos de producto y backend para soluciones escalables.',
        company: 'Arquitecto de Software - HyF',
      ),
      JobData(
        startDate: 'abr. 2024',
        endDate: 'feb. 2026',
        techs: [
          'Flutter',
          'Firebase',
          'NoSQL',
          'Marketplace',
          'Realtime Database'
        ],
        description:
            'Diseñé y desarrollé un marketplace de servicios mobile (Android/iOS) conectando usuarios con proveedores. '
            'Implementé un backend escalable con Firebase Realtime Database para sincronización en tiempo real. '
            'Desarrollé funcionalidades de descubrimiento de servicios, matching y actualizaciones en tiempo real. '
            'Apliqué mejores prácticas de arquitectura mobile para garantizar una solución lista para producción.',
        company: 'Ingeniero de Software - Two Brains',
      ),
      JobData(
        startDate: 'ene. 2020',
        endDate: 'ago. 2023',
        techs: [
          'Flutter',
          'BLoC',
          'Animaciones',
          'UI/UX',
          'Cloud Firestore',
          'Google Play'
        ],
        description:
            'Desarrollé un juego de mesa mobile utilizando Flutter, logrando una experiencia fluida y atractiva. '
            'Implementé manejo de estado con BLoC y diseñé animaciones personalizadas y efectos de sonido. '
            'Optimicé el rendimiento de renderizado en Android y publiqué exitosamente la app en Play Store. '
            'Apliqué principios SOLID y buenas prácticas de responsiveness.',
        company: 'Flutter Developer - Freelance - La bomba',
      ),
    ];
