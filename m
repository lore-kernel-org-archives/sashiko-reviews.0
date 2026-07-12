Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F439B943
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783846621; cv=pass; b=I18RIyTN8nwOeIvq5OFQi3vnNwWWufO2nycRBKKHLPff9fnFdZ6s6JOSrIAs7OR16pXpnHApX2bp0axaPF3U6vZPLIMukdNV5L3vcK5YGyPOsyQJ2E9lFYNHG7B/30xo1e8/RbVd555C/dGVr3cKkhxQedJpdTFrXOgSgI+3ge8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783846621; c=relaxed/simple;
	bh=BTKdcA8TI1tNpMMoU4EnrgdDcYmwA5L5/bKy9npVeAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebeLgdHCWRz/vJLRVFazJm+/LJcIJKoVGWu9RBLMpmGOGKxogY4RDnznAcPdUKFATwHlLxa5Ibv4vZpvUZOlLC/7xIhcc/ByKxc0eqwobpTLdi9nNShuGSyYsDqsZrZNMOxDWg7DuFJQKcLKT9ldj8CRpWdTUIkEniKCa6Sg2zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDhmtcM/; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDhmtcM/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7dbcb505578so22822917b3.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 01:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783846619; cv=none;
        d=google.com; s=arc-20260327;
        b=QZd53qq6bWrvpw61pmjhfq/1BSvUMuWrocdtNlmAPi1tAbUhIqlj8X0hLektraczjY
         ptQ/KoJXkJSXYV2QdCmWz11wmZTY6pPA3J+jXNlRQHg8Eln/zbmz1SdDN52p9iTAA1zU
         d/1AJ9wqH3N4MJiHCiL21oZbJx8ULRFpiIJB64eXiMvAlzhmGBBDO8JCkIYheNQ0HCDF
         hZnas2Q3oHt8msc66KbECUpf1tR1+Dw0joZjSz7Sw+pNaY1DxeNDwMyFhNxOCedtVC7u
         /nPsfXZ0PsL9G6uAu7abdRbCMHabG0A3RsQX2wcev5Kz416pews0phGfIfLVf+O2thM+
         ni2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OA4NjvqjjVgjSbCq8wm4XUY+Mt0pcYQZIok5F3x1dto=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Gtt4Zx+amNTKbDo7DRPF1ESigvIwhEH4biULegIoQNBERGhzK1dJnYJZH2ni+La1s6
         Abh7tVQ8wu+iFV+Yj0zh+r8ldY3K4xRK9X0VQLjjIv5ATXk59ST6gCRMbSPuxnDwvSeA
         K/RnierWuLgptgO0l9/USulO6FZ/9vv8GDQNSi8ByBsopC5MNmfY4qqxnsZdOywo/dB1
         pLPZCOSCr+Qg0WFRVNNncGVIPvcesQWhIl1iaVS4DH7R+H0f00je7wWYPdew923WVoZQ
         uQYELUOHFqxqY8TjFmPuTTpe7dUo8xDorE2BxQjIAduOD4xtjJYpuprMyPxMAUJEZQZ2
         i7/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783846619; x=1784451419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OA4NjvqjjVgjSbCq8wm4XUY+Mt0pcYQZIok5F3x1dto=;
        b=MDhmtcM/EFKveWLW0De+xUUj44T0Je1+osLbiI9oNW6yvZ7cxmb51rNWrBm+RIhj5+
         H5SrEBnVJw5I17YVVJflFAEYn/nImzmKgdVa+mCWSUFnQWlctYJ9FNMZU5CAE5WYpHub
         6pXDORr40jsAm9XnMiHlV5+IPIxy62TAW3ylsQ+sTavnBLVPEqIB+vf5ueZYpSn9p7F4
         w1JeUpu1dpkingkVxaZU3uCC79v3fEmxU0zuG5NuxKVhaclXKW6EvhzSmLud6Smhva7G
         Y939JjOrnulK5PEY3jdvLidgmF5xBWQzWx2/OfDJ8QF1GWQbBOqeR4YDV10gbB2GoZgX
         dHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783846619; x=1784451419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OA4NjvqjjVgjSbCq8wm4XUY+Mt0pcYQZIok5F3x1dto=;
        b=BDa5b9SXk86ltmb2wB65AURNy7IZR8zYcXR5oZKmzdnBYl2pAvy1N/aFqs8FYcSBvS
         eyLJLTpU/TWVWN7jV/O4gouHE9wugQt48+KgGhySOPQ9Iz0RZ5X1evIK4Lr1dQh+TCgo
         mM8OnGS2/RcprtM8rhU6fhfnVR3LW9KfqqhqHFLSbkq8yxL73Jt/9egZs17W0gMVhBzF
         wZ6iI3CMYt98uN+jxbMcOqxf6Q8bP7cJvTrRZP+z/xYoQK3SB1K4QZF+BwqK1Vqwtfr0
         Cgr1Zv64zLvWDZMle4Ie06HqpVQ4i1TUZkNFaEfi7rkas7Mey29ruf6yEb/XyXoXR2z2
         s6VA==
X-Gm-Message-State: AOJu0YybRtMy2oNMLq/ijydSg0YzIokEboH2Ts5BZnlcf3Zs/eqxnlTk
	JnEgbA0K537NJ2YGq/J8P1WU7loQt0SY0BtaGWTpUGRWfmwn0A9YzMozQyvaoHc8L8r6tXlPHtP
	YSzY5hKLXdm0lhjUZQhP+Uc2Ccv24WRJPq8uK8HM=
X-Gm-Gg: AfdE7cmI9t6rbEj7epkO1wuiMw3l1bbV0O5uBKJgw+wlILEmybY2f1AQbQCmfypR4TI
	X+m0xwv8w7QXUMFouWmIBBN6X2rYLPn0X6NrlAlAVQ0QR+aOPx8uJDu4zJc+sWM8IzjU/kcBCi9
	BypUuK+Cp8NkR9Ps/lFCcTiiO5+gfAuJa7RW4o1ku2CDRI9GN7JQlZQ1HUDTDOeVskUF8iVyVAI
	9YNPV1QVSkLhuvubr1yY8N4Bm3JoExJej7c4v74KU41opBgRm7sesN2uyHThPSQY7eRt1PVIv4/
	IwqccTBvptb/582VhZpXF9WIgHyB1g==
X-Received: by 2002:a05:690c:6384:b0:7ff:23df:b1e1 with SMTP id
 00721157ae682-81e9017c3d7mr38670937b3.49.1783846618776; Sun, 12 Jul 2026
 01:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260712062834.77872-1-laoar.shao@gmail.com> <20260712063739.F1E5B1F000E9@smtp.kernel.org>
In-Reply-To: <20260712063739.F1E5B1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 12 Jul 2026 16:56:22 +0800
X-Gm-Features: AUfX_my42dTgxKS8E-tpDtyxxBdo1crIuxutnlED0A-sTjlfKJVEKo2oP9ejFxw
Message-ID: <CALOAHbAK2WqxnTWEL5+c8Q57i91mg8TMmHw1MPcK9duaBjgreQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Preserve .BTF section in kernel modules
 during debuginfo stripping
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 2:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Unconditionally passing `--keep-section .BTF` to `find-debuginfo.=
sh` breaks RPM builds on older distributions.
> --
>
> --- Patch [1]: [PATCH] kbuild: rpm-pkg: Preserve .BTF section in kernel m=
odules during debuginfo stripping ---
> commit cf88f1e030f88c3862874c09c0ef198fa1f1e9ca
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo=
 stripping
>
> This commit modifies the kernel RPM spec file to pass the --keep-section =
.BTF
> flag to the find-debuginfo.sh script. This preserves the .BTF section dur=
ing
> debuginfo extraction, ensuring that BPF tools can successfully resolve ke=
rnel
> types at runtime for modules.
>
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index c732415662ef2..abc73de019e0c 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
> [ ... ]
> > @@ -67,7 +67,7 @@ This package provides debug information for the kerne=
l image and modules from th
> >  %undefine _unique_debug_srcs
> >  %undefine _debugsource_packages
> >  %undefine _debuginfo_subpackages
> > -%global _find_debuginfo_opts -r
> > +%global _find_debuginfo_opts -r --keep-section .BTF
>
> [Severity: Low]
> Will unconditionally passing --keep-section .BTF break the build on older
> distributions?
>
> Older versions of the find-debuginfo.sh script (such as those shipped wit=
h
> RPM 4.14 on RHEL 8, CentOS 7, or Ubuntu 20.04) do not support the
> --keep-section option.
>
> Because those legacy scripts parse arguments strictly, they will exit wit=
h a
> usage error when encountering an unrecognized flag, which completely brea=
ks
> the make rpm-pkg and make binrpm-pkg build targets on those systems.
>
> Is there a way to verify feature support or utilize RPM conditionals befo=
re
> applying this flag to the host script?

What about the following change?

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index c732415662ef..2e16de54ed74 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -67,7 +67,7 @@ This package provides debug information for the
kernel image and modules from th
 %undefine _unique_debug_srcs
 %undefine _debugsource_packages
 %undefine _debuginfo_subpackages
-%global _find_debuginfo_opts -r
+%global _find_debuginfo_opts -r%{?with_keep_section: --keep-section .BTF}
 %global _missing_build_ids_terminate_build 1
 %global _no_recompute_build_ids 1
 %{debug_package}
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index c604f8c174e2..00acef348ba8 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -65,6 +65,11 @@ fi
 echo "%define with_debuginfo_manual $with_debuginfo_manual"
 echo "%define with_debuginfo_rpm $with_debuginfo_rpm"

+# Detect if find-debuginfo.sh supports --keep-section (RHEL 9+)
+if find-debuginfo.sh --help 2>&1 | grep -q keep-section; then
+       echo "%global with_keep_section 1"
+fi
+
 cat<<EOF
 %define ARCH ${ARCH}
 %define KERNELRELEASE ${KERNELRELEASE}


--=20
Regards
Yafang
