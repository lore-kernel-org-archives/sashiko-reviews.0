Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B41236403A
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784861411; cv=pass; b=gMzZHzJRha1nFgmA0QV6m2RF3eEG73PryozWmhwWZBJ24J//7TP77IsIexNSufY/8nESVa6Vaeyjq/szcmj3v1y6gjxuf8EGZxDXDX9l+4yt7UiGwEknIeRWXHcaXNy+8Z56QaRwp8283Kie5ZLexk0LezKhdCzYvzTFzKMYhOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784861411; c=relaxed/simple;
	bh=LlyMjsNHdsUuxQgVfFn6++gdurtIqbh4ZQGPRj0xAwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEFzSoUUY1vxIbg4MoCoFZ1MN+WLfEXeUzWmx/jYRdcHpY5X9f9SeaWoB8Xgozgw71f4YtF4J10E+8RjvmpgRSFtVUuggBM3bmju0pzcGChsiwCF3IyqYu6yZmrW/CilYMemGvu8vxIcCsyZsI7G8SuJxyl+/wA+Qih8MnuhLx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7U3Gvld; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7U3Gvld"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ee41aaec1so13071567b3.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 19:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784861400; cv=none;
        d=google.com; s=arc-20260327;
        b=YoP0r3iOA3i1aclsL/ToTvs8m/es3EwoMbnNHSFrDO2oTGV7DkOzHnfwG5yKefjjTZ
         fNzkPtwS2fc2b0n4gHzEzmDCFYUm6Jcl6fr/4iZ1sK/Obub+fNx/wPKtTmDDf7gAGDio
         g5ViOPs9cCmQ1nGeCamVkaFFQ84AdwOSn/CrYwCoypCTrjIn9He9XR5Y2HcO+HTLE4zP
         ge4fAtuXBS72QmB81rTl7LtbKBNosMa3w+m/T42W83vF3cVxd/kwqX5T+UUUUtt5xslQ
         7WCN/G9EZ8j8LxFDbvVh9+5kNzsDrw2o9HQyikVCv93KU6PTKZIAvOgaTL6JRN2G4aB6
         HJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00Cvm/3c2TLsfbxxx1AW+Cm3la7AGYnkd4OOPtsnuxQ=;
        fh=8keOrTAuYltPClM5QhK86mK86dAggqJgav/4GcSzBc0=;
        b=FZaWWgPv6JNsXZCQ0AFHoz0ZqVloGPq4iXvpywIp9yn/PNsWiqAGX60dGzj51gIl1/
         bRs9owk58H0Rz7XpMiNoZ+nc96Nu+O2YroxlAFNON/yTW3apXFsdh+Vtz+NyAVvPG/v5
         VC7opMxePhuSV6WOWdu/aQLGKyyw+XeVAUs9n8Iey04Qx3LhzZEyYDOIApH4mMcXv4na
         8tnmlymXOanCymZGaq5F9PRJifkoEttxoUC2w0/zi2zLZqhqOpbDvjA7bJjjbFZoWTZ+
         HpUdxtE63Wwh+fzkkisQR1pl3XXzonV6ilaE0syU54BCwehV+Tgg7bWFrlY+pg26VgM/
         r+7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784861400; x=1785466200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=00Cvm/3c2TLsfbxxx1AW+Cm3la7AGYnkd4OOPtsnuxQ=;
        b=e7U3GvldllDdF8VPv11ebbCpoBHEKz1fRmhGU1Q39ruoMkgJlC9tmiGQOoto/mWagu
         NDPhRiICs6J4DGA1hZKAvW0YqJA8N75h+uw8i0Qdx0lLlPC/kAQrlxR/gFCrqShVGcwg
         ZqLXKkw9wHClPJBMcHJmT/vNU48t0esNOv7pfeFEeVr2TRNCJxz0WJwx+MruR/qX24z8
         NnRWZAkOIxNizDHtMNwNHbhiI3Nc+1URcW/jWJjomRmj6MCpHtOXeVGOQ+KmSWROnQcP
         UsmPMyB+zGasrgLOg8bNH+y1QMMVQ3BLy29+af38PqF4fNctF1bNvqwSwbQ6OaGVP9bA
         kKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784861400; x=1785466200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00Cvm/3c2TLsfbxxx1AW+Cm3la7AGYnkd4OOPtsnuxQ=;
        b=oWH8q9WkQZeH8sFxDC1rEAeQaNwH1DwPBh4PL/l55sPe3oUGGaDQByMGd6Qm8OJwna
         Ds0Bt4agBjOD6yztc734DImtl9u3ye88zz7e8WFX1utOJgvXDLwkOIhADrlE7t2CgmD+
         TyTmaxfBgGlDtMnvxcA2N27MRay7RNwmYBv2KI7DHUIik0jjf0B39MVrFXXeI8KLg/XE
         kojAilyOQkTf0JvpZ0O58STePJvRO2rKV4artsP8snXJF6egykIr6slQH7CTxBj+SDc/
         mEZBWPxhTozOkqlP4v9JwBUqD1NELCv7qpYwRBdpUwQzgIz1IWIe5GjBrTOr70xY/XoD
         1ttQ==
X-Gm-Message-State: AOJu0YxkvQWXHj/YCXo0idUK0P/dwZPi5v5NKYk2rjdfbNJKkZNcfZLL
	pGQwIjv4GPmb5yyqr2kvvWG8Plis/IwqkU690sxA70ed86y4muaE7FLg+otBGfKauyvqGh6q+IZ
	I4T703P4BXqOZlocieblsbXEByRUy+T4=
X-Gm-Gg: AR+sD12wn3HsSX2zt8Bal6lbzpme1JA/zFYVAZqWL9aN5Ka2hBuQt5w90eQcbajUTsA
	I7mXIB+LfxmmBmYzAjnIF6AluwBRnmTOblIxtEGxlOJQTr19bUOXwJK42ODOmGfP0BgdBtSekdH
	FXqufJzAZs4I1lB8rMjs7o0UlwF6NKffDIeJ2VCJV5z0jiSbjzx0aDYhjf7pvfW/1vAIswn1NWH
	Lv3hOwbnNL4p2mQMQotPSDAZkTH7bqepAjEgM6MEuZyah06XhZBTMjuLoPc2MYbM+3zvUH5m8Lr
	KE/27pJpUjXecJdCFck=
X-Received: by 2002:a05:690c:600c:b0:81e:6800:47a3 with SMTP id
 00721157ae682-81f4c2cb486mr18496477b3.43.1784861400083; Thu, 23 Jul 2026
 19:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716025342.42628-1-laoar.shao@gmail.com> <20260716030116.C613E1F000E9@smtp.kernel.org>
 <CALOAHbBQhAsTMHMMZH5Sen0cDYg8GREZMmQcT4Njc9VW_WHe4Q@mail.gmail.com> <20260724000015.GA2803569@ax162>
In-Reply-To: <20260724000015.GA2803569@ax162>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 24 Jul 2026 10:49:24 +0800
X-Gm-Features: AUfX_mxJO5tjKSxpTooYrh9hBcU0-eLxdrln4YanzcWe_FR9ecfkIhSWbqDr-J0
Message-ID: <CALOAHbCaKNF2=Q0qCHbQttP4+LOwOdnxHKbdLeiJi0+2JKkvNQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rpm-pkg: Preserve .BTF section in kernel
 modules during debuginfo stripping
To: Nathan Chancellor <nathan@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Jul 16, 2026 at 05:11:05PM +0800, Yafang Shao wrote:
> > On Thu, Jul 16, 2026 at 11:01=E2=80=AFAM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Medium] The check for `find-debuginfo.sh` capabilities in `mkspec`=
 hardcodes host properties into `kernel.spec`, breaking SRPM portability ac=
ross distributions and failing silently when the tool is not in `$PATH`.
> > > --
> > >
> > > --- Patch [1]: [PATCH v2] kbuild: rpm-pkg: Preserve .BTF section in k=
ernel modules during debuginfo stripping ---
> > > commit 99202060a54c32638e01a2bfdc4d23b190f3f77c
> > > Author: Yafang Shao <laoar.shao@gmail.com>
> > >
> > > kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debug=
info stripping
> > >
> > > This commit updates the RPM packaging scripts to pass --keep-section =
.BTF
> > > to find-debuginfo.sh. This ensures that BTF information is preserved =
when
> > > debuginfo is stripped from kernel modules.
> > >
> > > > diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> > > > index c604f8c174e2c..00acef348ba84 100755
> > > > --- a/scripts/package/mkspec
> > > > +++ b/scripts/package/mkspec
> > > [ ... ]
> > > > @@ -65,6 +65,11 @@ fi
> > > >  echo "%define with_debuginfo_manual $with_debuginfo_manual"
> > > >  echo "%define with_debuginfo_rpm $with_debuginfo_rpm"
> > > >
> > > > +# Detect if find-debuginfo.sh supports --keep-section (RHEL 9+)
> > > > +if find-debuginfo.sh --help 2>&1 | grep -q keep-section; then
> > > > +     echo "%global with_keep_section 1"
> > > > +fi
> > >
> > > [Severity: Medium]
> > > Is it safe to assume find-debuginfo.sh is in the standard user $PATH?
> > >
> > > On many systems, this script resides in /usr/lib/rpm/, which isn't ty=
pically
> > > in the $PATH. This could cause the check to silently fail and strip t=
he .BTF
> > > section during a local make rpm-pkg build.
> > >
> > > Also, since mkspec runs during SRPM generation (make srcrpm-pkg), doe=
sn't
> > > this statically bake the generation host's capabilities into the resu=
lting
> > > kernel.spec file?
> > >
> > > If the SRPM is rebuilt on an older distribution, rpmbuild might fail =
because
> > > the older script rejects the --keep-section argument. If generated on=
 an
> > > older host and built on a newer one, BTF info would be silently strip=
ped.
> > > Could we dynamically query the target host's capabilities using somet=
hing
> > > like %(__find_debuginfo) inside the spec file itself?
> > >
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026071602534=
2.42628-1-laoar.shao@gmail.com?part=3D1
> >
> > I believe we could use the builtin _rpmconfigdir to locate
> > find-debuginfo.sh reliably. This avoids relying on $PATH.
> > What do you think about the following change?
>
> Just an FYI, this was not sent to anyone with authority to comment on
> said change, as the Kbuild folks were not included in the AI review
> thread. I just happened to find this when browsing the archives.

My apologies, I failed to notice that the linux-kbuild mailing list
was excluded from Sashiko's reply.

>
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index c732415662ef..4335e99f2aca 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
> > @@ -67,7 +67,21 @@ This package provides debug information for the
> > kernel image and modules from th
> >  %undefine _unique_debug_srcs
> >  %undefine _debugsource_packages
> >  %undefine _debuginfo_subpackages
> > +
> > +# Preserve .BTF section in kernel modules during debuginfo stripping
> > +# find-debuginfo.sh (from debugedit) uses eu-strip which removes
> > +# non-allocated ELF sections like .BTF by default.
> > +# --keep-section .BTF preserves BPF Type Format information.
> > +#
> > +# Uses _rpmconfigdir for reliable script location instead of relying o=
n $PATH.
> > +%{!?with_keep_section:%global __fd %{_rpmconfigdir}/find-debuginfo.sh}
> > +%{!?with_keep_section:%global with_keep_section %(%{__fd} --help 2>&1
> > | grep -c keep-section)}
> > +%if %{with_keep_section}
> > +%global _find_debuginfo_opts -r --keep-section .BTF
> > +%else
> >  %global _find_debuginfo_opts -r
> > +%endif
> > +
> >  %global _missing_build_ids_terminate_build 1
> >  %global _no_recompute_build_ids 1
> >  %{debug_package}
> >
> > Please let me know if this approach works or if there are any concerns.
>
> /usr/lib/rpm/find-debuginfo.sh might not exist on certain distributions
> that can build .rpm packages like Arch Linux:
>
>   $ ls -l /usr/lib/rpm/find-debuginfo.sh
>   "/usr/lib/rpm/find-debuginfo.sh": No such file or directory (os error 2=
)
>
> Even on modern Fedora, this is a symlink:
>
>   $ ls -l /usr/lib/rpm/find-debuginfo.sh
>   lrwxrwxrwx@ - root 19 Jul 17:00 /usr/lib/rpm/find-debuginfo.sh -> ../..=
/bin/find-debuginfo
>
> I think we would be better off just using the __find_debuginfo rpm
> macro:
>
>   $ rg -m 1 find-debuginfo /usr/lib/rpm/macros
>   69:%__find_debuginfo    /usr/bin/find-debuginfo
>
> This appears to work for me, it would be good if you can confirm this
> works for you as well.
>
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index c732415662ef..590b5b2e1b40 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -67,7 +67,18 @@ This package provides debug information for the kernel=
 image and modules from th
>  %undefine _unique_debug_srcs
>  %undefine _debugsource_packages
>  %undefine _debuginfo_subpackages
> +
> +# Preserve .BTF section in kernel modules during debuginfo stripping
> +# find-debuginfo.sh (from debugedit) uses eu-strip which removes
> +# non-allocated ELF sections like .BTF by default.
> +%global with_keep_section %(%{__find_debuginfo} --help 2>&1 | grep -c ke=
ep-section)
> +%if %{with_keep_section}
> +%global _find_debuginfo_opts -r --keep-section .BTF
> +%else
>  %global _find_debuginfo_opts -r
> +%endif
> +
>  %global _missing_build_ids_terminate_build 1
>  %global _no_recompute_build_ids 1
>  %{debug_package}

This works for me, thanks for the improvement.
Do you plan to send the official patch, or would you like me to send a
new version?

--=20
Regards
Yafang
