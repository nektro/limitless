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

    pub const freebsd = std.ComptimeStringMap(?Arch, .{
        .{ "amd64", .x86_64 },
        .{ "i386", .i386 },
        // .{ "arm64-aarch64", .aarch64 },
        // .{ "powerpc", .powerpc },
        // .{ "powerpc-powerpc64", .powerpc64 },
        // .{ "powerpc-powerpc64le", .powerpc64le },
        // .{ "powerpc-powerpcspe", null },
        // .{ "riscv-riscv64", .riscv64 },
    });

    pub const netbsd = std.ComptimeStringMap(?Arch, .{
        .{ "amd64", .x86_64 },
        .{ "i386", .i386 },
        // .{ "acorn32", null },
        // .{ "alpha", null },
        // .{ "amiga", null },
        // .{ "arc", null },
        // .{ "atari", null },
        // .{ "cats", null },
        // .{ "cobalt", null },
        // .{ "dreamcast", null },
        // .{ "emips", null },
        // .{ "evbarm-aarch64", null },
        // .{ "evbarm-earm", null },
        // .{ "evbarm-earmeb", null },
        // .{ "evbarm-earmhf", null },
        // .{ "evbarm-earmhfeb", null },
        // .{ "evbarm-earmv6hf", null },
        // .{ "evbarm-earmv7hf", null },
        // .{ "evbarm-earmv7hfeb", null },
        // .{ "evbmips-mips64eb", null },
        // .{ "evbmips-mips64el", null },
        // .{ "evbmips-mipseb", null },
        // .{ "evbmips-mipsel", null },
        // .{ "evbppc", null },
        // .{ "evbsh3-sh3eb", null },
        // .{ "evbsh3-sh3el", null },
        // .{ "ews4800mips", null },
        // .{ "hp300", null },
        // .{ "hpcarm", null },
        // .{ "hpcmips", null },
        // .{ "hpcsh", null },
        // .{ "hppa", null },
        // .{ "ia64", null },
        // .{ "ibmnws", null },
        // .{ "luna68k", null },
        // .{ "mac68k", null },
        // .{ "macppc", null },
        // .{ "mipsco", null },
        // .{ "mvme68k", null },
        // .{ "mvmeppc", null },
        // .{ "news68k", null },
        // .{ "newsmips", null },
        // .{ "ofppc", null },
        // .{ "pmax", null },
        // .{ "prep", null },
        // .{ "sandpoint", null },
        // .{ "sgimips", null },
        // .{ "shark", null },
        // .{ "sparc", null },
        // .{ "sparc64", null },
        // .{ "sun2", null },
        // .{ "sun3", null },
        // .{ "vax", null },
        // .{ "x68k", null },
        // .{ "zaurus", null },
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
