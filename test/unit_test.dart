import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:organiz4t3/models/task.dart';
import 'package:organiz4t3/models/user.dart';

void main() {
  group('Pruebas Unitarias del Dominio - Organízate (TRL 5)', () {
    test('CP-UNIT-01: Serialización y deserialización de la entidad Task (CRUD)', () {
      final taskOriginal = Task(
        id: 'task-test-001',
        titulo: 'Sustentación Fase 4 TRL 5',
        descripcion: 'Verificación de integración de componentes en entorno simulado',
        fechaVencimiento: DateTime(2026, 11, 22),
        horaVencimiento: const TimeOfDay(hour: 14, minute: 30),
        categoria: 'Académico',
        prioridad: 'Alta',
        completada: false,
        minutosAnticipacion: 30,
      );

      final map = taskOriginal.toMap();
      expect(map['id'], 'task-test-001');
      expect(map['titulo'], 'Sustentación Fase 4 TRL 5');
      expect(map['categoria'], 'Académico');
      expect(map['prioridad'], 'Alta');
      expect(map['completada'], false);

      final taskReconstruida = Task.fromMap(map);
      expect(taskReconstruida.id, taskOriginal.id);
      expect(taskReconstruida.titulo, taskOriginal.titulo);
      expect(taskReconstruida.categoria, taskOriginal.categoria);
      expect(taskReconstruida.prioridad, taskOriginal.prioridad);
      expect(taskReconstruida.horaVencimiento?.hour, 14);
      expect(taskReconstruida.horaVencimiento?.minute, 30);
    });

    test('CP-UNIT-02: Conmutación de estado completado y cálculo de vencimiento en Task', () {
      final task = Task(
        id: 'task-test-002',
        titulo: 'Revisión con Tutor',
        descripcion: 'Presentación de avances en foro colaborativo',
        fechaVencimiento: DateTime(2026, 11, 20),
        horaVencimiento: const TimeOfDay(hour: 9, minute: 0),
        categoria: 'Laboral',
        prioridad: 'Media',
        completada: false,
      );

      expect(task.completada, false);
      task.completada = true;
      expect(task.completada, true);

      final fechaHora = task.getFechaHoraVencimiento();
      expect(fechaHora?.year, 2026);
      expect(fechaHora?.month, 11);
      expect(fechaHora?.day, 20);
      expect(fechaHora?.hour, 9);
      expect(fechaHora?.minute, 0);
    });

    test('CP-UNIT-03: Serialización y validación de preferencias en UserModel (Perfil/Tema)', () {
      final user = UserModel(
        id: 'usr-unad-001',
        name: 'Juan Esteban Marulanda',
        email: 'jemarulandar@unadvirtual.edu.co',
        phoneNumber: '3001234567',
        birthDate: DateTime(1998, 5, 10),
        notificationsPreference: true,
        themePreference: 'dark',
        location: 'Medellín, Colombia',
        userType: 'estudiante-trabajador',
      );

      final map = user.toMap();
      expect(map['name'], 'Juan Esteban Marulanda');
      expect(map['themePreference'], 'dark');
      expect(map['notificationsPreference'], true);

      final userDesdeMapa = UserModel.fromMap(map);
      expect(userDesdeMapa.name, user.name);
      expect(userDesdeMapa.themePreference, 'dark');
      expect(userDesdeMapa.userType, 'estudiante-trabajador');
    });

    test('CP-UNIT-04: Clonación inmutable con copyWith en UserModel', () {
      final userOriginal = UserModel(
        id: 'usr-unad-002',
        name: 'Yeisson Pamplona',
        email: 'ypamplonap@unadvirtual.edu.co',
        phoneNumber: '3109876543',
        birthDate: DateTime(1996, 8, 15),
        notificationsPreference: true,
        themePreference: 'light',
        location: 'Bogotá, Colombia',
        userType: 'estudiante-trabajador',
      );

      final userActualizado = userOriginal.copyWith(themePreference: 'dark');
      expect(userActualizado.themePreference, 'dark');
      expect(userActualizado.name, userOriginal.name);
      expect(userActualizado.email, userOriginal.email);
    });
  });
}
