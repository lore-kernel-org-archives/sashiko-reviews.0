Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DB3F7AAB
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881460; cv=none; b=q5b3mGu5S38MGxBCeZZOG2HDFZp1DGFe/JFy/c3a1k6B5RYApArVgouQdIc3TV0EXM4i2hJo9/+GK0gP6nbXvOKbY7Zpp2JKs3guOwIrSf5zWoVjRoUf4RKOwg94e1I4PryXJskVsPmgT7gek3vl5afZFps+cxRRA7cnpZrupyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881460; c=relaxed/simple;
	bh=r3p0gSNrpDh+6wnNLHisMohXJjlIuMXp1tbrE5pgqz0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=oaDVQUvSWOcbjnlJu4HplJcnhVg42A6A45jo1i4NQociDnviHMIYGAGrPHKfL2S6JK6hOY2nUrPx5bEFlGNGtqzLDQhS0QsgT8pHNCLEuN88byNuUqKKZKruzCboBD8xz3WUSEeJFQaEH0tBJPmPF2XFYZ5HXKjL7Bw5XQ9CQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0WW4QSC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0WW4QSC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-841513664bbso3268697b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779881449; x=1780486249; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QZ5qiaV6o/rT83Qlu2laa+IgIwU5V8Xgt69ba/3cprk=;
        b=g0WW4QSCqjPNKoITU9MfhrGPoMeUGkmrOqjyhlkXuNlAxp48jk5zfh/pdIK5auv/bj
         KSdKEQrYbBeNiRVYc1ESyFc2RyNM5+OkuKqABgDbz5j2vllmiFiWAnrnaRIT3Q1QmaQm
         I5HFwmFjTJdj0PoyWqEGZSj+CLZkg5l1EJRcbWoxIlqGMgcTsmdecf7t2stDKzVEGn+N
         HGXwofAP33ulyn+y4mqw07xIsja+ZfFovx0aIK7+/fWWhQTvMvvdGXz4XYx7hF/ZsnQ2
         Mjy16eQyGWVxbgi3L20AA5VHq8e1+rx5Y4BDPPFgYpsk7gd0hxGcy9nPdW4FOI3R1gEM
         F1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779881449; x=1780486249;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ5qiaV6o/rT83Qlu2laa+IgIwU5V8Xgt69ba/3cprk=;
        b=XkG/VTpZjuNsaOnOxXXTWYnF9JAqdI/YVL6812NGVV9Jb9t0OibOKdUtRDxVcZJe6+
         /24yQLIWKBFgtwaG2hSuv82VQf8FcraU12UQbqIwTUhikkHmm4DBFOJHQ/hkpBYS1uwf
         /42CdffCLuAUgXKPiNMqOKjURPktv2jFdjhcSgaWq1rsEFXCqn+Vcli0/rUa3Wg99QH+
         2eEOwmFTL38KggYswdqePtuMpZjxzko3J+TdBNwDQTkM6s6V+YN0iumrp1V8/3skiNMw
         2haCLF/IRJXgpaasmibsREoFKckBBcwXRBU1ANtRWC1FBLS3PkC25mKtGPj5mtuUMJvY
         fYjQ==
X-Gm-Message-State: AOJu0YwZEPuAAR5avM+Z3ARgeqAiMmZwxnrVDHyZckZkAVS1bne6qPCk
	UcR5t1RZr2z7cpcT2Bd5R5YV34fs6IT+rctQ9TYDFD65l3LtA1bMJAxO
X-Gm-Gg: Acq92OG9x/wVhLnD31e0G3roefWMJV+eEvcLlHGKUbEb/Cs4sO0I56sOQpBaeFtRgAj
	CVg9S7QeOl8CxKLHXv1dWnzo09P5vbKq8jsMwjb1oS+r1CQyP6jH6h3ofjS7nTRkXtIhPvsoVjf
	7VpcD1IOQpifpl2FI2ZQ8wdfrekqALnVMU6E5QMCvulsVpq96/rRB5DtgNVQOgXqWod8kpjf/yj
	OZMUGV+NFugmPyYrX0RCf1HD1N2lgjcpFgAGwthZSIZtNyRJQ71J3JYYLuSerjxeYnjUXlQjbH2
	1uT4Dbb+HxHUiq8BSmc4KOq7pp8os+kiGwk7vvcbaTcNHomAtaZZBvX5e6NSg7MKNgPuK+52oR6
	YWTkOeSaaem2si/EfYePWpKu5SDV7Fx1y04QaFwzBa5mbbMF6VxnFndpI6jOAXU4pn11O3W7mJx
	OrLYrrVgqFUySmWR5Wf1T5Rw==
X-Received: by 2002:a05:6a00:1bc4:b0:829:7a62:6a with SMTP id d2e1a72fcca58-841611e3202mr16669715b3a.22.1779881449287;
        Wed, 27 May 2026 04:30:49 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6d60d07sm3209200b3a.0.2026.05.27.04.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:30:48 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [RFC v2 3/5] KVM: PPC: selftests: add support for powerpc
In-Reply-To: <20260523123023.64A321F000E9@smtp.kernel.org>
Date: Wed, 27 May 2026 16:46:04 +0530
Message-ID: <se7d6r2j.ritesh.list@gmail.com>
References: <6e0c74f1273a4baf652d84820ae83696e77263d9.1779524962.git.ritesh.list@gmail.com> <20260523123023.64A321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

sashiko-bot@kernel.org writes:

>> diff --git a/tools/testing/selftests/kvm/lib/powerpc/handlers.S b/tools/testing/selftests/kvm/lib/powerpc/handlers.S
>> new file mode 100644
>> --- /dev/null
>> +++ b/tools/testing/selftests/kvm/lib/powerpc/handlers.S
> [ ... ]
>> +virt_handle_interrupt:
>> +	stdu	%r1,-INT_FRAME_SIZE(%r1)
>> +	mr	%r3,%r31
>> +	bl	route_interrupt
>> +	ld	%r4,(32*8)(%r31) /* NIA */
>> +	ld	%r5,(33*8)(%r31) /* MSR */
>> +	ld	%r6,(35*8)(%r31) /* LR */
>> +	ld	%r7,(36*8)(%r31) /* CTR */
>> +	ld	%r8,(37*8)(%r31) /* XER */
>> +	lwz	%r9,(38*8)(%r31) /* CR */
>> +	mtspr	SPR_SRR0,%r4
>> +	mtspr	SPR_SRR1,%r5
>> +	mtlr	%r6
>> +	mtctr	%r7
>> +	mtxer	%r8
>> +	mtcr	%r9
>> +reg=4
>> +	ld	%r0,(0*8)(%r31)
>> +	ld	%r3,(3*8)(%r31)
>> +.rept 28
>> +	ld	reg,(reg*8)(%r31)
>> +	reg=reg+1
>> +.endr
>
> [Severity: Medium]
> Are r1 (stack pointer) and r2 (TOC pointer) missing from the restore sequence?
>
> Since they aren't restored here, tests cannot modify the stack pointer during
> exception handling.
>

The guest exception handling carefully create and destroy the stack
frame during exception handling for running C code.
Also LIBKVM is directly linked in as object files directly into each test
binary, so the call to rout_interrupt() is the same TOC call.

So it's not missing, but we really don't need save/restore of r1 & r2 here.

>
> [Severity: Medium]
> Is it possible for tests to map memory without write or execute permissions
> (e.g., read-only or non-executable pages)?
>
> If so, this assertion will falsely trigger and abort the test during virtual
> to physical address translation. Should this check only verify PTE_VALID and
> PTE_LEAF to support testing diverse page permissions?
>

Yup, that is something which can be relaxed I guess. Will do that in v3.

-ritesh
