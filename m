Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102C3BBA04
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046012; cv=pass; b=fWIlyqjJUNQWeFwMNLX1cULGuXcwXIq7+CPqZ2jvzunDxs8rV23rIeYmrSib98t+0e46Px/TZKNFLfkNEsq8NsgTT+VuyeR+wfzlBUFOeO+B4ufm4IuvFMJjLNrzrcokWQpSZiPouXDMsq7N5zKxvZOFENLfGGhZx+5HFyxQMNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046012; c=relaxed/simple;
	bh=mFgyW51XJtXmhibZbBxCoAPVtlMwzEjgouicA3QDCvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgyYHVTjsZXx2DyQBHhdDdZzMuwE+zSrEJklfp4zX2xqEHJWRnRWjoEhXd4Xbd0EIqMDNgRlm6o7+tFKHvt3p9KBza8jfi+54OgMQPPD6kITZbti5k/JuvgaysySWPTPf5oMEBy4zCj40p1UlXebOAaRlRlJnGAuQjUzpcFDUx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt/megbR; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt/megbR"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dc93d02916so15988457b3.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 02:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780046010; cv=none;
        d=google.com; s=arc-20240605;
        b=Ho1NBipmzdH4s/K3XLtxXnqeWMoGerR950niUhQWxbozeg69zbrD8ldIGLMvG0bqH2
         x0YfGZnflHq4zT1SvHFL3m+8IQ2cmKmjZINvXU6HlBmZ3qVp8T0mDh32I1Ua00es9asC
         yYvyibEjyYTQmunTXcU5Yg+7fMe3p91nPtWTlO6Y3vmu2chrjA/OE26Rt8QSneqTNOjy
         u63vKLGJwd1+Y0cu3PgJE/zMnAuDS7WX7klrcthsDnMctAeRHCmH4QeoOizT9sGyJEEf
         aTjwV882L+LiGTrvAy6mQSq6gGEhIdMx9v7ABWJ/GAAiShFG4LpCY0DQ2UMpI4xZ7Uvs
         ieTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6S6E6qC/OtWWeTZr1Pvf9wjq3ql7UjQmU9GicaWAcg=;
        fh=sJynpV5H0JMsix/etTn2ztlp7pkM+QzKYSPuQj+erEQ=;
        b=dlGte5af43GjXCkp1Vt8h7Ul0H3ExO/wSmR1lskStJtikvOXaSs0nMTMQ80FXnug42
         llVAMh/Y15dmvur8fPGrBzRupiiaAvHmu9q7I1oTcHk3if7f2os70T42+cbFR+5a5lgd
         1xW9164L6/o2qzayCwhUcLo872yhKkc456l/JjDcUgncvJSyT9yuMke2OAgNwzAS37pk
         gulf4GthXkGuFvWj38lnf642bnNoC/gjS7EOgp3m+R7zMI/FMGzpVqfIseDSiht7z0ET
         0tq7FhJLi+2UkDDr9BBJlo010qaY7wj6HAhy28sYMGcOH9UwVwlKqE8n52MjradKJS14
         LveA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046010; x=1780650810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6S6E6qC/OtWWeTZr1Pvf9wjq3ql7UjQmU9GicaWAcg=;
        b=Gt/megbRpDiIhZ7SXttn1h/sHYB4rRmKO0zQufl6fvGHsjGbfAcxR90gZT235pUDKd
         bEYqyuWsp6exlhfhEugDy1tTDPnjrKagUZSQaYrDmnKCzNtcYwNmjoQMg5Bm4hYF/RVu
         eN2SIBMPskcPvaFRmodKJ3VJSLuz5Tf0CnDBo+1RRAQYxAFVpD9zSoUvJrz+hG2sMxNB
         yIi65rwsuaphO02y4fNrbFD/hV3yLyLw28xZ1trDKKLuTlzUIUTxFQVRqKnoq0xVJauR
         eAtvwsuZk6F9HShRTT7m9q6shGZxXb1JLmhly9RFGfDLgxQDQE7PIEkJ/gf8DXvOzyHz
         clhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046010; x=1780650810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6S6E6qC/OtWWeTZr1Pvf9wjq3ql7UjQmU9GicaWAcg=;
        b=qVhxLmM7evEUv11Q4IWsy8FZgo8thGd6tb9oBRygiNLn3i6LtGBR02oL7qk9Khopol
         WsYrbA/BKvExKKKILJeYDX4m1Wc9YxYPfFVzGaBJNF+lX86F0OI8wdrjtefNEAxgk8mz
         otT6gf/BcoFWCBtfy+s3AaBHJi+/naMFNkfq+pX/135N9qoIno92ik4cq+E7H0LHuoJl
         tM45k8wPSXqjMsbcVRiLu1/5VXJpra4rRCkItbNvIJIahHqUZX9uRcu0AbTybJTmMWUA
         fafSryM0j9OVlMpgIAEHcccpeFE9I7AdPDCSdgbdAKBw8C+t+DtuMwbgcHgROLXmrUNG
         DdTw==
X-Gm-Message-State: AOJu0Yyw6c8KuoujR0hpDG4lYH6C7xDmFs1kWwIw+YlsZDbUTFdC+BZA
	wXvIAE8bh6ZwFlqqTgKDIyOth2+X/Wl9e8y/Y7LL3FnGw2C2yPd1cLUmVMr6h/MX9pNWm9rNEUp
	DLolZfBajFQDrYFYtxEZAD+yy0L0u733AxFkrzFM4ew==
X-Gm-Gg: Acq92OGqGYy5SX1zeHBPstAHCRcGQ1YwHBppYFxtXQmA1zVMonYsQ/cWyhpy84P2zTp
	rNVdUmyzi0XBTk5yvFh4gbhm1c6Vybp0PPSM5agL0uh2GpoHYZ8LcT+wPIYbIY59IBLJuzmqYxb
	jHM/BKSekpx/ViE6TzsuMZ6UatXUz/wIrpjLiOP9kmUG12Co3zLze8PgTH6oK/XhPhuW7mJV19V
	psb8Lk+aLIyJhCxdXksfpbuNy7R+W/D19MQ8TYvXoUVy/2OK2so9QiBIyCawsCN8cVEcK6EUCXS
	xSCO68tVBx0xGkUJAnw6XM9++cgoAiRn/zTYcZIfxfHPeHQ81w==
X-Received: by 2002:a05:690c:610a:b0:7a4:80ce:8275 with SMTP id
 00721157ae682-7de4ba34f6cmr13666347b3.35.1780046010439; Fri, 29 May 2026
 02:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529034542.68766-5-laoar.shao@gmail.com> <20260529051659.BEA391F00893@smtp.kernel.org>
In-Reply-To: <20260529051659.BEA391F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 29 May 2026 17:12:53 +0800
X-Gm-Features: AVHnY4ICwHysqK3ued6uXyRS3cOpRunwhARwEIjxHUzL-4Ob9NoMLNSbAzL8Ba8
Message-ID: <CALOAHbAbz6BFMj+T5QSj672+kxig5FCx13OWth4BHZVhQXLB-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] selftests/livepatch: Update tests for replace_set
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, mbenes@suse.cz, song@kernel.org, joe.lawrence@redhat.com, 
	pmladek@suse.com, jpoimboe@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The 'atomic replace livepatch' test case in test-livepatch.sh =
was completely removed instead of being updated, resulting in lost test cov=
erage and leaving behind dead variables.
> --
>
> commit 99bb60c2ba8319ec21289c482f1ea304e282396c
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> selftests/livepatch: Update tests for replace_set
>
> This commit updates the livepatch selftests to use "replace_set" instead
> of "replace". It configures different livepatches to share or have differ=
ent
> replace_sets to test atomic and non-atomic replace behaviors.
>
> > diff --git a/tools/testing/selftests/livepatch/test-livepatch.sh b/tool=
s/testing/selftests/livepatch/test-livepatch.sh
> > index c44c5341a2f1e..042999856267f 100755
> > --- a/tools/testing/selftests/livepatch/test-livepatch.sh
> > +++ b/tools/testing/selftests/livepatch/test-livepatch.sh
> [ ... ]
> > @@ -108,96 +108,6 @@ livepatch: '$MOD_LIVEPATCH1': completing unpatchin=
g transition
> >  livepatch: '$MOD_LIVEPATCH1': unpatching complete
> >  % rmmod $MOD_LIVEPATCH1"
> >
> > -
> > -# - load a livepatch that modifies the output from /proc/cmdline and
> > -#   verify correct behavior
> > -# - load two additional livepatches and check the number of livepatch =
modules
> > -#   applied
> > -# - load an atomic replace livepatch and check that the other three mo=
dules were
> > -#   disabled
> > -# - remove all livepatches besides the atomic replace one and verify t=
hat the
> > -#   atomic replace livepatch is still active
> > -# - remove the atomic replace livepatch and verify that none are activ=
e
> > -
> > -start_test "atomic replace livepatch"
> > -
> > -load_lp $MOD_LIVEPATCH1
>
> [Severity: Medium]
> Was this test case intentionally removed completely instead of being upda=
ted for
> the new replace_set semantics?
>
> The commit message does not mention removing this test. This removal caus=
es a
> loss of test coverage that previously verified an atomic replace successf=
ully
> disables multiple existing livepatches.

This test case is invalid for the replace_set, since only one
livepatch will be replaced.

>
> Additionally, removing this test leaves the script variables MOD_LIVEPATC=
H2
> and MOD_LIVEPATCH3 unused in test-livepatch.sh. Could this test be adapte=
d
> to use replace_set instead?

I will update it.

--=20
Regards
Yafang
