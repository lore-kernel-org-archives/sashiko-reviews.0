Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8963890F1
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936664; cv=pass; b=JXnjzPtO8UyvMFpDoFe0LANLAfXtwgI1QHT7Ehc4J6mnYBgeb+9WT7gVnwNABeKQLdtGn3Qj/radON0T0r8MMCboluYHpleUGJ8dVWopf4fTot80B3ICy239wGBNjfnsyaJPLBa0o5To7bx4/Qf3h1WTRa+uCNklb/bemIkHtF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936664; c=relaxed/simple;
	bh=DkZ8UvBLXj0gOCPzi7+z+Ima3FIV+FfCDV5b8VAleFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=olCawvnhi11xtgMIWdR0DdIg3SV651oE5euSZRXwQQuGquea2Tc0PY9ApOLM+jXP4yTA6wQh4yE+nKH9vUAK0m+/0OKVGrXbDJdYeIvpYhqOn5rUDb9eNyGz9IWMzquTFmUhkmrjwjsNV1OCV7mA+vVsXhobaVLqixvCx/3FHAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDBR065X; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDBR065X"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d049069377so14202925ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 10:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787936661; cv=none;
        d=google.com; s=arc-20260327;
        b=YwwebS84zBvRlAJWPJdR2gGOO9YDxNuxuBbxeX+ulnLd7XMbQAdnx7d2Z2iMaPvz8C
         tsccnrbsGw5ILGCltySavQkYWHSTll3IU+UaKKV49sW84fkeEeBbKlvVuqeFbGHQjkRZ
         VdZAEOIGie3RZu7SsZ7W3PX1W3W7rsBLncSKtyYwGSCb5P1e0FIV13or5TvsWy9i+QCR
         +ydpLKnHK3xXqka3MI7HV27Ta5hrGxV+o1Auz4T8p/jWXh5c9RCrK2SVpZKxDb6Zdqyx
         m4mcpZJHNKbQr7TpXaZOPfLvE1Gb/i5ays7yAiB2FEqQgi7Fsa58Lc+TmjH/1eHj0vUz
         Zxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5UAgkW9QmXrnKc8vndUabtY45X8IhcoVuUUPxykcjEo=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=SdmB9L+R2Mr529CI1ZPbD6ujLShii4LioZE6t3uMrlDuVCnoEqkfvCjMZwJP9jWP3d
         v3bWrVZrD7ZdICZoUIpJ/m4A4RtdHBMBdY4wytvB6Zud5rHzZ7a3ZVYxD1dGnY38dmMU
         mZZe3Bt58W+8ips4l9ZXIVoXM4zfE2OeyywRbqrcpSFAReqg3u3qE9JZBDehAOa4rLsw
         mDy1BQAwv58gqwTikeBnMbizuijiB2XQ2gPi1lsvhz8FsMVKW86WuUbrABlUhVTn56OA
         gjeBjJZIRA4JYwiePlDffFdEZFHfpyt8kJ6rKSZDhcOx8je/xufBP21MfwdWCf67xBWW
         p/FQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787936661; x=1788541461; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UAgkW9QmXrnKc8vndUabtY45X8IhcoVuUUPxykcjEo=;
        b=TDBR065XA3IYbKx64PUQn/5SMZqBjP1PudWTVwePA1JP6MW8o58+yEKw2/u/bAtCfe
         R9Mz4cghUXJ7us4+j+HY/SwN0PjPyxO0vpfOw41vX0DqWiKXAom10azkDnEVimHW5+/m
         A25o6/NTx08rNEph/IxmPmwdCqmAsmovZxUvN7AEqWcdvEaGCgn9YRrqLfSf2wRUz8bN
         gnMXxN0bzx1mlBFJaPAWpWwG9p3aNG5eZAcMgi/hiHlFO/sRcBbKm8DabKs9gCTra0KX
         4HG0i4lXDVA6et7OiT5Mpmy1YYLZjt2m2SmJ+VxtAunx5cfRj00NuXADXvfcAV7nkluL
         67sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936661; x=1788541461;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UAgkW9QmXrnKc8vndUabtY45X8IhcoVuUUPxykcjEo=;
        b=LqxqHYUl1tAXXVeA3O9NkqobN+R+ig6Tr0hC8hSYbo8DbpB4soKbhD6G8xGS9My9U5
         KJol98zLgy13z9bPpByTpxuRCiEo7A0hKAQ7UXo5ICN0AxEepo51HE7Vz6dCbObwKR/7
         HAmxuZDHvSlT049TjIyx1q1sHHCxNmJ2+sjuxvpGstoAAG0bJQwho5BYdwPmD3KlzP9T
         p0Be2eicyRr8w8zhbJkt78GVmbMzM+JJrZWQU7606LE7hCQsTroBQsB3619kqwyGN2oR
         NiwvsBB6tb31XtrgmhagD3ss2K5cl2mhzFY6hILhjPbtkncwNyl7U2yoAJw34U3z9Z5L
         xNbQ==
X-Gm-Message-State: AFuF++ldZI8XRdGcj9kOIbxLxU7IZmVUBFZc3cR8KiW59h43MAbVR5fL
	ef5pelGfyKV7+F3mXYc0TFD3c8qsxMxyxsYxUapcmwuCDC/uHawPO5QCNmJSBFTv2E3qaJkwcGd
	oV+fXq99AVIY1MU8ZIQwWJ7RLFszRPfzTyG2Rp/Q=
X-Gm-Gg: AYBFou1S765fEGOK6z6dkon/9OnI974Sv1wKdatgN1rvsqHkCbT2GshIFC9Ds/zbYV8
	JwO61TW1+7XwNsAKQh+b2lxLPry8YoGtSEcGGbmjGVCpi7N2t3cFVwCr9ykTug2bXQkrHt+MA89
	tPHjKfnNbgBIeMf2R7m7BoeXn+VmFwpMafA43D7+RXxdz3z1pY9GQgppT+kFgXZ1sLwtZk1XR5a
	qBe+G/P3BzoZrHGYDmw9v/BKtmk8y3o/7HwOJSpa1IzUXCUDpmS33q4CHqqImyndQLwbqtyzg3w
	UsLopn2jMqEjIxUHtjYivUGNolS3WLOI/snjZ2R9OE1O4Wg=
X-Received: by 2002:a17:902:ce81:b0:2d8:d4ce:9f33 with SMTP id
 d9443c01a7336-2d8d4cea3bdmr16840725ad.17.1787936660865; Fri, 28 Aug 2026
 10:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828161834.29539-1-mehmet.mkoseoglu@gmail.com> <20260828163250.EDA4E1F000E9@smtp.kernel.org>
In-Reply-To: <20260828163250.EDA4E1F000E9@smtp.kernel.org>
From: =?UTF-8?Q?Mehmet_Muhammet_K=C3=B6seo=C4=9Flu?= <mehmet.mkoseoglu@gmail.com>
Date: Fri, 28 Aug 2026 20:04:09 +0300
X-Gm-Features: AcwNN1UDWFJ09KpHLFfJJPmszyL5eJXnDExQ0S7qTSQfqrkdLEPlgOgjNJnPFtE
Message-ID: <CAAxBEE42XmC=e4o8Jsx1fNhxXp+fFp1iznHiEaQZGu2_953qTA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: cpufreq: reject NULL from cpufreq_cpu_get()
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The import-formatting finding from v1 is addressed in v2. The remaining
findings concern pre-existing PolicyCpu lifetime and aliasing behavior and
are outside the scope of this patch. They are being investigated separately=
.


<sashiko-bot@kernel.org> adresine sahip kullan=C4=B1c=C4=B1 28 A=C4=9Fu 202=
6 Cum,
19:32 tarihinde =C5=9Funu yazd=C4=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Concurrent callbacks create multiple exclusive mutable reference=
s (`&mut Policy`) to the same C `struct cpufreq_policy`, violating Rust's a=
liasing rules and causing Undefined Behavior.
> --
>
> commit 8885bf2914cf2fda0630183038e3d1bf9c762617
> Author: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
>
> rust: cpufreq: reject NULL from cpufreq_cpu_get()
>
> This commit addresses a null pointer dereference issue in the cpufreq
> abstraction. It modifies PolicyCpu::from_cpu() to correctly handle NULL
> returns from cpufreq_cpu_get() by explicitly rejecting them using
> NonNull::new() and returning ENODEV.
>
> > diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> > index affa2b9490efc..4b992ea9a0f01 100644
> > --- a/rust/kernel/cpufreq.rs
> > +++ b/rust/kernel/cpufreq.rs
> [ ... ]
> > @@ -687,12 +696,13 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Op=
tion<T> {
> >  impl<'a> PolicyCpu<'a> {
> >      fn from_cpu(cpu: CpuId) -> Result<Self> {
> >          // SAFETY: It is safe to call `cpufreq_cpu_get` for any valid =
CPU.
> > -        let ptr =3D from_err_ptr(unsafe { bindings::cpufreq_cpu_get(u3=
2::from(cpu)) })?;
> > +        let ptr =3D
> > +            NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32::from(=
cpu)) }).ok_or(ENODEV)?;
> >
> >          Ok(Self(
> >              // SAFETY: The `ptr` is guaranteed to be valid and remains=
 valid for the lifetime of
> >              // the returned reference.
> > -            unsafe { Policy::from_raw_mut(ptr) },
> > +            unsafe { Policy::from_raw_mut(ptr.as_ptr()) },
>
> [Severity: High]
> This is a pre-existing issue, but does creating a mutable reference `&mut
> Policy` from this pointer violate Rust's aliasing rules?
>
> Since `cpufreq_cpu_get()` only increments a kobject reference count witho=
ut
> acquiring an exclusive lock, concurrent accesses from userspace (such as
> reading sysfs nodes like `cpuinfo_cur_freq`) can execute `cpufreq_get()`
> concurrently.
>
> Since it only holds a read lock (`down_read(&policy->rwsem)`), this creat=
es
> multiple exclusive mutable references (`&mut Policy`) to the same underly=
ing
> C `struct cpufreq_policy` at the same time, triggering undefined behavior=
.
>
> This aliasing issue also seems to be present in other parts of the code t=
hat do
> not hold exclusive locks. For example, in `get_callback()`:
>
> rust/kernel/cpufreq.rs:get_callback() {
>     ...
>     unsafe extern "C" fn get_callback(cpu: c_uint) -> c_uint {
>         // SAFETY: The C API guarantees that `cpu` refers to a valid CPU
>         // number.
>         let cpu_id =3D unsafe { CpuId::from_u32_unchecked(cpu) };
>
>         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| {
>             T::get(&mut policy).unwrap_or(0)
>         })
>     }
>     ...
> }
>
> As well as in `update_limits_callback()`:
>
> rust/kernel/cpufreq.rs:update_limits_callback() {
>     ...
>     let policy =3D unsafe { Policy::from_raw_mut(ptr) };
>     ...
> }
>
> Could this shared access pattern miscompile due to the aliasing violation=
?
>
> >          ))
> >      }
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828161834.29=
539-1-mehmet.mkoseoglu@gmail.com?part=3D1
