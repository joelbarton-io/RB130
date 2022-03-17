static VALUE
enum_inject(int argc, VALUE *argv, VALUE obj)
{
    struct MEMO *memo;
    VALUE init, op;
    rb_block_call_func *iter = inject_i;
    ID id;

    switch (rb_scan_args(argc, argv, "02", &init, &op)) {
      case 0:
        init = Qundef;
        break;
      case 1:
        if (rb_block_given_p()) {
            break;
        }
        id = rb_check_id(&init);
        op = id ? ID2SYM(id) : init;
        init = Qundef;
        iter = inject_op_i;
        break;
      case 2:
        if (rb_block_given_p()) {
            rb_warning("given block not used");
        }
        id = rb_check_id(&op);
        if (id) op = ID2SYM(id);
        iter = inject_op_i;
        break;
    }

    if (iter == inject_op_i &&
        SYMBOL_P(op) &&
        RB_TYPE_P(obj, T_ARRAY) &&
        rb_method_basic_definition_p(CLASS_OF(obj), id_each)) {
        return ary_inject_op(obj, init, op);
    }

    memo = MEMO_NEW(init, Qnil, op);
    rb_block_call(obj, id_each, 0, 0, iter, (VALUE)memo);
    if (memo->v1 == Qundef) return Qnil;
    return memo->v1;
}