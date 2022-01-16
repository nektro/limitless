const std = @import("std");
const Arch = std.Target.Cpu.Arch;

pub const targets = struct {
    pub const debian = std.ComptimeStringMap(?Arch, .{
        .{ "amd64", .x86_64 },
        .{ "i386", .i386 },
        // .{ "arm64", .aarch64 },
        // .{ "armel", .arm },
        // .{ "armhf", null },
        // .{ "mips", .mips },
        // .{ "mips64el", .mips64el },
        // .{ "mipsel", .mipsel },
        // .{ "ppc64el", .powerpc64le },
        // .{ "s390x", .s390x },
    });

    pub const alpine = std.ComptimeStringMap(?Arch, .{
        .{ "x86_64", .x86_64 },
        .{ "x86", .i386 },
        // .{ "aarch64", .aarch64 },
        // .{ "armv7", .arm },
    });
};

pub fn DeclEnum(comptime T: type) type {
    const fieldInfos = std.meta.declarations(T);
    var enumDecls: [fieldInfos.len]std.builtin.TypeInfo.EnumField = undefined;
    var decls = [_]std.builtin.TypeInfo.Declaration{};
    inline for (fieldInfos) |field, i| {
        enumDecls[i] = .{
            .name = field.name,
            .value = i,
        };
    }
    return @Type(.{
        .Enum = .{
            .layout = .Auto,
            .tag_type = std.math.IntFittingRange(0, fieldInfos.len - 1),
            .fields = &enumDecls,
            .decls = &decls,
            .is_exhaustive = true,
        },
    });
}
