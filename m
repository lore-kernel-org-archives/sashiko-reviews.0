Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976793DE450
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794546; cv=none; b=r3nzbv6XQpiolLx12Au7nypQvyjaJgAFH57935D6iPjH2+xpcZEFObHoGJbrkNOMfE03O5ZLrmDMYWgi4XG/nxk1hfCn8XlJmZzVXwdIhEUuiiXD1Oh9Ae9MhbV5WOYkasntKdxyy2rkN8JMslA8OrdSJJNyl3g1FeeIl05P0MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794546; c=relaxed/simple;
	bh=EVKVIefgDC/PBqL6YGHoR67wmzrgbiJyMXmA/9DVfZE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DK7haO1s+p0VdFplCBKwV+Rw53iEKDcy4H88pK6hVFKPRtHWMz0qE85L5sP9//ule+SQpsi4zBraVPTFyorcoa8OsLFPmdY6eb0KlMIJ9a/RvqEA6d+Mc5FfrRPyDCZJxcVdbD0pE78DW3DFRZ4j6Cdit/Y5UxLi81GoiTYm+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAHxVHXF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAHxVHXF"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-369576666d5so4970086a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779794545; x=1780399345; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EVKVIefgDC/PBqL6YGHoR67wmzrgbiJyMXmA/9DVfZE=;
        b=AAHxVHXFhHcGtl+7fS8/dzDTs+GAqj+Lgf2lOuTjee6LevXRq/m4jS2FtSiZyzYHzZ
         CI2Irbiz0RpOhhLgpbujeDDRuMO/GM7lU5jzPaDr3xuIvyrCy0gsrqP4fB4JRq9eh7vV
         leL5tw0PpDJygz9drYfP4I+UQ/huNRbpvSsjjIKbuc31eHQC2oURXBFBcWlDMCQkJhO4
         Y6+/6VZIgDLkYmG1fpESKSc+BKTs0vkzyP4XxYkDrVLwIujXxpx7ISc8Cb+gItbx+eCk
         qwnbDtC2oeEmlTR/mb6dpCOb4tBhkj/R5WBEPSqL9juNOpWDO9Jg+/1JUDs32M000o0q
         3TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794545; x=1780399345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVKVIefgDC/PBqL6YGHoR67wmzrgbiJyMXmA/9DVfZE=;
        b=TNDqm6D0EgwxaXnaZ7iVlOyviykbPhbhboPge617D31c4aTDV8iI2DTg4Vvg/cJMLn
         Xrlk61iaP166CTJ/LxeWw0a8AeXCluK+DUkYlH/HhEpb8/mEjarUj2vx1LNMN/HOSPka
         9Re6ngpM6i4lFMjQm+Vz2/JzlY9dnfpVeABgQaWjiH/PyOPqVXuH3RvoOgH0+zXyipYQ
         7HiN5pGh8qLXXE5IFt/vVC7DCQ1PwOxuGVvwaJRGvgkN1qO0QBVNJdQsT+o1iOJHHUr+
         J32KRkgMF4wFjl83BOCBvSpN+zIkIALTgAd1sonlsiKQ0puBRWELDlbOnHlro/kV4j1Q
         YwfA==
X-Gm-Message-State: AOJu0Yzl7im/VVnqOCZQeY2nklOhYQP8gLuZ+ZrKP1DQgRo6tln8W4r/
	MqJSRqdrrENuIrtcT3nDnpNk93tnijtVw9qxEej0GUGGE6XzvNt6yRvbgCT1+eRxj58=
X-Gm-Gg: Acq92OEDSrcmZJdpxJF6lXztg8043vjS5X1s1cQXB7sGUCkla3EtVd6RDN6B1P14w5t
	53gKDvBXv+kEMTl/eIj1zumWh+US2BwlBxX4rGRekDYj8eh/xBXNnacbFGKs18MeCLCNzBJFH2J
	9ISqJw97Aa0l1nbdVIATh4ugskIEae36ZE184Axclc90ZALEUBFQvwwY4pbicoWh8dT4SQpGpOA
	A67koFotifaywXn8ZNB1vunq/9VX7i7qGiM5tgJgYPkuihd+GPiecwTivVwb4LUjK6auEozUPZO
	jp14v/kQrorF1iDOVrfvg7Aktx0XIzKkTOzHIPByTz3qVPpt8374OkMCBqY2RtcMFgKW2NDfgIa
	m3trabacDIlupJJrss3BpdD30qkJWinmok5Q5vV85cEc1u1EQ20I4IH/8QL5bHJxxhtZhWeDmIM
	bRSR3zQNDAHI1xZMFA0dFrw0RZpcOAEQ/aDY9sqpgtl5KMHWoWq0Uma8y2+jRrHA==
X-Received: by 2002:a17:90b:1b47:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-36a671e9069mr17418698a91.0.1779794544803;
        Tue, 26 May 2026 04:22:24 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm15720019a91.9.2026.05.26.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:22:24 -0700 (PDT)
Message-ID: <d2c217ffaae81022cd323394c3c759a8d36d0549.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 3/6] selftests/bpf: test cases for loop
 hierarchy computation
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 26 May 2026 04:22:21 -0700
In-Reply-To: <20260526102514.AFE3C1F000E9@smtp.kernel.org>
References: <20260526-better-1m-reporting-v1-3-51e4f2c59780@gmail.com>
	 <20260526102514.AFE3C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-05-26 at 10:25 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The expected verifier log output in `fwd_edges_no_loop` incorr=
ectly expects an unconditional jump `(05)` for a conditional jump instructi=
on, which will cause the selftest to fail.
> --
>=20
> commit f35c2f4d237eac02dd241fbf85f69d40722f62de
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> selftests/bpf: test cases for loop hierarchy computation
>=20
> This commit adds test cases covering various branches in bpf_compute_loop=
s
> for loop hierarchy computation. It includes tests for single bounded loop=
s,
> independent loops, nested loops, diamond control flow graphs, and irreduc=
ible
> loops.
>=20
> > diff --git a/tools/testing/selftests/bpf/progs/verifier_loop_hierarchy.=
c b/tools/testing/selftests/bpf/progs/verifier_loop_hierarchy.c
> > new file mode 100644
> > index 0000000000000..db26157e3e14a
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/verifier_loop_hierarchy.c
>=20
> [ ... ]
>=20
> > +/* Case C: forward edges, no loops. */
> > +SEC("socket")
> > +__success
> > +__log_level(2)
> > +__msg("=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0: {{.*}=
} (b7) r0 =3D 1")
> > +__msg("=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: {{.*}=
} (05) goto pc+2")
>=20
> [Severity: Medium]
> Will this test case fail because of a mismatch in the expected verifier l=
og?
>=20
> The inline assembly below uses "if r0 > 0 goto 1f;", which is a condition=
al
> jump. This translates to opcode 0x25 (if r0 > 0x0 goto pc+2), but the __m=
sg
> assertion explicitly expects opcode 0x05 (goto pc+2), which is an
> unconditional jump.

The code is adjusted by constant prop phase.
I'll just the test case to call urandom() and keep conditionals.

[...]
