import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_task_state.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<CreateTaskState>(
        builder: (context, state, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Task',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    _buildSelectionChip(
                      label: 'Today',
                      isSelected: state.dateSelection == TaskDateSelection.today,
                      onTap: () => state.setDateSelection(TaskDateSelection.today),
                    ),
                    const SizedBox(width: 12),
                    _buildSelectionChip(
                      label: 'Tomorrow',
                      isSelected: state.dateSelection == TaskDateSelection.tomorrow,
                      onTap: () => state.setDateSelection(TaskDateSelection.tomorrow),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('TITLE', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextField(
                  onChanged: state.updateTitle,
                  decoration: InputDecoration(
                    hintText: 'Buy rice',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: state.updateDescription,
                  decoration: InputDecoration(
                    hintText: 'Description (optional)',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
                  ),
                ),
                
                const Spacer(),

                // Botão de Criar
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () async {
                            final success = await state.saveTask();
                            if (success && context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Create', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectionChip({required String label, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? Colors.black : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}