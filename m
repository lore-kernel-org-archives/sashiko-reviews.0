Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932984BD375
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892972; cv=pass; b=XF7rhl164BtgnArAXExpcrnfWQWNszaIdIewyv4SV2FT6uCSM5LasKVQWI5Resdm9e3CxiVqL/lH7s+mDOhQXUEsDpqa1S22VbImHMdm8G7y40zeVgdd3aPrBjnoRddIp0tlcDRljCpDiAeWRFfi1KccVeNI6OQur5AjiJSdnps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892972; c=relaxed/simple;
	bh=Kg2RBXpFtT5mFhV9J7d4HKN6JQoqJIJ64uHnfF1xOZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7DigQL1+oBnIcgdZzxZ1ChHilpjPf/fQH6khvNgoszQpESnElH93VCDBDCertAEnf5qzmMlmCvd3WYWVrzXNk0kEEDbGCmWbZRACw1TuYKG/3yZ9GiadKCbSVAg1b0ysSJNUUnBuoyc/FxtgIAeyJbwNJJr8XTvfyO8Xqn8Cw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5DWuEGa; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5DWuEGa"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6762de1c77eso2483609d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 15:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790892966; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9bDpV6wnVCYPC763nLLVHa5mb5VYxsxaglk6HZax/m3ei1lu0F/PR6nN7WKJ5SbRF
         S3Bfr9itk9OYAFgoCob2YWXc9Vh8j7D6QUU4czgHTJKTrG2aBx47X4M7awmNRRV3Lleh
         fG1n32smxQsSG4LTRAslCNNJar4zfNAc7xa9vQybtwEAoc+bpe1bgK+hI0yneNZ7FZLw
         Mq63Fb0qUrP2/p+mEsYjdgZKVpol9oOBzLiQJF1Wt9mgwYSWNgfNdxlbhGNfJ+xBvto4
         bXVGid6FQBnYz6of1IPWzB1yuZdC3g8XrOEcdJJUxRHmVOD9SZmI8YfsZLgqtXBFnqC+
         eKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fFp9K5kNxLern9IX4I7rgGeq/2vHkCE/7tXvywJUIjY=;
        fh=kAGRFKDN7aRGd6VO33HQbsOy3CoTfL4nr4GTMsDqfhg=;
        b=hLKD9xOpP1Vmju79+LXyvsUXgzPYNYx09qLbCCO/lQ48fExpyY4LY2bUzK3U9snZ4/
         1Bhdsd/jXzAndLw3IrD03eXLQWidF0NqWKH6WJCTjkxPUEQpofbXgmw1W0FIta3z/7JL
         tmZA9pgrwQQjJfLV98TYHqFpG1+h/mmqSAZ/b5OlGP4qQ/RScvPjLhXwEcfq63KTiioa
         4k/0AKQCEsFJIbf/hs+b/TrSNe8YVHaD0CH9gi3ENz9ibp4DJ4KbUlnevwdVbEl7W9SQ
         dekf8tfZJ16M+6xMMOFt7UhMt/+SUPJc1qQQJ+G0hKukg/IKhVk5MO+hmhZsr/hBtiBt
         Rnvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790892966; x=1791497766; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFp9K5kNxLern9IX4I7rgGeq/2vHkCE/7tXvywJUIjY=;
        b=K5DWuEGaaJ4qwAEheesHf5kCti0jKo3gllN8tf2R/fXmazrUen1/uis6a6RQOl3epW
         JznwzDyFk5A4A4ATYMB3x0hC8Z+NLe/aiRKXMNxb7zpkPoboDDI8B2L9oscDc0fdMTPU
         mKs47wy3WC3cZmvjLcc4NFECUmL+rUzVUKp8zn4npRK+V/tFReuC8Zry96yIznn8rr4+
         8dzbJMOKbMRcMYYXP781zGOooUDx2ZE8ZK5LJjBMtttOhtVnQync4W8UuDmIf/8sQSAY
         u3ykXQnbczCM50RCo/TYgtlsbcoQ21l2ziiJy8D+KPizMo4DQAiji32oAiEZzV9JCHmf
         7rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892966; x=1791497766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFp9K5kNxLern9IX4I7rgGeq/2vHkCE/7tXvywJUIjY=;
        b=H+G/tKBBgsibddJ+Kn2p4ewRMBw1DzaRRC9apDDiSdnkm4Lmv8gMqE4KU5UP44UipG
         wFwjxLTR8TBxjSWdWtFZVU21n5ZkMR3EGfxJZc1TQqRQSyM+x4CBzEvzLL8uOtsWcWED
         fM8u6yisX2sTFtZzkUdYWFafIKWSpGh1Y5ZgXevsYfqaGyxrkgZQUzpTxN4hLfmsWQoi
         aUJ5hOVyakRWMVEkHRj1u7MD4jIURFcYUA8ZA0RShDd+0TfB19VR/QUNUFqUDdtEX/Pr
         vzm73iSz45tkgnhoxRokEcl+jhC6ELzfDPYzsOkk9DROn5mSCaYfqiSTChMIPexOAdBW
         KdpQ==
X-Gm-Message-State: AFq9FYKt033UgiTaax7HD78tn1t39sZtwfoLgTubC7D3+BEa3CZlYzUI
	T/knd2dNsqgmbGsunioQ8lRtujAJvUP72yqJIq2h9RBe32q3YigVhQaaLEpQsjM1o+xS0uy0tVM
	nTWpUgfXm0XSf4TcLYdhUvm8Yfl1QF8vv7A==
X-Gm-Gg: AYBFou2z7dO6l3bDCU5PRSmIR/pDRRaeb8Z5aB6/sPi+QE9h9kaVu5MdFptrcU+9tA/
	DN4aj6lVH3NUH9o1WTbxa0amDYyL/qfXa24qgTQT6f/DqfDxxXKnjuMpeqMHHwpUru4phvyY5Q/
	kO1kbQcJIe6ePFfa/3+Mhjx6lSQ04uX3d/Hd4WZ8Fm0xdvmdoiVHE5XoH/rJU+4XTaDms/VEaHH
	p/0NQ0fPcdkq99xCzMAdHfxDe3zCO9Rq31FnntKX6MwgcMI9vcfDlGjavPiGXrjiYTLsLz6JHAV
	bDirl8jbACvYyRvtb3v6ye6kWzbJTi7kWx4MlOpieL4mQLqgmb+7xn0dwfNw6ck3unoSXO1FcZW
	OOibgXUfbL1tQ52jwdlzZu54KoeOLnn8aRw==
X-Received: by 2002:a05:690e:4885:20b0:674:f33:3a38 with SMTP id
 956f58d0204a3-677ac148763mr250188d50.125.1790892965727; Thu, 01 Oct 2026
 15:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
 <20260923-dd-cmap-part2-clean-v11-14-9b6c217fdf2f@gmail.com> <20260923224509.4DE3F1F000FF@smtp.kernel.org>
In-Reply-To: <20260923224509.4DE3F1F000FF@smtp.kernel.org>
From: jim.cromie@gmail.com
Date: Thu, 1 Oct 2026 16:15:39 -0600
X-Gm-Features: AclHuK-GHAcqAEG9-PO9HaBTq4Efz44Tmpp9mn4Tt1hmvZxExK0du5Qqqyez3YY
Message-ID: <CAJfuBxzvL1ATWv96GeEgUHY0m3G-sm0=0KRSOqVjaXQ7e61spg@mail.gmail.com>
Subject: Re: [PATCH v11 14/38] dyndbg: Bind callsites and classmaps to DDEBUG_MODNAME
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dyndbg: classmaps for loadable modules are dropped if DDEBUG_M=
ODNAME is overridden
> --
>
> commit 5e35c3cb693ea4379aa99e08e89d78671956f5c5
> Author: Jim Cromie <jim.cromie@gmail.com>
>
> dyndbg: Bind callsites and classmaps to DDEBUG_MODNAME
>
> Currently, dyndbg binds KBUILD_MODNAME directly into callsite and
> classmap declarator macros.
>
> For built-ins, KBUILD_MODNAME defaults to the basename of the source
> file. For many subsystems, this fragments what should be a single
> module into separate file basenames: kernel/power/ produces "main",
> "suspend", "hibernate", "snapshot", and "swap" when all should be
> "power". Conversely, multiple unrelated built-in files across the tree
> (init/main.c, kernel/power/main.c) all collide under "main".
>
> [ ... ]
>
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index baf5c0853f459..85863e24ad134 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> [ ... ]
> > @@ -121,7 +129,7 @@ struct ddebug_class_param {
> >       static struct ddebug_class_map __aligned(8) __used              \
> >               __section("__dyndbg_classes") _var =3D {                 =
 \
> >               .mod =3D THIS_MODULE,                                    =
 \
> > -             .mod_name =3D KBUILD_MODNAME,                            =
 \
> > +             .mod_name =3D DDEBUG_MODNAME,                            =
 \
> >               .base =3D _base,                                         =
 \
> >               .map_type =3D _maptype,                                  =
 \
> >               .class_names =3D _var##_classnames,                      =
 \
>
> [Severity: Medium]
> Will this drop classmaps for loadable modules if a maintainer overrides
> DDEBUG_MODNAME?
>
> When a loadable module is loaded, ddebug_module_notify() calls
> ddebug_add_module() using the module's actual load name (mod->name) to
> initialize the ddebug_table's module name.
>
> During initialization, ddebug_attach_module_classes() attempts to match t=
he
> classmap to the module by comparing strings:
>
> lib/dynamic_debug.c:ddebug_attach_module_classes() {
>     ...
>     if (!strcmp(cm->mod_name, dt->mod_name)) {
>     ...
> }
>
> If a maintainer uses the opt-in hook (e.g., ccflags-y +=3D -DDDEBUG_MODNA=
ME=3D'"power"')
> on a loadable module whose load name is "suspend", cm->mod_name will be "=
power"
> while dt->mod_name is "suspend".
>
> Since the string comparison fails, will all classmaps for the loadable mo=
dule
> be silently dropped, causing class'd pr_debug calls to lose their functio=
nality
> and trigger pr_warn spam on load due to unknown class IDs?
>

I have dropped the DDEBUG_MODNAME indirection,
am keeping the existing KBUILD_MODNAME.

While it has the effect of breaking up what might be considered a single mo=
dule,
like "power", into ~6 separate ones, with names like "core" and "main",
we can debate that separately, perhaps as an RFC,
since it touches so many builtin module names.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-dd-cmap-=
part2-clean-v11-0-9b6c217fdf2f@gmail.com?part=3D14
