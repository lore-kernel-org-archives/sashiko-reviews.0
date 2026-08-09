Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A636167F
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268745; cv=pass; b=j21KoriiohSnHQC2p3eugO4jjvEpyWDRUbBTOu0U37AHhjl3ZRrvqxChvZZUi3w0Anm2+fWQ4B8QUTJ1RvbYIWQe6WSzbYA+B9/A10dUJ5ESEwO6NzBwcyQWvsfTMklLGkMJ29C7QVBgt7kcWOKtM8YGfXodmyDivudXg136B/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268745; c=relaxed/simple;
	bh=5xSDC0oLtI68eWY5ijMf/yPYW7jiPMqykDc3qllVndM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCX7Vt7NAdJeiv0GMoukZwZlI6Wp1FjuhlIS48d2fpurGwRsYBYJkJFUuXxI/xjEHPsKk+RIJTMIMpMqsA8I4Q93jiSi49SLWtcYBou42GPIyPqPN5cPUecUW95sBioW1z3Gif1QU/7xGNvfWREVpudBsVwi7AbI2cbAPmf5Q3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT0EIVdJ; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT0EIVdJ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ecf499af9so12571297b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 02:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786268743; cv=none;
        d=google.com; s=arc-20260327;
        b=jPhEAWxM1sYBnmD1oJ3DRRSOOeF2Pn1SR5W6RYZCVLwRRyApmHlcKhfxze7VMaMESP
         JAFBYT5zViN8kM0YxnXQxVG9AR+en4cbqNaDBPHh9Ui9erRHvnn237njy89rtCTa0GM5
         Rzscd7xsrdaHHXr6TRjnZmyCPuby+jazY01ooTwFVn2RmdKZtK/q1n3xKppgHECJm5gR
         BeW1schGabqku8pIlLKxc4r3dj5Yi0Pk/ICdiEnQgZ1XvBlPOGSQgSFt6xty2CpnyGeU
         Xsnmspy3LJ9fWzItes+Uqp9igK+pml77QlRcjvTEdr1NRvsqA2hCSvU+Comr7YpBh9UG
         vC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBbxh2phVxoMYMLBkCkqrZYLjL0mF4xtsl2HTtRI7dA=;
        fh=vb/EcpGxSyPjZ2c88k0XkuyKH8IDmJrDwjAFEPCcuR4=;
        b=m3Eu8+d5rUZZv/fo7I+wo2/obdOYvNcTfcdCyc3Uga4s2GVQBMXd8Db6BECme4n1V3
         lmmb7a837ISlxzfxoK1I54s6vuPBqjOzNGbKlAxfgyoQZRMlExIovXIVnvBOwCCJiZyU
         SWLJ+LPy5fkpEtZ/vi061KNYWJQBX11DQYEDWz9pMIIG2W0QiUVc1udBwAVwb8+dQus3
         QtfgmRBpizC7qfud42afkNzUbx+y0uGcoFgRR5CHTwldpHboLY7LhuPuhFmyUidgOMAH
         NtVFX/PFTJrrDdGP1my6+mWFn+XRek21Htn/WzpGS6Tcg40DwvNedYllkQDOywEHfV5D
         NdHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786268743; x=1786873543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lBbxh2phVxoMYMLBkCkqrZYLjL0mF4xtsl2HTtRI7dA=;
        b=YT0EIVdJzNXDzkJh7zZcB1H/Ka+qJGZGA0DUChAJh3CmveohOJpnzar81zxawh/ZkX
         UfBz19Xi6LvbLtpRDHc9IcSRFuYyEdNTa/ruGKU3+YB/ficRZITfmc/vF2mxKYDrzVrG
         zoWVVX2kDBnI3gu4pLX0kiNxO1JcYg+9pE64y3x5mtvIvE6mPqAnOIcW92dQUWUCEn+C
         mOuOESz6wgo3jWYpkTE78d1eafJ6MoMUADV5qUBTRbJsVQ/l+7ypHcHjdAwld8kGheur
         ejrFpAEJ/8fJ5y6wwyi7Nop3r8KC6i375Fhn19db3gaxabfqp42J+2OzC/YR9BTeZM8q
         uKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786268743; x=1786873543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBbxh2phVxoMYMLBkCkqrZYLjL0mF4xtsl2HTtRI7dA=;
        b=Ikunx9SP7h+gOIeemZGJ9FKXFVB85D2h73TOcfEiPlkj37epGoED4VMXV4jHVQ0joZ
         8z/doH7lkK1o5TEmOm1mxbKCN2ZV/DyFN0WtdW9CpXa20ZH35T2OkP6sW+9eyUlysVSG
         83Q+bHhODSDAgyvvWThMUs+4QDevK8HOaYwo6B+hvIil0QNHh1AVsj6PkHwx4LdgB1U+
         6mh418KHF8S8PZWEyDF5EsjZT6gPkIN9SCwHdAi+BquYn+DftTgFYYaQvcYpu1kUfGbW
         rEJBlgG1v6IYjS6T7BAa/mM2zyDEnLha3CLZXvOq1EhEbG12uHROCLfIxjUnUacJFP2L
         shDg==
X-Gm-Message-State: AOJu0Yws0u3Mj769lydv/9SQdRNs3jVGa62duOhxF5CnF3h/2HVHVQ55
	8V/H4onG5ac/XD49azUuafUFRbQOB1KWcD7K4NZu21I0yL7wCp8NuTxgBfUkk2eyCpxmZARpLY2
	mQvQ+SN3xu0vBpfamwK4ZMYng621obJqVtx2OlF/4yg==
X-Gm-Gg: AR+sD11oFGcTZELiLRs9KXbcpXDHpwgCYNKVGAz2z4/EIR29I0spVkRAgszQn+K3wzE
	06QQuf6/551/fAFvxs+mk30p/ocw4XRsoD1m8xCjsCVcAHO+AG5xQhj4tiYejLgBXfsyGTQ8apG
	JP8WVEz/w0bv9NTb6y36r8th88yFWtQ4VPPaD/vVHWmX1sJGW3zKC6xuQXPSjlBoUS/eVPjxH0X
	N1/bWnDxbjWbpxQxskcvazOzThI/PO+asuI/rw0gSRke9uqr1ZV2LrK41Yi1qIaan79BnoobHxa
	2Jin8T4xKOTKDxDWI4mtC3omrCgmXRQXGtUju+EHzrCqs7o/jg94p4Q7xW3R+qCfoHNcfF5RdHn
	tLQ==
X-Received: by 2002:a05:690c:7247:b0:81e:4aa9:d025 with SMTP id
 00721157ae682-8201bc8540bmr220966037b3.6.1786268743301; Sun, 09 Aug 2026
 02:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-7-laoar.shao@gmail.com>
 <20260809093321.D25BB1F000E9@smtp.kernel.org>
In-Reply-To: <20260809093321.D25BB1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 9 Aug 2026 17:45:07 +0800
X-Gm-Features: AUfX_mz9q_u1iOlQ--x8wWTRrHUl6egTQn9VU3RYTDCYrZpWWIK2oIFcZD0WLdI
Message-ID: <CALOAHbBe=1W8pyWJ6evZFmeUeLevxgy39CecKHrpU2LifUK8EA@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] selftests: livepatch: Adapt atomic replace tests
 to provides/obsoletes
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, pmladek@suse.com, mbenes@suse.cz, song@kernel.org, 
	jikos@kernel.org, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The 'replace' feature detection in test_modules/Makefile fails=
 for out-of-tree (O=3D) kernel builds, breaking tests on older kernels.
> --
>
> --- Patch [6]: [PATCH v5 6/9] selftests: livepatch: Adapt atomic replace =
tests to provides/obsoletes ---
> commit e4d15e9f2792340ea543b405f9d074e729665c9b
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> selftests: livepatch: Adapt atomic replace tests to provides/obsoletes
>
> The legacy "replace" field in struct klp_patch was replaced by the
> provides/obsoletes mechanism. This commit adapts selftests to build and
> run on both old and new kernels by detecting the presence of the
> "replace" field.
>
> > diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/=
tools/testing/selftests/livepatch/test_modules/Makefile
> > index a13d398585dcb..29c55df360467 100644
> > --- a/tools/testing/selftests/livepatch/test_modules/Makefile
> > +++ b/tools/testing/selftests/livepatch/test_modules/Makefile
> > @@ -16,6 +16,16 @@ obj-m +=3D test_klp_atomic_replace.o \
> >       test_klp_state3.o \
> >       test_klp_syscall.o
> >
> > +# The legacy "replace" field was replaced by provides/obsoletes. When =
the
> > +# kernel (KDIR) still supports "replace", pass KLP_HAS_REPLACE to the
> > +# modules so that they can #ifdef the legacy "replace" code. Otherwise
> > +# the modules are built with the provides/obsoletes based code (to be
> > +# added later).
> > +KLP_HAS_REPLACE :=3D $(shell grep -q 'bool replace' $(KDIR)/include/li=
nux/livepatch.h 2>/dev/null && echo y)
>
> [Severity: Medium]
> Will this grep fail for out-of-tree (O=3D...) kernel builds?
>
> If $(KDIR) points to the build directory rather than the source directory=
,
> $(KDIR)/include/linux/livepatch.h might not exist.
>
> When tests are run, detect_replace_attr() will still correctly identify t=
he
> replace sysfs attribute on the running kernel and set HAS_REPLACE_ATTR=3D=
1.
>
> However, since the module would be compiled without KLP_HAS_REPLACE, it l=
acks
> the replace module parameter. When the test scripts attempt to load the m=
odule
> with replace=3D1, insmod will fail, causing the test suite to abort.

I believe this case is invalid. We always run `make run_tests` to
execute the full livepatch selftests, which ensures all kernel modules
are rebuilt against the running kernel.

--=20
Regards
Yafang
