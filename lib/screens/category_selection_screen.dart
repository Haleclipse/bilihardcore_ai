import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:bilihardcore_ai/providers/quiz_provider.dart';
import 'package:bilihardcore_ai/models/category.dart';

class CategorySelectionScreen extends ConsumerStatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  ConsumerState<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState
    extends ConsumerState<CategorySelectionScreen> {
  final List<Category> _selectedCategories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // 使用Future.microtask延迟初始化，确保在构建完成后调用
    Future.microtask(() => _loadCategories());
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 获取分类列表
      await ref.read(quizProvider.notifier).getCategories();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('获取分类失败: $e'),
          ),
        );
      }
    }
  }

  void _toggleCategory(Category category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  String get _selectedCategoryIds {
    return _selectedCategories.map((c) => c.id.toString()).join(',');
  }

  void _confirmSelection() {
    if (_selectedCategories.isEmpty) {
      ShadToaster.of(context).show(
        const ShadToast.destructive(
          title: Text('错误'),
          description: Text('请至少选择一个分类'),
        ),
      );
      return;
    }

    // 返回上一页，并传递选中的分类ID
    Navigator.pop(context, _selectedCategoryIds);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final quizState = ref.watch(quizProvider);
    final categories = quizState.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('选择分类'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.primaryForeground,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorScheme.primary.withAlpha(13), colorScheme.background],
          ),
        ),
        child:
            _isLoading
                ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('正在加载分类...'),
                    ],
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShadCard(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '请选择你感兴趣的分类',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '可以选择多个分类，至少选择一个',
                                style: TextStyle(color: colorScheme.muted),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child:
                            categories.isEmpty
                                ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.category_outlined,
                                        size: 64,
                                        color: colorScheme.muted,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        '暂无分类',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '请稍后再试',
                                        style: TextStyle(
                                          color: colorScheme.muted,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 3,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final category = categories[index];
                                    final isSelected = _selectedCategories
                                        .contains(category);
                                    return isSelected
                                        ? ShadButton(
                                          onPressed:
                                              () => _toggleCategory(category),
                                          child: Text(category.name),
                                        )
                                        : ShadButton.outline(
                                          onPressed:
                                              () => _toggleCategory(category),
                                          child: Text(category.name),
                                        );
                                  },
                                ),
                      ),
                      const SizedBox(height: 24),
                      ShadButton(
                        width: double.infinity,
                        onPressed: _confirmSelection,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle_outline),
                            const SizedBox(width: 8),
                            Text('确认选择 (${_selectedCategories.length})'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
