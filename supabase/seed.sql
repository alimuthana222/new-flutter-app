-- =====================================================
-- SEED DATA
-- =====================================================

-- Categories
INSERT INTO categories (name_ar, name_en, icon, color, sort_order) VALUES
('برمجة وتطوير', 'Programming', 'code', '#6366F1', 1),
('تصميم وإبداع', 'Design', 'brush', '#EC4899', 2),
('لغات', 'Languages', 'translate', '#14B8A6', 3),
('أعمال وتسويق', 'Business', 'chart', '#F59E0B', 4),
('موسيقى وفنون', 'Music', 'music', '#8B5CF6', 5),
('رياضة ولياقة', 'Sports', 'weight', '#EF4444', 6),
('تعليم أكاديمي', 'Academic', 'teacher', '#3B82F6', 7),
('تطوير ذاتي', 'Personal Development', 'user-octagon', '#10B981', 8),
('تصوير وفيديو', 'Photography', 'camera', '#F97316', 9),
('أخرى', 'Other', 'more', '#6B7280', 10);

-- Hour Packages
INSERT INTO hour_packages (hours_amount, price_iqd, discount_percentage, sort_order) VALUES
(1, 5000, 0, 1),
(3, 13500, 10, 2),
(5, 20000, 20, 3),
(10, 35000, 30, 4);

-- Payment Methods (Update with your actual account info)
INSERT INTO payment_methods (name_ar, name_en, type, account_number, account_holder_name, instructions_ar, sort_order) VALUES
(
    'زين كاش',
    'ZainCash',
    'zaincash',
    '07XXXXXXXXX',  -- TODO: Replace with your ZainCash number
    'اسم صاحب الحساب',  -- TODO: Replace with your name
    'افتح تطبيق زين كاش > تحويل أموال > أدخل الرقم > أدخل المبلغ > اكتب رقم الطلب في الملاحظات',
    1
),
(
    'كي كارد',
    'Ki Card',
    'kicard',
    'XXXXXXXXXXXXXXXX',  -- TODO: Replace with your Ki Card number
    'اسم صاحب الحساب',  -- TODO: Replace with your name
    'افتح تطبيق كي كارد > تحويل > أدخل رقم البطاقة > أدخل المبلغ > اكتب رقم الطلب في الملاحظات',
    2
);

-- Storage Buckets (Run in Supabase Dashboard > Storage)
-- Create buckets: avatars, skill-images, receipts
-- Set all buckets to public for reading
