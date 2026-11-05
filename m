Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918025;
	b=rQG93x477IzQKXkWdqHKEyTZMQ2XclTKmMplLbVWZ0pwfgDI3y+HbSK2YfDQDA649Go4
	 PC6CQ5I6hT3gQZLUxKWpd3JQMoQYtAPNfR5aoxdhxhyZelGImznmWc1RSdV6Wdk8A0C+J
	 t8b91HHHAhj9Ra6iQDIDUls9Tw5WjnFJ2TdegZhUAxqTNqeITwUB40P118uijClgGPE18
	 Pnj2eSFF/OAdSmQ8bNSfaW9C/r4360/MLmpjOkLnnIWI6KkB0bSP+fACq7Z2aegM/9L2W
	 RJEAcZrSgj7dbcr0bhKo30ml8cfvYWw9epdRb5eRRzoOtSoQ+7XHgzu+JiGUxUApy8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=31ZSEIgnSRblqiUyaAfYn9e+uXgsnPwJ063UmUgD6Oc=;
	b=TdB2/ti+YBR4QkfAsEA6Rwsbvc3KsCLlFhldE/EXApqFMvqEhNWh30ej+yl7+xUlvyAp
	 AS1h7zGkOb9tQ9Or669r5lhkPg++8B+IeJ5kOk2xQnUd9O3M5TArQhNTjrD1/EnmVayKH
	 8qnAfjj2EkUurDfQTL/WIYw6sa3bUHiLq79azpuZ5wLF3JN/FC30nQyOJBPsj6smf6w1b
	 SvnKjwwaGfI0ODz2vzdkdD+fK2kIZiKPP3gy4s70K0y4mzHvafW1TFGsddeKcbDrk/FVZ
	 zVfSYeoQVt30HeNsZuS0pqYgUT4QtemtfEd/SMLglEAojeijmRxHnCWEJ0+HS4Ox2oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3PJbX2p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CE606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 22:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3PJbX2p
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed2b4348fcso36715ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 14:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918024; cv=none;
        d=google.com; s=arc-20260327;
        b=RWeHBVD3MGHKbsGxheTwHZ+iwxG0mjZvBe1dEXjoz31f5F0JoJQOjE6A6KalxlmMkc
         6DvgI2Udapfi9pBlxT01ANxQ997KUPd6SydpPb3UaGdp26t1gQlEUQ5aHZNxCxPy1HDF
         8n0zy4shgARN+ZzooSZ0PqUWyUDkjrEpoQi3WaEVrbawOFQOMWgiOpKTraWAZex9bD2Q
         jjvHXeOmWyUPxX/ugNX/HNKVBPMXZxP7jRS27B+LulTZXODoa0CZriCPFyIw5AFCIXu1
         Xd7TCKwCWh2nJwrG6L62l15+9ORQqExf4g3tKDpkdlFL3h+jbc/g4j7zBag+APrwMUhA
         q/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31ZSEIgnSRblqiUyaAfYn9e+uXgsnPwJ063UmUgD6Oc=;
        fh=9wxEkLLN3+N19wQ9EYZK499xwHCSPJPhVvshs1FOUi4=;
        b=NhPrWCYOJCRBqc4juh52sjWnrThWghwOD7J7nR6PLfJjnR/sBGUucJxdZTqJF+1Q8y
         t3VPIEiSfT8jIyVh3QH0QvhXA7xJ7wEruVY5piyphgV3gGt9yyeE9Kfpx9NM/oZ5YjGA
         bI5QJmYzU1HJ4I9c8FVQjQL5eLM1ro0RcMlcxhW89vPMIsm2FjEMng42QU5CDjZAt+LL
         NMEE0vaYW81ukxhcoSRwPvzWDliSBK4BfJ+eNUGK49OjX+c4ywVmuz19qHV4KPxOeaik
         o5xr7TD/inaxmep6B67YOaHDP9Lx90ZnYPyJnJceI+P8lU53C4yT//b1ZR1orL2OvGVI
         gXtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793918024; x=1794522824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31ZSEIgnSRblqiUyaAfYn9e+uXgsnPwJ063UmUgD6Oc=;
        b=Y3PJbX2pY2fv0l6Cslr0+BJO218aFC4TLBNYJu+gVFVEPfeFMSDBK7y1Q0TVE809n5
         EQp8tpTNRUtla0h2eTVgo+aiW5fB9CCLtm0+JgI1Oj/9MGC8unRH/Y3/N7U4/kG7bMLf
         d0f1M0TSP7ppW1R5BPiPE2cWDxwGEKBzqX5J6iGmyiP01ZB7ReQHxUmimGrgOmnjdMvD
         vtUK3ODfmysuNbqT98FZ6Vs7siysxXCcE1Bj1lkg376zG5lBiB/7vqw5zgZUS0nBE4YP
         aCYP6l6UP9CGfoJZy9xTmD/j8tUhNpF43gD6IvPi6F6qgaymlcwqDlWKihTGjjwEnWW5
         jazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918024; x=1794522824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31ZSEIgnSRblqiUyaAfYn9e+uXgsnPwJ063UmUgD6Oc=;
        b=Yv7NKEeUen7eIDGVfJ8oyWOF0AWubRlWRrjaxSMcOr6Rf3bnj3uxnJiUujosFAiEZv
         ZLmdEKmpIOClg9a2oA/6BG4szrupDQrmJ2Ftv4i8SZ9sEia8QpVFAvlzv2kjsf65rdIt
         6aWl+6ODDLtCaRhsg9S4LN5SE18MuhJV700ofKhJl6zsIdOv7uMtwWVXaVX33pMOXjTg
         SK5MjBAWDsTUdgZdHQCrFRrgFtkp3n6IztnugNHf8AQM4ae5iI4VFdbO9PgKded3jt6q
         1XuZKo9bbUBUJsYMPqMDcUqg2Ogd4lwO9aSgmo2qLIjpvE4gH2Gb3Jq9Gi3ODwSwSuFY
         QQow==
X-Gm-Message-State: APuU4Z+r92YFQwuvkh9KkUYlxGiqqg4sBdRIfoWD6WIyf8mvzzdHNLyU
	jIq/pxWlV2SY75CQMe/i9uGWw0ubF04MMThWLJORqILEWg508SrCk+AKypYPiFnfQWe+RGUZwYd
	bWHUxIs3Owk360g/W8sEWbEybWWAelVcuFS1jUmQ=
X-Gm-Gg: AYBFou0lpEPSu61UH0qlI3HC7g1Y/LSr5NPLj8DEnpjWqY7Qfx3KU6ufsUUpU7Gbivi
	Jl5p1K4hw7SneALddkw6OgKwgoQz9zqHHK3L10uL5LQLTHrwLLYkyF/m9WNqwEZlTEfZtZ1NXjY
	De8Rdy385pb2OyvdXjedD/cLEzhbjb4L2EF7teaMSEpxk9lTqQ2kbtdKPMBET1WskndzOEOFVgp
	nP7BzYzj03l+kZ5JIMzfng9Cwofs5aveVcL8UD7XK4wUxwNGWHGsHZrpn5I7fjyUv3zczHdOu6f
	ph2Nb2FnOs6RBmeaET6mP1aSfONS3msiNPTO18+XwIWZuMV3E0sESnPUyo0HCiu+hM5/jp6vUSV
	zqoe3oLK4BrTlSQsl+X9VUeDT7LoxMmEnoYWwVPg5Yz3upehf9UCpUaKtBNAxV1yygwl0S0A2uX
	p0wHHrWlycIRakKp6/0ixhKbaLNIdVlrgG/w==
X-Received: by 2002:a17:902:d2cd:b0:2ed:205e:eac3 with SMTP id
 d9443c01a7336-2ed40ad43d6mr11276705ad.12.1793918023548; Thu, 05 Nov 2026
 14:33:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-d-path-memfd-v1-1-692a5664b36d@gmail.com> <sashiko-outbox-192887@kernel.org>
In-Reply-To: <sashiko-outbox-192887@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:33:31 -0800
X-Gm-Features: AclHuK_44Icv5iKrVAgcoF-RzALW9SohVIN3sRDCgSubWdDt28UmDb25q-uzOXw
Message-ID: <CAEf4BzaJcmCbTA75Fh6OUkduAui0VCwuWjvykCpe00ivmKWXzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Use memfd_create instead of
 mkstemp in d_path
To: sashiko-reviews@lists.linux.dev
Cc: Jonathan Bastari Thamrin <thamrinjonathan@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] selftests/bpf: deprecated CHECK() used in test_d_path_mem_access(=
)
> --
>
> commit 70ec4540d31dab1fed0411808b9f6ef87d380925
> Author: Jonathan Bastari Thamrin <thamrinjonathan@gmail.com>
>
> selftests/bpf: Use memfd_create instead of mkstemp in d_path
>
> This commit replaces mkstemp() in /dev/shm with memfd_create() in
> test_d_path_mem_access() so the check_mem_access subtest can run under
> vmtest.sh when /dev/shm is not mounted.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/d_path.c b/tools/te=
sting/selftests/bpf/prog_tests/d_path.c
> > index 1a2a2f1abf033..0f0150d73262b 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/d_path.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/d_path.c
>
> [ ... ]
>
> > @@ -230,13 +230,12 @@ static void test_d_path_mem_access(void)
> >
> >       bss =3D skel->bss;
> >
> > -     localfd =3D mkstemp(path_template);
> > -     if (CHECK(localfd < 0, "trigger", "mkstemp failed\n"))
> > +     localfd =3D memfd_create("d_path_loadgen", 0);
> > +     if (CHECK(localfd < 0, "trigger", "memfd_create failed\n"))
> >               goto cleanup;
>
> [Severity: Low]
> This isn't a bug, but since CHECK() is deprecated in BPF selftests, shoul=
d
> this updated check in test_d_path_mem_access() use ASSERT_OK_FD() from
> tools/testing/selftests/bpf/test_progs.h instead (similar to commit
> 47687a29b2c3 ("selftests/bpf: Use memfd_create instead of shm_open in
> cgroup_iter_memcg"))?
>
>         if (!ASSERT_OK_FD(localfd, "memfd_create"))

yes, let's please switch away from CHECK please

pw-bot: cr

>                 goto cleanup;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-d-path-m=
emfd-v1-1-692a5664b36d@gmail.com?part=3D1
>
