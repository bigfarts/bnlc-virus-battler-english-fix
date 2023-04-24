local patches = {
    {
        msg   = chaudloader.unpack_msg(chaudloader.read_mod_file('message_eng/v1.msg')),
        exe6  = 0x087AD8BC,
        exe6f = 0x087AF988,
    },
    {
        msg   = chaudloader.unpack_msg(chaudloader.read_mod_file('message_eng/v2.msg')),
        exe6  = 0x087B0900,
        exe6f = 0x087B29CC,
    },
    {
        msg   = chaudloader.unpack_msg(chaudloader.read_mod_file('message_eng/v3.msg')),
        exe6  = 0x087B0554,
        exe6f = 0x087B2620,
    },
    {
        msg   = chaudloader.unpack_msg(chaudloader.read_mod_file('message_eng/v4.msg')),
        exe6  = 0x087B1FF4,
        exe6f = 0x087B40C0,
    },
    {
        msg   = chaudloader.unpack_msg(chaudloader.read_mod_file('message_eng/v5.msg')),
        exe6  = 0x08799230,
        exe6f = 0x0879B2FC,
    },
}

for _, dat_name in ipairs({"exe6", "exe6f"}) do
    local dat = chaudloader.ExeDat(dat_name .. ".dat")
    chaudloader.util.edit_mpak(dat, dat_name .. "/data/msg/message_eng", function (mpak)
        for i, patch in ipairs(patches) do
            chaudloader.util.edit_msg(mpak, patch[dat_name], function (msg)
                return chaudloader.util.merge_msg(msg, patch.msg)
            end)
        end
    end)
end
