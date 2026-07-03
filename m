Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE7F37F734
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059956; cv=pass; b=M+oFxgdGVWL3jt6ZXBYZzuuwij8qrxALaZacU+ip4+65OLiuST5H/6PDqLMPfV8XoxSdlmHaZklQTa3OhqCz8AnQ6th2sQKdShnEkBBNz1wHnoGtZHWkIvDXIMuy4HCjB7pFYgacy5xeTBHsCNFZKgxBKLpxRUSbyQSZ1Xpw4v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059956; c=relaxed/simple;
	bh=gu23m3G9I8LRrXwsMirKiBM83umbvVFeycfI4F8fQoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORWHGPW8NEDaW/4lSLBLxWqRnxwLPkZummROJTRy4erJPYitLZEYrgzs0myYItI9/4y/3j6TA1j43X1M9aOpUHOoVxvcsI9j9mNS8eZOgaZUe0Z2Qx4lchsfOplVLrdpAxwifh9J3mywIBodkg2I3eRyvTnFQ9dFJ9M0wnMELt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VZRhzvax; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZRhzvax"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9c80265bd7so160783a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 23:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783059954; cv=none;
        d=google.com; s=arc-20260327;
        b=UEbM44WrQla4bVWoKuF7FLIK8iOSNCYDQq3KyjEH0mI+e8OiuMEbKfXXN74phmC5rU
         UIs22AIg9rZVXlnCs37A+3ftHhAcH88A+/+rjPm58fLZi3u/LDtNdyh0oA18gmJRBnon
         LyO6Ln4i5tYSUiUD4ek1AX4nbcmn5XRpm6eTpkBJ/l51MiGOOCVUDK2+2g5alMB6u/T4
         xrYCmrMOini4z/znbjDvmqEFZzIu5BX4rm/YskfJK9PaIrn/dR0HKJhEAQoOjgM9PpKm
         Iyx6rveaxqfjLkb54FDdSu1hEybU1jfL9ugAlsTX+DwmbNtPu8EQk7c2KDOqEwMkq6ET
         2x3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BSF6P/7OY1gFGFz/Cqzg8XWTkIoYPCEYs2S/9aAkdwU=;
        fh=gMAxDzqzrGDiVSmAWJrGWF56V0zu6j5JIOWUFzjaNig=;
        b=KzLOVookOuCPgCktI5w9F0TizhoewiqBSrvO8vzAjSrnY+UTiwbgLUYvZDqPCeZaPT
         8733YRWER3Au+V1e9TVfZi9pQ8C2eyU25CmPwTH80DKqX7rrLr1CshWh4UqVX1VVQNAo
         2+n4XN4gBZO1HeoTu3DUvNw/VUaP9IAbkeNsCNpla5Mae0bHX74y3CvT92GfPjkHAEfC
         EgdPiAadSF7RXegZSxYq8vmyFSmVkQ05K9XZx3eg8n1/qT71oiqH4viIJcX+1Of/dReS
         iUzV+1kAA2HKJ6f1idZCwjP10NdSv6nGapa2UpSGsli3LidyVwczL+Y37ljxR8zFLVoU
         hQ/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783059954; x=1783664754; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSF6P/7OY1gFGFz/Cqzg8XWTkIoYPCEYs2S/9aAkdwU=;
        b=VZRhzvaxfLmjf/Ql7kRCrNUx41v1pgPI+NYlm90VWxTNIMy2OSSSMv85rBnLjm6NyI
         c7dk09P9UnC4mnpVzqDhOMA38NBWIvcEXjQz92s63YT1WmyYSoWO8Rdbm6pdOLs2s58O
         mglZ97+9xV9Xe87yGvHy3j5HKkOQ9+/ZfKmHuEWnMOKMvrzSTfQudkmDPzl8gmtqYsjg
         +dI0n+NEu3QPfdpJz14CprAZxf4vXq7GnS0IlynLHpaPblrPCmDR9rChgFwmJxv81Lnk
         xVM3WLsDWu53X55sIjyDdeUtHzFm5hrgE/1uhmSb9AEeyTDCfvN8RUTNjsxi6vuDNDj8
         Hkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783059954; x=1783664754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSF6P/7OY1gFGFz/Cqzg8XWTkIoYPCEYs2S/9aAkdwU=;
        b=Q9Kk/Bku96M4EoMtnAiZ7XF89duWeXCgLyMLS8dH8HLUAGPiHEAgGtZism5iLoA0KZ
         QD8NFDyKUckHc8htC1jR7OehFPgi8ES18wLowJPtFsrm2s3ViP1ByY0UcHnswThC4Nt2
         Efw/1R1GxSlJLhMPuZ8RB1J+Mq+U0Fmye30ZaQcNFDAkYmVjqOr1f1Cb9fqK5rKgQ1qa
         hllzCZ+GdNqKEvRRoyOkbx/jWUNOYqJ3lf/0Qwq0NM+Q9BRvZoxfmnnqjBwMaN2lDWoh
         PAfajMRE1PDU71URSylkK5pVAh0hvlJhR7Ck/DeSB1C8IRSX7N/IOOd7WvMUUW9wx6tC
         3f6Q==
X-Gm-Message-State: AOJu0YyQJCk5yoGPezBHqEmDhx/Y1oOSRAFKSJfzta9vJpCG7eXouhL3
	6Y2qPpFqmQB3tI2qcVqQqVaZNhyhbfs7biKQnxdjgaOMbDeHsln+fgMYid8agry3salvGIoCxhT
	09cSH++3if2J9gwyLX5mY0pPlPP3hlQXpcaPKtB34
X-Gm-Gg: AfdE7clLlCp/ebfD0X8LC50bqJbTB1X4APY2i2qhy1hIGH+mkqRWKodDkkrnA/F4CQk
	DytjMMr6KaXCRJHOihlnmdTAcy9qwGbnOvs88/8pDdgCfAiF4luW3sWWv+dYdO86LCxjMQjmrZr
	f1Jh73WUMnRtlQrW3q94GEIwJP4/koQNP3yj/V/61XLQX5Z5RbSNBD+VTx8n4sMN36lGglYOt33
	fUkbDJ9voGHyGEK8hnVSVe2PINz/lvWbKGO2scxxFA6HhFxhRmhpwecaUcX25o3nawMo1eIy3p9
	QmDwkY94igd9af74Bw5Rsr2gFaS8IMkTncabRYZyD975Hs+d8fZbF/1sFi15dU81ykrNzooZvyB
	cQZQ6JeNc/vbh+DvniG2ahQhQZobKImKbyNtoKwaI
X-Received: by 2002:a05:6a21:400d:b0:3b7:d8d5:2326 with SMTP id
 adf61e73a8af0-3bfed0e290fmr10485150637.1.1783059953937; Thu, 02 Jul 2026
 23:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782922354.git.namcao@linutronix.de> <e663a83195f3d9f6d7ad4907c37ae3e45c151062.1782922354.git.namcao@linutronix.de>
 <20260702163608.0207A1F00A3A@smtp.kernel.org> <87mrw8sjo3.fsf@yellow.woof>
In-Reply-To: <87mrw8sjo3.fsf@yellow.woof>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 2 Jul 2026 23:25:42 -0700
X-Gm-Features: AVVi8CffnuaY4KiLN4AyhU_3QHylM_R_UciFhQADgsvWNfXQqFEwJUoE2kfoIl0
Message-ID: <CAAVpQUB+LDxRrF66=NKwLAdLN8kt+Hssm_KBc2oc_q6FTJF0VA@mail.gmail.com>
Subject: Re: [PATCH 1/2] af_unix: Do not wait for garbage collector in sendmsg()
To: Nam Cao <namcao@linutronix.de>
Cc: sashiko-reviews@lists.linux.dev, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 10:53=E2=80=AFPM Nam Cao <namcao@linutronix.de> wrot=
e:
>
> sashiko-bot@kernel.org writes:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Garbage collector is no longer scheduled when creating new inf=
light FDs, leading to permanent cycle accumulation and -ETOOMANYREFS failur=
es in isolated environments.
> > --
> >
> > commit 506189bd29f8ad56f5d9e51f3e0216203ebad5ec
> > Author: Nam Cao <namcao@linutronix.de>
> >
> > af_unix: Do not wait for garbage collector in sendmsg()
> >
> > This patch removes the garbage collector scheduling and waiting from th=
e
> > sendmsg() path for AF_UNIX sockets. It aims to prevent priority inversi=
on
> > by relying on RLIMIT_NOFILE limits and asynchronous garbage collection.
> >
> >> diff --git a/net/unix/garbage.c b/net/unix/garbage.c
> >> index 0783555e25266..f180c59b3da9d 100644
> >> --- a/net/unix/garbage.c
> >> +++ b/net/unix/garbage.c
> >> @@ -300,8 +300,6 @@ int unix_prepare_fpl(struct scm_fp_list *fpl)
> >>      if (!fpl->edges)
> >>              goto err;
> >>
> >> -    unix_schedule_gc(fpl->user);
> >> -
> >
> > [Severity: High]
> > Does this removal prevent the garbage collector from running when a pro=
cess
> > creates isolated socket cycles?
> >
> > If a process continuously creates socket cycles (e.g., passing FDs to e=
ach
> > other) and closes its local FDs, the sockets reference each other in th=
eir
> > receive queues, so their file reference counts will not reach zero.
> >
> > Because the refcounts do not drop to zero, unix_release_sock() is never
> > triggered. By removing unix_schedule_gc() from unix_prepare_fpl() here,
> > unix_release_sock() is left as the only trigger for garbage collection.
> >
> > This could allow the inflight count to accumulate indefinitely until it
> > hits RLIMIT_NOFILE, causing subsequent sendmsg() calls to fail with
> > -ETOOMANYREFS and permanently leaking the network namespace unless an
> > unrelated AF_UNIX socket is closed system-wide.
>
> Sashiko found a valid issue here.

This is same with my point, and

> But this is a pre-existing issue. It
> is not introduced in this patch.

your patch makes it much easier to abuse.
UNIX_INFLIGHT_SANE_USER is usually much smaller than
RLIMIT_NOFILE.

unix_schedule_gc() in sendmsg() is to self-regulate malicious users,
otherwise GC relies on unrelated AF_UNIX socket's close() and could
be triggered too late since GC is system-wide.

Previously every sendmsg() had to wait for GC, and now it's only when
there is a circular reference AND user has too many inflight sockets.

Please fix the root cause; the former condition on your system.
--
pw-bot: cr
