Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D434D90D
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193107; cv=pass; b=Yyz68YgAGklcicku+pmSd1ZnFbxY/3qOED9ysvrFOrupyUv7xhQ1iUB5zC8HvrTpvIWcEshwuFhAfINCB7vILH5Xsb1dL3TCeM5lmhJTB1O5ZZsFxG/VukW38pPCGN8ZVBUWFeg1mc2zLnzUukEDo/oKJpIwcEUwpcCvSBCEYiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193107; c=relaxed/simple;
	bh=wVaUyhiHHt8mdGxE8HABkjb3Q1pGok7lbO2wwK1myg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hn0sg8ReMjMofzafG1cP8+64aldxBFqOJKW4lMXAZAMp1HAm+jLydAQqBvvAAgA84l7+dd6/pskVBfCV6OMEDUKBfDT5F4ZctWRe4GVM3bRU2dPWgFHx48grqeMmKioZ7GQQPGsTvMVCoS+aq8az0WFG1PB/GadYrGVpeHPjMwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJfof4Qw; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJfof4Qw"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81ee6b2da98so2476477b3.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 02:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193102; cv=none;
        d=google.com; s=arc-20260327;
        b=h1fr4enYdnOvBQm6nPCLdaPe+/8xLrXPXgYdV1kGc/chLmprMxjT7Zqt4ZTtasBfxM
         ESoUuB7DeY8o7hIbkPKyLNysSjnrahXS/ZOwItJ8yWMaRx76DKkOyBdOV/D1hxNXTPy4
         ewAA5fuMDq4vJNmCISePgMx9/QSMueRUwDHuCyxxiPUyO75o7edZftn5ffKnOh+0a5Bx
         laFrIZlDAFWWqbbB5So0ZkNZFpt2FDmUUaItPB0CHt9Ay305icfoUfnsrlcccSiMdbZa
         tbRcfZEGGcNSgiEurY8Sj+w2r2lX9fuk2EYhLYfGFno4vYqHPUgW3k80PyfJPXCdVRM9
         Cy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fba8lwegZlYj1IsPa0gj15+gvYVmAsXII13vXbs6KfY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=NHG+0bMXYDLR5q9b5jnAwljDkJEWjLyixjZNrne1/6bbDFRREI6G21ZsEot5eK4GdO
         EFA0prSbUliKP8keExfIIJeC6imdXZl9hepc7t31L+vA4BiCecrVh9oK7P2MVjrzom4h
         aUa+x4t4jamA9v2WWIuLEfFNjc1jImQttmctNo3pVWCRhzY5baJf4zbJ10+p5YunjKkI
         rZxyvJgYAwKIWYRHVKdkJbQcY8jhWQIkOzz3qGTcJyswCZo3jM/mIujIGUdEdyp1IY36
         yw842nyLbp0GTPraMnUYZT64GDpIY4l6hY+wpyTSTcQyTejRi1qKD3AHU4ff0bQ5lzwr
         aDGw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784193102; x=1784797902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fba8lwegZlYj1IsPa0gj15+gvYVmAsXII13vXbs6KfY=;
        b=tJfof4QwyPv5zu0hQYI5MK+kBKESqfrBWhB4MlvpSRq0DI4tlg0UpEiOw5HzCc7+UY
         sHcTq58w+yeVpD/aWQBRoet6V9fhx5Jj6YaK9mBDpepMmGxwDf12wYOTy/2ONN+SCyun
         3wpTUi/AIyYbsoYPUfnizWnauBcgxBvNJUSczB9FzJuzbPxohLHVoO+qydnmlBf6euor
         uViafsklzl+CwF+dUf4vWliabDIeBvp00jKrDmB7IENSb4V5ljoXcKHPcNj+62ZSHJ6/
         ckQawkI12/QC2jS8cYpyrrxjUL9BeW/5zhrTzBcRv7Bs2uFLPsWNXKxQR/7zGMfJL7Zv
         DakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193102; x=1784797902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fba8lwegZlYj1IsPa0gj15+gvYVmAsXII13vXbs6KfY=;
        b=a8or5oOLGtGVQYPNyBopINmJQH2Gl48m8G549C3DibLHfWgHzRSuJuI3u3wBOlEtot
         uNCHcvbpMIkubidh/bDI7TIdiTtmDFqve+6ERB1ZvA9kfn1QT5pG4g3BbmEWY/2by0Ny
         qXWdLR7y78YacIxegc8Ph32GZSS5VqdVSL4IQj1LlNYIlNR3jg5NcW/+E3dVuN0/y07h
         +JM3ATkAFcWniJ3XOlAsmEX43POVS5ZDirJQSvCjfr8dVLvMNzBbTisE29h/yL0ppbtO
         jegQaBNdyEzhrPXqyirkyIboG0kuf2nYM6Nt+/3MIdcf1TmqqXiVuzfzgZbs5pZp/qg8
         Ql6A==
X-Gm-Message-State: AOJu0Yx+BEgpoCeBJARsOML7S7weKnojTWuzI8DjhzGSGYaQ85YuFWHT
	BGJTqr4nLRdE/yIUU/Ry6/J5MUD4mypVWfT5mhN65pj4e74vcBHPvI4mvIhuzXHnDpU5oGKvn41
	0C8xQgCas6Hazo/Z9QPuJ4ycVMvudXnVTFMK0Duc=
X-Gm-Gg: AfdE7cmewGpeyT2D9ryQZSiUP7sk6CiZPQjDHQaFu4f0uE4TuWIGGs5hpZVJEL+niCd
	XPSdpWhpiSo6jCqDM3u3O1EQtZxMEkVbtSBsv/XDVfZV50Knvaa4c3NhECp5WpFvszxKNtXaHis
	10TC/aRJ+hzmn4L8wahO5YOqgMEVsQZMBauaLm+3YC1qzR/DcaG4rqI4jrJdzeP29N0gh3uwFOU
	0g5YzHsp962OJ/dvd7+h9QqYYb1m3Ece2ZQoxj5ryuD6sjkJAfiReeP3SaVMw8xpRn1lToL2+RL
	Pwjp0OysbaKjqobIpok=
X-Received: by 2002:a05:690c:6985:b0:814:5312:47bb with SMTP id
 00721157ae682-81e902edf4cmr160319997b3.69.1784193101804; Thu, 16 Jul 2026
 02:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716025342.42628-1-laoar.shao@gmail.com> <20260716030116.C613E1F000E9@smtp.kernel.org>
In-Reply-To: <20260716030116.C613E1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 16 Jul 2026 17:11:05 +0800
X-Gm-Features: AUfX_mzbQk6cyOjkJvVnkqd3j5MPhxg-oxSB2r6szyXH0u_dDwMsDN22ChRo4OE
Message-ID: <CALOAHbBQhAsTMHMMZH5Sen0cDYg8GREZMmQcT4Njc9VW_WHe4Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rpm-pkg: Preserve .BTF section in kernel
 modules during debuginfo stripping
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 11:01=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The check for `find-debuginfo.sh` capabilities in `mkspec` har=
dcodes host properties into `kernel.spec`, breaking SRPM portability across=
 distributions and failing silently when the tool is not in `$PATH`.
> --
>
> --- Patch [1]: [PATCH v2] kbuild: rpm-pkg: Preserve .BTF section in kerne=
l modules during debuginfo stripping ---
> commit 99202060a54c32638e01a2bfdc4d23b190f3f77c
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo=
 stripping
>
> This commit updates the RPM packaging scripts to pass --keep-section .BTF
> to find-debuginfo.sh. This ensures that BTF information is preserved when
> debuginfo is stripped from kernel modules.
>
> > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > index c604f8c174e2c..00acef348ba84 100755
> > --- a/scripts/package/mkspec
> > +++ b/scripts/package/mkspec
> [ ... ]
> > @@ -65,6 +65,11 @@ fi
> >  echo "%define with_debuginfo_manual $with_debuginfo_manual"
> >  echo "%define with_debuginfo_rpm $with_debuginfo_rpm"
> >
> > +# Detect if find-debuginfo.sh supports --keep-section (RHEL 9+)
> > +if find-debuginfo.sh --help 2>&1 | grep -q keep-section; then
> > +     echo "%global with_keep_section 1"
> > +fi
>
> [Severity: Medium]
> Is it safe to assume find-debuginfo.sh is in the standard user $PATH?
>
> On many systems, this script resides in /usr/lib/rpm/, which isn't typica=
lly
> in the $PATH. This could cause the check to silently fail and strip the .=
BTF
> section during a local make rpm-pkg build.
>
> Also, since mkspec runs during SRPM generation (make srcrpm-pkg), doesn't
> this statically bake the generation host's capabilities into the resultin=
g
> kernel.spec file?
>
> If the SRPM is rebuilt on an older distribution, rpmbuild might fail beca=
use
> the older script rejects the --keep-section argument. If generated on an
> older host and built on a newer one, BTF info would be silently stripped.
> Could we dynamically query the target host's capabilities using something
> like %(__find_debuginfo) inside the spec file itself?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716025342.42=
628-1-laoar.shao@gmail.com?part=3D1

I believe we could use the builtin _rpmconfigdir to locate
find-debuginfo.sh reliably. This avoids relying on $PATH.
What do you think about the following change?

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index c732415662ef..4335e99f2aca 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -67,7 +67,21 @@ This package provides debug information for the
kernel image and modules from th
 %undefine _unique_debug_srcs
 %undefine _debugsource_packages
 %undefine _debuginfo_subpackages
+
+# Preserve .BTF section in kernel modules during debuginfo stripping
+# find-debuginfo.sh (from debugedit) uses eu-strip which removes
+# non-allocated ELF sections like .BTF by default.
+# --keep-section .BTF preserves BPF Type Format information.
+#
+# Uses _rpmconfigdir for reliable script location instead of relying on $P=
ATH.
+%{!?with_keep_section:%global __fd %{_rpmconfigdir}/find-debuginfo.sh}
+%{!?with_keep_section:%global with_keep_section %(%{__fd} --help 2>&1
| grep -c keep-section)}
+%if %{with_keep_section}
+%global _find_debuginfo_opts -r --keep-section .BTF
+%else
 %global _find_debuginfo_opts -r
+%endif
+
 %global _missing_build_ids_terminate_build 1
 %global _no_recompute_build_ids 1
 %{debug_package}

Please let me know if this approach works or if there are any concerns.

--=20
Regards
Yafang
