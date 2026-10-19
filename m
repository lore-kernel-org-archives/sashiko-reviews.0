Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD644C4EB
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392970; cv=pass; b=PCt5yknfTeCias0PZi25uH9d75ifsgbNYj3R1q2S0SNpgcTM6PBiZuEReLSvp42phk4M8gAJ2ijwoaunLW+544JULTM89tQItF91S7uq+WTpyeR6iTvpDIfR7mlNRXvnsYOsqb8UCCLsJws5HSGLiwx5etmEd0PrZ4gQF2xBUDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392970; c=relaxed/simple;
	bh=X9zh+Cp4pC1VXTkySHPCj16XhQytW+vw6iww+Xpynhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkwJIjRx9jaR7UjbKmwkFhlKp+q4t7B6CXHKUw4eysfccK5/c6/bveltNgg30yi5cs5UyFE8oCclcyBCGexaeGRrZe4esrkkuoFUaNRLyuXn/N2852WpMNohihIcXGlUVu0risyVuk96cxcry4pSw42zS7yk7EJoFsrNzYkj0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7bNVLln; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7bNVLln"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66fca0709caso1264801d50.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 23:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792392968; cv=none;
        d=google.com; s=arc-20260327;
        b=ED4OO+L4kgH7eQLS4hwIHQJiryClOrAjDgHVAnTZLHZvINFsHRR81PkZkliSs9PSRF
         DloEJdaePj4JycCjv/C3tTrZgyWCJRSZtRQCNCF1QR1ANVJXfX4L4tvc0eE/fk8r/5Ys
         NOLypG+TvIy+lB74RoQhtxf/gUe7q6SQ5hG757pvXRb+4r+w0CillH/k0g5F0rB4dQ4k
         narn93wUvGyMzgjd99q2ZfjXBzmu/gOvssELn2e87MQfUkEcKQGOzgV9ykXFn8lqu02g
         qkbR7bDY4oa98uSr0YeE5b/WfQJ03ZrZ7nb4XjvsDWdByF+k6ind0kqGw6J2aIZOAgI5
         tvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vaaaBizOm7JbDRKbdirZXLgkf0levtE0Ftrfaqs1NqU=;
        fh=risCXqddoJ4OMyEDiuoDYKl7eVWeTYRF0lZTs6+72Q8=;
        b=DVXVpjBROo5D9+kgia7cIdwuzwN97MkaD5jDMz7NJOctXhoBcCEeqIBXh0ynChuv9p
         hi7sjoS1XyxC4vkzqNX8B/kRsjyuvKJZNl+mIsz7J7wTHtP384uK8oEZvZE3ZFsTBSsi
         VHXAIARNSpa+rV7Fj4LLW/egGio07czZdHeeIzlx52Povdt1K3gVRBYHjeaMj0cvn7RV
         +mX6jqEWA7a/cxRtm7xOYsc/XmpT8D7aXKDKi52kYhH7RR5MiDrP4MlgdTNBNcRMZmo/
         xPQdvNqKDGnQ9k/E0NEpwHVEXegVO5Ca1p+1GgG2M5lgTjBtvk+KAKNirAKZW1aQQ7Et
         KKww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392968; x=1792997768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaaaBizOm7JbDRKbdirZXLgkf0levtE0Ftrfaqs1NqU=;
        b=E7bNVLlnBK1ZmdeL0DIEAk/4GrHrKZs/KR4VpqRPzzrXCx+y+rw6O+yzBKhGRJbsHu
         ywTo0pGTx7+NXRnVN6uTBSQT+eD9XS40iKSEfv01gZYL3qKWsMEocbAMhxIG0omQkC0I
         mpT8WGahFOuYTucvj4kbksivti1an3F89pz7VOsKnHfCiHHuW4jMSNmM2leVflrzuSG5
         OH50DHiZopzun24Bom/G8Vcw9RmrteTTLqRYqb8a5MD2FHd4Gkpi1395oG19srbq8Rbb
         JEkehb6Dv478RI0947GqEhEviaod3eCKi0nxtnBvQ11aHMyY+x04OLRZJ3X6U4PEdcUy
         UgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392968; x=1792997768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaaaBizOm7JbDRKbdirZXLgkf0levtE0Ftrfaqs1NqU=;
        b=nlYAO1hIL/3xCwYok8cD1LKNTMq95kV0kqiYDPNZ93/313b99bSJSSLUrt62gZlbR4
         KiNXnvC4qBfa8gRz+DU3fPZVdQgwJ0OiqKtayUcrQnz5HzhvzBi8Abc4ksaetVNiWHFD
         3MDzKQputVu7G9ExiEjp3vOucjA5k7Rt6Na/OG/cVNgiNOv+hFwdkEziFGPMlHY7d0PR
         s1vv02GWf/yXpuFRCN3IxoDVPJ/DK2LHQbSVhrYq1QiRJ3qANPMYfe7XVYpSc9TR9LZ9
         fblG0xfAaonuIegnhIzlX82bPp+zjSGSyf43Gxaow1TlzCtzbeUwRdeURz9OYOXDvpbN
         eEWg==
X-Gm-Message-State: AFq9FYKFi19eF+WKZ/iT9emNkobvI1s5NhE8RAK2LyibaL4eyXcQ6gJE
	9ew2TEofrLARWUsredRuLqo0YTN97mXmUBFbPurzZ27I+Ncu8L6q0Pf5OT3VHp88CAwUpNnDp9e
	kVfLT3/iucbBpICdOqOAxCIZ6JZruniELCD+qRF0=
X-Gm-Gg: AYBFou0gJoekb4ybhUgRKCj8VjY8zOYiiciM+nJ2/hNcFSjEIblipWA63xrC2Ip47li
	55VJxcO7I9sKTcccFGI6UUytPsR/9gJW8FUuljHGp9wuGlSjZ6Dt1GEQh1ETKnF+/h6/4ESLUXY
	jLyMlnQhgMS/X1rnajldXj0pG6ku8hhWvrjJA9TrW4EgHDOEgSn2hGeySqucb+pvDFuy6yk+4zS
	eltvPnvrlTnU7Bz2s8tuY4E0WweQjU0pFaWhgCFeCsQr2eoZUIMErFRoH3VuEMcaaBxxAqdJTqw
	OKmwulx5VlOyMAK4ugU8EWcKF+32jG4DyMvuAvn2K+N+09j4dEHUlxuxPaG/H96Ltn7vS7XrTAC
	vGhWJroYMUA==
X-Received: by 2002:a05:690e:484d:b0:675:5e46:36cc with SMTP id
 956f58d0204a3-679ca8a6938mr1328984d50.82.1792392967945; Sun, 18 Oct 2026
 23:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261019064157.29885-1-laoar.shao@gmail.com> <20261019064157.29885-6-laoar.shao@gmail.com>
 <sashiko-outbox-176703@kernel.org>
In-Reply-To: <sashiko-outbox-176703@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 19 Oct 2026 14:55:30 +0800
X-Gm-Features: AclHuK-4hRkGnv4LQq98lJIVV6E1PZLgk66c_H-_i08if73Xzq6nap7W0MhfklY
Message-ID: <CALOAHbBHcswzurP5vRqOzsKiZP6N-6J7ACnB_M2tZ1avN2NsJg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 bpf-next 5/5] selftests/bpf: add tests for the
 numab kfuncs
To: sashiko-reviews@lists.linux.dev
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, gourry@gourry.net, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev, 
	yu.c.chen@intel.com, zhao1.liu@intel.com, tim.c.chen@linux.intel.com, 
	lizhe.67@bytedance.com, bpf@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] selftests/bpf: missing kfunc BTF skip check in test_bpf_numab(=
)
> --
>
> commit 07e4c14213f29b11a7ce19b88e46e524dc48e78d
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> selftests/bpf: add tests for the numab kfuncs
>
> This commit adds BPF selftests exercising the bpf_numab_set_mode() and
> bpf_numab_get_mode() kfuncs across set/get roundtrips, mode validation,
> invalid cgroup IDs, and cgroup hierarchy combinations.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_numab.c b/tools=
/testing/selftests/bpf/prog_tests/bpf_numab.c
> > new file mode 100644
> > index 0000000000000..7ce4b8153c42f
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/bpf_numab.c
> > @@ -0,0 +1,227 @@
> [ ... ]
> > +static void test_set_get(void)
> > +{
> > +     struct bpf_numab *skel;
> > +     int cgroup_fd;
> > +     u64 cgid;
> > +
> > +     cgroup_fd =3D test__join_cgroup(CGROUP_PATH);
> > +     if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
> > +             return;
> > +
> > +     skel =3D bpf_numab__open_and_load();
> > +     if (!ASSERT_OK_PTR(skel, "open_and_load"))
> > +             goto cleanup;
> [ ... ]
> > +void test_bpf_numab(void)
> > +{
> > +     if (test__start_subtest("set_get"))
> > +             test_set_get();
> > +     if (test__start_subtest("invalid_mode"))
> > +             test_invalid_mode();
> > +     if (test__start_subtest("bad_cgid"))
> > +             test_bad_cgid();
> > +     if (test__start_subtest("hierarchy"))
> > +             test_hierarchy();
> > +}
>
> [Severity: Medium]
> What happens when test_bpf_numab() runs on a kernel built without
> CONFIG_BPF_NUMAB=3Dy (for example when CONFIG_NUMA_BALANCING is disabled =
or on
> non-x86_64 selftest configs where CONFIG_NUMA_BALANCING is not enabled)?

Nice catch.
will add the configs to tools/testing/selftests/bpf/config.

>
> Because tools/testing/selftests/bpf/progs/bpf_numab.c declares
> bpf_numab_set_mode and bpf_numab_get_mode as strong __ksym externs:
>
>     extern int bpf_numab_set_mode(u64 cgid, s64 mode) __ksym;
>     extern s64 bpf_numab_get_mode(u64 cgid) __ksym;
>
> calling test_bpf_numab() -> test_set_get() -> bpf_numab__open_and_load()
> (as well as test_invalid_mode(), test_bad_cgid(), and test_hierarchy())
> fails in bpf_object__resolve_ksym_func_btf_id() with -ESRCH and trips
> ASSERT_OK_PTR(skel, "open_and_load").
>
> Should test_bpf_numab() check vmlinux BTF for bpf_numab_set_mode and
> bpf_numab_get_mode via btf__find_by_name_kind(..., BTF_KIND_FUNC) and cal=
l
> test__skip() when the kfuncs are not present?
>
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_numab.c b/tools/test=
ing/selftests/bpf/progs/bpf_numab.c
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019064157.29=
885-1-laoar.shao@gmail.com?part=3D5



--=20
Regards
Yafang
